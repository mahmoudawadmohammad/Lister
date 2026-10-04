using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

#nullable disable

namespace ListerAPI.Data
{
    public partial class restodbContext : DbContext
    {
        public restodbContext()
        {
        }

        public restodbContext(DbContextOptions<restodbContext> options, IConfiguration configuration)
            : base(options)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Complaint> Complaints { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<DeliveryMan> DeliveryMen { get; set; }
        public virtual DbSet<Discount> Discounts { get; set; }
        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<ItemsHasDiscount> ItemsHasDiscounts { get; set; }
        public virtual DbSet<ItemsRate> ItemsRates { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<Owner> Owners { get; set; }
        public virtual DbSet<Reservation> Reservations { get; set; }
        public virtual DbSet<Restaurant> Restaurants { get; set; }
        public virtual DbSet<RestaurantsRate> RestaurantsRates { get; set; }
        public virtual DbSet<Type> Types { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL(Configuration.GetConnectionString("RestoDB"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>(entity =>
            {
                entity.HasKey(e => new { e.AdminId, e.CityId })
                    .HasName("PRIMARY");

                entity.ToTable("admins");

                entity.HasIndex(e => e.CityId, "fk_Admins_Cities1_idx");

                entity.Property(e => e.AdminId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Admin_id");

                entity.Property(e => e.CityId).HasColumnName("City_id");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("address");

                entity.Property(e => e.BirthDate)
                    .HasColumnType("date")
                    .HasColumnName("birth_date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(70)
                    .HasColumnName("email");

                entity.Property(e => e.EndDate)
                    .HasColumnType("date")
                    .HasColumnName("end_date");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("first_name");

                entity.Property(e => e.HireDate)
                    .HasColumnType("date")
                    .HasColumnName("hire_date");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("image");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(25)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(12)
                    .HasColumnName("phone");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("status");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Admins)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Admins_Cities1");
            });

            modelBuilder.Entity<City>(entity =>
            {
                entity.ToTable("cities");

                entity.Property(e => e.CityId).HasColumnName("City_id");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(15)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Complaint>(entity =>
            {
                entity.ToTable("complaints");

                entity.Property(e => e.ComplaintId).HasColumnName("complaint_ID");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnType("varchar(5000)")
                    .HasColumnName("description");

                entity.Property(e => e.To)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("to");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("type");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.HasKey(e => new { e.CustomerId, e.CityId })
                    .HasName("PRIMARY");

                entity.ToTable("customers");

                entity.HasIndex(e => e.CityId, "fk_Customers_Cities1_idx");

                entity.Property(e => e.CustomerId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Customer_id");

                entity.Property(e => e.CityId).HasColumnName("City_id");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("address");

                entity.Property(e => e.BirthDate)
                    .HasColumnType("date")
                    .HasColumnName("birth_date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(70)
                    .HasColumnName("email");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("first_name");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("image");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(25)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(12)
                    .HasColumnName("phone");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("status");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Customers_Cities1");
            });

            modelBuilder.Entity<DeliveryMan>(entity =>
            {
                entity.HasKey(e => new { e.DeliveryManId, e.CityId })
                    .HasName("PRIMARY");

                entity.ToTable("delivery_men");

                entity.HasIndex(e => e.CityId, "fk_Delivery_Men_Cities1_idx");

                entity.Property(e => e.DeliveryManId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Delivery_Man_id");

                entity.Property(e => e.CityId).HasColumnName("City_id");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("address");

                entity.Property(e => e.BirthDate)
                    .HasColumnType("date")
                    .HasColumnName("birth_date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(70)
                    .HasColumnName("email");

                entity.Property(e => e.EndDate)
                    .HasColumnType("date")
                    .HasColumnName("end_date");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("first_name");

                entity.Property(e => e.HireDate)
                    .HasColumnType("date")
                    .HasColumnName("hire_date");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("image");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(25)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(12)
                    .HasColumnName("phone");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("status");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.DeliveryMen)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Delivery_Men_Cities1");
            });

            modelBuilder.Entity<Discount>(entity =>
            {
                entity.HasKey(e => new { e.DiscountId, e.RestaurantId })
                    .HasName("PRIMARY");

                entity.ToTable("discount");

                entity.HasIndex(e => e.RestaurantId, "fk_Discount_Restaurants1_idx");

                entity.Property(e => e.DiscountId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Discount_ID");

                entity.Property(e => e.RestaurantId).HasColumnName("Restaurant_id");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnType("varchar(5000)")
                    .HasColumnName("description");

                entity.Property(e => e.End).HasColumnName("end");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("image");

                entity.Property(e => e.NumberOfOrders)
                    .HasColumnName("number_of_orders")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.Percentage).HasColumnName("percentage");

                entity.Property(e => e.RequerdPrice)
                    .HasColumnName("requerd_price")
                    .HasDefaultValueSql("'1000'");

                entity.Property(e => e.SimplifiedExplanation)
                    .IsRequired()
                    .HasMaxLength(75)
                    .HasColumnName("simplified_explanation");

                entity.Property(e => e.Start).HasColumnName("start");
            });

            modelBuilder.Entity<Item>(entity =>
            {
                entity.HasKey(e => new { e.ItemsId, e.TypeId, e.RestaurantId })
                    .HasName("PRIMARY");

                entity.ToTable("items");

                entity.HasIndex(e => e.RestaurantId, "fk_Items_Restaurants1_idx");

                entity.HasIndex(e => e.TypeId, "fk_Items_Types1_idx");

                entity.Property(e => e.ItemsId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Items_id");

                entity.Property(e => e.TypeId).HasColumnName("Type_id");

                entity.Property(e => e.RestaurantId).HasColumnName("Restaurant_id");

                entity.Property(e => e.Description)
                    .HasMaxLength(2000)
                    .HasColumnName("description");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("name");

                entity.Property(e => e.Photo)
                    .HasMaxLength(255)
                    .HasColumnName("photo");

                entity.Property(e => e.PreparingTime)
                    .HasColumnType("tinyint")
                    .HasColumnName("preparing_time");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.Status)
                    .HasMaxLength(45)
                    .HasColumnName("status");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Items)
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Items_Types1");
            });

            modelBuilder.Entity<ItemsHasDiscount>(entity =>
            {
                entity.HasKey(e => new { e.ItemsId, e.DiscountId })
                    .HasName("PRIMARY");

                entity.ToTable("items_has_discount");

                entity.HasIndex(e => e.DiscountId, "fk_Items_has_Discount_Discount1_idx");

                entity.HasIndex(e => e.ItemsId, "fk_Items_has_Discount_Items1_idx");

                entity.Property(e => e.ItemsId).HasColumnName("Items_id");

                entity.Property(e => e.DiscountId).HasColumnName("Discount_ID");
            });

            modelBuilder.Entity<ItemsRate>(entity =>
            {
                entity.HasKey(e => new { e.ItemsId, e.CustomerId })
                    .HasName("PRIMARY");

                entity.ToTable("items_rate");

                entity.HasIndex(e => e.CustomerId, "fk_Items_Rate_Customers1_idx");

                entity.Property(e => e.ItemsId).HasColumnName("Items_id");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_id");

                entity.Property(e => e.Description)
                    .HasMaxLength(500)
                    .HasColumnName("description");

                entity.Property(e => e.Question1)
                    .HasMaxLength(1)
                    .HasColumnName("question1")
                    .HasDefaultValueSql("'0'");

                entity.Property(e => e.Question2)
                    .HasMaxLength(1)
                    .HasColumnName("question2")
                    .HasDefaultValueSql("'0'");

                entity.Property(e => e.Question3)
                    .HasMaxLength(1)
                    .HasColumnName("question3")
                    .HasDefaultValueSql("'0'");

                entity.Property(e => e.Rate)
                    .IsRequired()
                    .HasMaxLength(5)
                    .HasColumnName("rate");

                entity.Property(e => e.RateDateTime).HasColumnName("rate_date_time");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasKey(e => new { e.OrderId, e.CustomerId, e.RestaurantId, e.DeliveryManId })
                    .HasName("PRIMARY");

                entity.ToTable("orders");

                entity.HasIndex(e => e.DiscountId, "Discount_ID_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.CustomerId, "fk_Orders_Customers_idx");

                entity.HasIndex(e => e.DeliveryManId, "fk_Orders_Delivery_Men1_idx");

                entity.HasIndex(e => e.DiscountId, "fk_Orders_Discount1_idx");

                entity.HasIndex(e => e.RestaurantId, "fk_Orders_Restaurants1_idx");

                entity.Property(e => e.OrderId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Order_id");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_id");

                entity.Property(e => e.RestaurantId).HasColumnName("Restaurant_id");

                entity.Property(e => e.DeliveryManId).HasColumnName("Delivery_Man_id");

                entity.Property(e => e.Comments)
                    .HasMaxLength(2000)
                    .HasColumnName("comments");

                entity.Property(e => e.DateTime).HasColumnName("date_time");

                entity.Property(e => e.DiscountId).HasColumnName("Discount_ID");

                entity.Property(e => e.ExpectedTime).HasColumnName("expected_time");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(1)
                    .HasColumnName("status");
            });

            modelBuilder.Entity<OrderItem>(entity =>
            {
                entity.HasKey(e => new { e.OrderId, e.ItemsId })
                    .HasName("PRIMARY");

                entity.ToTable("order_items");

                entity.HasIndex(e => e.ItemsId, "fk_Order_Items_Items1_idx");

                entity.Property(e => e.OrderId).HasColumnName("Order_id");

                entity.Property(e => e.ItemsId).HasColumnName("Items_id");

                entity.Property(e => e.Quantity)
                    .HasColumnType("tinyint")
                    .HasColumnName("quantity");

                entity.Property(e => e.UnitPrice).HasColumnName("unit_price");
            });

            modelBuilder.Entity<Owner>(entity =>
            {
                entity.HasKey(e => new { e.OwnerId, e.CityId })
                    .HasName("PRIMARY");

                entity.ToTable("owners");

                entity.HasIndex(e => e.CityId, "fk_Owners_Cities1_idx");

                entity.Property(e => e.OwnerId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Owner_id");

                entity.Property(e => e.CityId).HasColumnName("City_id");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("address");

                entity.Property(e => e.BirthDate)
                    .HasColumnType("date")
                    .HasColumnName("birth_date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(70)
                    .HasColumnName("email");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("first_name");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("image");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(25)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(12)
                    .HasColumnName("phone");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("status");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Owners)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Owners_Cities1");
            });

            modelBuilder.Entity<Reservation>(entity =>
            {
                entity.HasKey(e => new { e.ReservationId, e.CustomerId, e.RestaurantId })
                    .HasName("PRIMARY");

                entity.ToTable("reservations");

                entity.HasIndex(e => e.CustomerId, "fk_Reservations_Customers1_idx");

                entity.HasIndex(e => e.RestaurantId, "fk_Reservations_Restaurants1_idx");

                entity.Property(e => e.ReservationId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Reservation_id");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_id");

                entity.Property(e => e.RestaurantId).HasColumnName("Restaurant_id");

                entity.Property(e => e.Comments)
                    .HasMaxLength(2000)
                    .HasColumnName("comments");

                entity.Property(e => e.DateTime).HasColumnName("date_time");

                entity.Property(e => e.EdateTime).HasColumnName("edate_time");

                entity.Property(e => e.PersonesNumber)
                    .HasColumnType("tinyint")
                    .HasColumnName("persones_number");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(1)
                    .HasColumnName("status");

                entity.Property(e => e.TablesNumber)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("tables_number");
            });

            modelBuilder.Entity<Restaurant>(entity =>
            {
                entity.HasKey(e => new { e.RestaurantId, e.OwnerId, e.CityId })
                    .HasName("PRIMARY");

                entity.ToTable("restaurants");

                entity.HasIndex(e => e.CityId, "fk_Restaurants_Cities1_idx");

                entity.HasIndex(e => e.OwnerId, "fk_Restaurants_Owners1_idx");

                entity.Property(e => e.RestaurantId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Restaurant_id");

                entity.Property(e => e.OwnerId).HasColumnName("Owner_id");

                entity.Property(e => e.CityId).HasColumnName("City_id");

                entity.Property(e => e.Activation)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("activation");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("address");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(70)
                    .HasColumnName("email");

                entity.Property(e => e.Layout)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("layout");

                entity.Property(e => e.Logo)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("logo");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(25)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(12)
                    .HasColumnName("phone");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("status");

                entity.Property(e => e.TotalTables)
                    .HasColumnType("tinyint")
                    .HasColumnName("total_tables");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(1)
                    .HasColumnName("type");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Restaurants)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Restaurants_Cities1");
            });

            modelBuilder.Entity<RestaurantsRate>(entity =>
            {
                entity.HasKey(e => new { e.RestaurantId, e.CustomerId })
                    .HasName("PRIMARY");

                entity.ToTable("restaurants_rate");

                entity.HasIndex(e => e.CustomerId, "fk_Restaurants_Rate_Customers1");

                entity.HasIndex(e => e.RestaurantId, "fk_Restaurants_Rate_Restaurants1_idx");

                entity.Property(e => e.RestaurantId).HasColumnName("Restaurant_id");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_id");

                entity.Property(e => e.Description)
                    .HasMaxLength(500)
                    .HasColumnName("description");

                entity.Property(e => e.Question1)
                    .HasMaxLength(1)
                    .HasColumnName("question1")
                    .HasDefaultValueSql("'0'");

                entity.Property(e => e.Question2)
                    .HasMaxLength(1)
                    .HasColumnName("question2")
                    .HasDefaultValueSql("'0'");

                entity.Property(e => e.Question3)
                    .HasMaxLength(1)
                    .HasColumnName("question3")
                    .HasDefaultValueSql("'0'");

                entity.Property(e => e.Rate)
                    .IsRequired()
                    .HasMaxLength(5)
                    .HasColumnName("rate");

                entity.Property(e => e.RateDateTime).HasColumnName("rate_date_time");
            });

            modelBuilder.Entity<Type>(entity =>
            {
                entity.ToTable("types");

                entity.Property(e => e.TypeId).HasColumnName("Type_id");

                entity.Property(e => e.TypeName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .HasColumnName("type_name");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
