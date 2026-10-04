class Types {
    constructor(Type_id, Name ) {
        this.Type_id = Type_id;
        this.Name = Name;

    }
    getType_id() {
        return this.Type_id;
    }
    setType_id(Type_id) {
        this.Type_id = Type_id
    }
    getName() {
        return this.Name;
    }
    setName(Name) {
        this.Name = Name
    }
}
export default Types;

