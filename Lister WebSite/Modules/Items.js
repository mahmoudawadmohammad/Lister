class Items {
    constructor(ItemsId, Name, description, price,photo,preparing_time,status,Type_id,Resturant_id ) {
        this.ItemsId = ItemsId;
        this.Name = Name;
        this.description = description;
        this.price = price;
        this.photo = photo;
        this.preparing_time = preparing_time;
        this.status = status;   
        this.Type_id = Type_id;
        this.Resturant_id  = Resturant_id ;   
    }

    getItemsId() {
        return this.ItemsId;
    }
    setItemsId(ItemsId) {
        this.ItemsId = ItemsId
    }
    getName() {
        return this.Name;
    }

    setName(Name) {
        this.Name = Name
    }
    getdescription() {
        return this.description;
    }
    setdescription(description) {
        this.description = description
    }
    getprice() {
        return this.price;
    }
    setprice(price) {
        this.price = price
    }
    getphoto() {
        return this.photo;
    }
    setphoto(photo) {
        this.photo = photo
    }
     getpreparing_time() {
        return this.preparing_time;
    }
    setphoto(preparing_time) {
        this.preparing_time = preparing_time
    }
    getstatus() {
        return this.status;
    }
    setstatus(status) {
        this.status = status
    }
    getType_id() {
        return this.Type_id;
    }
    settype_id(Type_id) {
        this.Type_id = Type_id
    }
    getResturant_id() {
        return this.Resturant_id;
    }
    setResturant_id(Resturant_id) {
        this.Resturant_id = Resturant_id
    }
}
export default Items;
