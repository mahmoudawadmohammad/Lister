class day {
    constructor(time_S, Name,time_e ) {
        this.time_S = time_S;
        this.Name = Name;
        this.time_e = time_e;
    }
    gettime_e() {
        return this.time_e;
    }
    settime_e(time_e) {
        this.time_e = time_e
    }
    getName() {
        return this.Name;
    }
    setName(Name) {
        this.Name = Name
    }
    gettime_S() {
        return this.time_S;
    }
    settime_S(time_S) {
        this.time_S = time_S
    }
}
export default day;

