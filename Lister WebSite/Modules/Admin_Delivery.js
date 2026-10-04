class Admin_Delivery {
    constructor( Admin_delivery_Id, First_Name,Last_Name,Birth_Date, Address, PhoneNumber,Email,Password,Image,hire_Date,End_Date,Status,city_id) {
        this.Admin_delivery_Id = Admin_delivery_Id;
        this.First_Name = First_Name;
        this.Last_Name = Last_Name;
        this.Birth_Date = Birth_Date;
        this.Email = Email;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.Password = Password;
        this.Image = Image;
        this.hire_Date = hire_Date;
        this.End_Date = End_Date;
        this.Status = Status;
        this.city_id =city_id;
    }
       getAdmin_delivery_Id() {
        return this.Admin_delivery_Id;
    }
    setAdmin_delivery_Id(Admin_delivery_Id) {
        this.Admin_delivery_Id = Admin_delivery_Id
    }
    getFirst_Name() {
        return this.First_Name;
    }
    setFirst_Name(First_Name) {
        this.First_Name = First_Name
    }
    getLast_Name() {
        return this.Last_Name;
    }
    setLast_Name(Last_Name) {
        this.Last_Name = Last_Name
    }
    getBirth_Date() {
        return this.Birth_Date;
    }
    setBirth_Date(Birth_Date) {
        this.Birth_Date = Birth_Date
    }
    getEmail() {
        return this.Email;
    }
    setEmail(Email) {
        this.Email = Email
    }
    getPhoneNumber() {
        return this.PhoneNumber;
    }
    setPhoneNumber(PhoneNumber) {
        this.PhoneNumber = PhoneNumber
    }
       getAddress() {
        return this.Address;
    }
    setAddress(Address) {
        this.Address = Address
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
    getEnd_Date() {
        return this.End_Date;
    }
    setEnd_Date(End_Date) {
        this.End_Date = End_Date
    }
    gethire_Date() {
        return this.hire_Date;
    }
    sethire_Date(hire_Date) {
        this.hire_Date = hire_Date
    }
    getStatus() {
        return this.Status;
    }
    setStatus(Status) {
        this.Status = Status
    }
    getcity_id() {
        return this.city_id;
    }
    setcity_id(city_id) {
        this.city_id = city_id
    }

}
export default  Admin_Delivery;