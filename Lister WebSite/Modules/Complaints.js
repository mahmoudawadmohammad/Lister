class Complaints {
    constructor(ComplaintsId, description, type, to) {
        this.ComplaintsId = ComplaintsId;
        this.description = description;
        this.type = type;
        this.to = to;
    }
    getComplaintsId() {
        return this.ComplaintsId;
    }
    setComplaintsId(ComplaintsId) {
        this.ComplaintsId = ComplaintsId
    }
    getdescription() {
        return this.description;
    }
    setdescription(description) {
        this.description = description
    }
    gettype() {
        return this.type;
    }
    settype(type) {
        this.type = type
    }
    getto() {
        return this.to;
    }
    setto(to) {
        this.to = to
    }
}
export default Complaints;
