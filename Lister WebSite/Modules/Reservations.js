class Reservations {
    constructor(reservationsId, date_time, status, edate_time,comments,customer_id,restorant_id,tabel_number,persones_number) {
        this.reservationsId = reservationsId;
        this.date_time = date_time;
        this.status = status;
        this.edate_time=edate_time;
        this.comments = comments;
        this.customer_id = customer_id;
        this.restorant_id = restorant_id; 
        this.tabel_number =tabel_number;
        this.persones_number = persones_number;
    }
    getreservationsId() {
        return this.reservationsId;
    }
    setreservationsId(reservationsId) {
        this.reservationsId = reservationsId
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
    getedate_time() {
        return this.edate_time;
    }
    setedate_time(edate_time) {
        this.edate_time = edate_time
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
    getrestorant_id() {
        return this.restorant_id;
    }
    setrestorant_id(restorant_id) {
        this.restorant_id = restorant_id
    }
    gettabel_number() {
        return this.tabel_number;
    }
    settabel_number(tabel_number) {
        this.tabel_number = tabel_number
    }
    getpersones_number() {
        return this.persones_number;
    }
    setpersones_number(persones_number) {
        this.persones_number =persones_number
    }
}
export default Reservations;
