class Orders {
    constructor(Order_id, date_time, status, expected_time,comments,customer_id,Restaurant_id,Delivery_Man_id,Discount_id) {
        this.Order_id = Order_id;
        this.date_time = date_time;
        this.status = status;
        this.expected_time = expected_time;
        this.comments = comments;
        this.customer_id = customer_id;
        this.Restaurant_id = Restaurant_id; 
        this.Delivery_Man_id = Delivery_Man_id;
        this.Discount_id = Discount_id;
    }
    getOrder_id() {
        return this.Order_id;
    }
    setOrder_id(Order_id) {
        this.Order_id = Order_id
    }
    getdate_time() {
        return this.date_time;
    }
    setdate_time(date_time) {
        this.date_time = date_time
    }
    getstatus() {
        return this.status;
    }
    setstatus(status) {
        this.status = status
    }
    getexpected_time() {
        return this.expected_time;
    }
    setexpected_time(expected_time) {
        this.expected_time = expected_time
    }
      getcomments() {
        return this.comments;
    }
    setcomments(comments) {
        this.comments = comments
    }
    getcustomer_id() {
        return this.customer_id;
    }
    setcustomer_id(customer_id) {
        this.customer_id = customer_id
    }
    getRestaurant_id() {
        return this.Restaurant_id;
    }
    setRestaurant_id(Restaurant_id) {
        this.Restaurant_id = Restaurant_id
    }
    getDelivery_Man_id() {
        return this.Delivery_Man_id;
    }
    setDelivery_Man_id(Delivery_Man_id) {
        this.Delivery_Man_id = Delivery_Man_id
    }
    getDiscount_id() {
        return this.Discount_id;
    }
    setDiscount_id(Discount_id) {
        this.Discount_id = Discount_id
    }
}
export default Orders;
