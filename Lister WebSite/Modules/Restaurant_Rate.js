class Restaurant_Rate {
    constructor(Restaurant_Rate_id, Customer_id,Restaurant_id,rate, rate_date_time,q1,q2,q3,description) {
        this.Restaurant_Rate_id = Restaurant_Rate_id;
        this.Customer_id = Customer_id;
        this.Restaurant_id = Restaurant_id;
        this.rate = rate;
        this.rate_date_time = rate_date_time;
        this.q1 = q1;
        this.q2 = q2;
        this.q3 = q3;
        this.description = description;
    }
    getRestaurant_Rate_id() {
        return this.Restaurant_Rate_id;
    }
    setRestaurant_Rate_id(Restaurant_Rate_id) {
        this.Restaurant_Rate_id = Restaurant_Rate_id
    }
    getCustomer_id() {
        return this.Customer_id;
    }
    setCustomer_id(Customer_id) {
        this.Customer_id = Customer_id
    }
    getrate() {
        return this.rate;
    }
    setrate(rate) {
        this.rate = rate
    }
    getrate_date_time() {
        return this.rate_date_time;
    }
    setrate_date_time(rate_date_time) {
        this.rate_date_time = rate_date_time
    }
     getq1() {
        return this.q1;
    }
    setq1(q1) {
        this.q1 = q1
    }
    getq2() {
        return this.q2;
    }
    setq2(q2) {
        this.q2 = q2
    }
    getq3() {
        return this.q3;
    }
    setq3(q3) {
        this.q3 = q3
    }
    getdescription() {
        return this.description;
    }
    setdescription(description) {
        this.description = description
    }
    getRestaurant_id() {
        return this.Restaurant_id;
    }
    setdescription(Restaurant_id) {
        this.Restaurant_id = Restaurant_id
    }
}
export default Restaurant_Rate;

