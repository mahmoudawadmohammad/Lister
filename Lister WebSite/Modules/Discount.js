class Discount {
    constructor(discountId, number_of_orders, required_price, percentage,img, start_date, End_date, description,simplified_explination,restaurant_id ) {
        this.discountId = discountId;
        this.number_of_orders = number_of_orders;
        this.required_price = required_price;
        this.percentage = percentage;
        this.img = img;
        this.start_date = start_date;
        this.End_date = End_date;
        this.description = description;
        this.simplified_explination = simplified_explination;
        this.restaurant_id = restaurant_id;
    }
    getdiscountId() {
        return this.discountId;
    }
    setdiscountId(discountId) {
        this.discountId = discountId
    }
    getnumber_of_orders() {
        return this.number_of_orders;
    }
    setnumber_of_orders(number_of_orders) {
        this.number_of_orders = number_of_orders
    }
    getrequired_price() {
        return this.required_price;
    }
    setrequired_price(required_price) {
        this.required_price = required_price
    }
    getpercentage() {
        return this.percentage;
    }
    setpercentage(percentage) {
        this.percentage = percentage
    }
     getimg() {
        return this.img;
    }
    setimg(img) {
        this.img = img
    }
    getstart_date() {
        return this.start_date;
    }
    setstart_date(start_date) {
        this.start_date = start_date
    }
    getEnd_date() {
        return this.End_date;
    }
    setEnd_date(End_date) {
        this.End_date = End_date
    }
    getdescription() {
        return this.description;
    }
    setdescription(description) {
        this.description = description
    }
     getsimplified_explination() {
        return this.simplified_explination;
    }
    setsimplified_explination(simplified_explination) {
        this.simplified_explination = simplified_explination
    }
    getrestaurant_id () {
        return this.restaurant_id ;
    }
    setrestaurant_id (restaurant_id ) {
        this.restaurant_id  = restaurant_id 
    }
}
export default Discount;

