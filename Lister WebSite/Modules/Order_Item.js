class Order_Item {
    constructor( Order_Id, item_id,quantity,unit_price) {
        this.Order_Id = Order_Id;
        this.item_id = item_id;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }
    getOrder_Id() {
        return this.Order_Id;
    }
    setOrder_Id(Order_Id) {
        this.Order_Id = Order_Id
    }
    getitem_id() {
        return this.item_id;
    }
    setitem_id( item_id) {
        this.item_id =item_id
    }
    getquantity() {
        return this.quantity;
    }
    setquantity(quantity) {
        this.quantity = quantity
    }
    getunit_price() {
        return this.unit_price;
    }
    setunit_price(unit_price) {
        this.unit_price = unit_price
    }
}
export default Order_Item;
