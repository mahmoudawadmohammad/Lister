using ListerAPI.Data;
using ListerAPI.Helpers;
using ListerAPI.Models;
using ListerAPI.Repository;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllers().AddNewtonsoftJson();
            services.AddDbContext<restodbContext>(options => options.UseMySQL(Configuration.GetConnectionString("RestoDB")));
            services.AddTransient<IAdminsRepository, AdminsRepository>();
            services.AddTransient<ICitiesRepository, CitiesRepository>();
            services.AddTransient<IComplaintsRepository, ComplaintsRepository>();
            services.AddTransient<ICustomersRepository, CustomersRepository>();
            services.AddTransient<IDeliveryMenRepository, DeliveryMenRepository>();
            services.AddTransient<IDiscountRepository, DiscountRepository>();
            services.AddTransient<IItemsRepository, ItemsRepository>();
            services.AddTransient<IItemsRateRepository, ItemsRateRepository>();
            services.AddTransient<IItemsHasDiscountRepository, ItemsHasDiscountRepository>();
            services.AddTransient<IOrderItemsRepository, OrderItemsRepository>();
            services.AddTransient<IOrdersRepository, OrdersRepository>();
            services.AddTransient<IReservationsRepository, ReservationsRepository>();
            services.AddTransient<IRestaurantsRepository, RestaurantsRepository>();
            services.AddTransient<IRestaurantsRateRepository, RestaurantsRateRepository>();
            services.AddTransient<IOwnersRepository, OwnersRepository>();
            services.AddTransient<ITypesRepository, TypesRepository>();
            services.AddAutoMapper(typeof(Startup));
            services.AddTransient<SearchEngine>();
            services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                {
                    builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
                });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseCors();

            app.UseAuthorization();

            app.UseStaticFiles();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.Run(async (context) =>
            {
                await context.Response.WriteAsync("Could Not Find Anything");
            });
        }
    }
}
