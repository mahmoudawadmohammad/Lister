class Cities {
    constructor(cityId, Name) {
        this.cityId = cityId;
        this.Name = Name;
    }
    getcityId() {
        return this.cityId;
    }
    setcityId(cityId) {
        this.cityId = cityId
    }
    getName() {
        return this.Name;
    }
    setName(Name) {
        this.Name = Name
    }

}
export default Cities;

