class Customer_Owner {
    constructor(customer_owner_Id, First_Name,Last_Name,Birth_Date, Address, PhoneNumber,Email,Password,Image,Status,city) {
        this.customer_owner_Id = customer_owner_Id;
        this.First_Name = First_Name;
        this.Last_Name = Last_Name;
        this.Birth_Date = Birth_Date;
        this.Email = Email;
        this.Birth_Date = Birth_Date;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.Password = Password;
        this.Image = Image;
        this.Status = Status;
        this.city =city;
    }
       getcustomer_owner_Id() {
        return this.customer_owner_Id;
    }
    setcustomer_owner_Id(customer_owner_Id) {
        this.customer_owner_Id = customer_owner_Id
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
    setPBirth_Date(Birth_Date) {
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
    getStatus() {
        return this.Status;
    }
    setStatus(Status) {
        this.Status = Status
    }
       getcity() {
        return this.city;
    }
    setcity(city) {
        this.city = city
    }

}
export default Customer_Owner;