class Restaurants {
    constructor( Restaurant_id,Name, Address, PhoneNumber,total_tables,Password,Image,layout,activation,Status,Email,City_id,Owner_id,type) {
        this.Restaurant_id = Restaurant_id;
        this.Name = Name;
        this.Owner_id= Owner_id;
        this.Email = Email;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.Password = Password;
        this.Image = Image;
        this.layout = layout;
        this.activation = activation;
        this.Status = Status;
        this.City_id =City_id;
        this.type =type;
        this.total_tables =total_tables;
    }
       getRestaurant_id() {
        return this.Restaurant_id;
    }
    setRestaurant_id(Restaurant_id) {
        this.Restaurant_id = Restaurant_id
    }
    getName() {
        return this.Name;
    }
    setName(Name) {
        this.Name = Name
    }
    getOwner_id() {
        return this.Owner_id;
    }
    setOwner_id(Owner_id) {
        this.Owner_id= Owner_id
    }
    gettotal_tables() {
        return this.total_tables;
    }
    setPtotal_tables(total_tables) {
        this.total_tables = total_tables
    }
    getEmail() {
        return this.Email;
    }
    setEmail(Email) {
        this.Email = Email
    }
    getPhoneNumber() {
        return this.phoneNumber;
    }
    setPhoneNumber(phoneNumber) {
        this.phoneNumber = phoneNumber
    }
       getAddress() {
        return this.address;
    }
    setAddress(address) {
        this.address = address
    }
    getPassword() {
        return this.Password;
    }
    setPassword(Password) {
        this.Password = Password
    }
    getImage() {
        return this.Image;
    }
    setImage(Image) {
        this.Image = Image
    }
    getactivation() {
        return this.activation;
    }
    setactivation(activation) {
        this.activation = activation
    }
    getlayout() {
        return this.layout;
    }
    setlayout(layout) {
        this.layout = layout
    }
    getStatus() {
        return this.Status;
    }
    setStatus(Status) {
        this.Status = Status
    }
       getCity_id() {
        return this.City_id;
    }
    setCity_id(City_id) {
        this.City_id = City_id
    }
    settotal_tables(total_tables) {
        this.total_tables = total_tables
    }
    gettotal_tables() {
        return this.total_tables;
    }
    settotal_tables(total_tables) {
        this.total_tables = total_tables
    }
    gettype() {
        return this.type;
    }
    settype(type) {
        this.type = type
    }
}
export default Restaurants;