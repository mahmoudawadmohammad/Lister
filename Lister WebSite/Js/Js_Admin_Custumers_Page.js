

import Customer_Owner from "../Modules/Customer_Owner.js";

let array_customer=[];
//
let us1 =new Customer_Owner(1,"man","fu","","","09865266215");
let us2 =new Customer_Owner(1,"so","fu","","","09865266215");
let us3 =new Customer_Owner(1,"hi ","fu","","","09865266215");
array_customer.push(us1);
array_customer.push(us2);
array_customer.push(us3);
//
let tabel_customer=document.getElementById('PFP_Admin_Customers_Table');

for (let index = 0; index < array_customer.length; index++) {
    tabel_customer.innerHTML+=`
    
                    
                <tbody>
                <tr>
                    <td>${array_customer[index].getFirst_Name()}</td>
                    <td>${array_customer[index].getLast_Name()}</td>
                    <td>${array_customer[index].getPhoneNumber()}</td>
                    <td><button type="button" class="btn btn-danger">Disabled</button></td>
                </tr>

                </tbody>

    `    
}



function PFP_Function_Change_Language_Admin_Customers_Page() {
    if (document.getElementById("PFP_Customers_Page").dir === "rtl") {
        document.getElementById("PFP_Admin_Customers_Title").innerHTML = "الزبائن";
        document.getElementById("PFP_Admin_Customers_Table_Caption").innerHTML = "الزبائن";
        document.getElementById("PFP_Admin_Customers_Table_First_Name").innerHTML = "الاسم الأول";
        document.getElementById("PFP_Admin_Customers_Table_Last_Name").innerHTML = "الاسم الاخير";
        document.getElementById("PFP_Admin_Customers_Table_Phone").innerHTML = "رقم الهاتف";
        document.getElementById("PFP_Admin_Customers_Table_Status").innerHTML = "الحالة";
        const PFP_Array_Btn_Success = document.getElementsByClassName("btn-success");
        const PFP_Array_Btn_Danger = document.getElementsByClassName("btn-danger");
        for (let i = 0; i < PFP_Array_Btn_Success.length; i++) {
            PFP_Array_Btn_Success[i].innerHTML = "مفعل";
        }
        for (let i = 0; i < PFP_Array_Btn_Danger.length; i++) {
            PFP_Array_Btn_Danger[i].innerHTML = "معطل";
        }
    } else if (document.getElementById("PFP_Customers_Page").dir === "ltr") {
        document.getElementById("PFP_Admin_Customers_Title").innerHTML = "Customers";
        document.getElementById("PFP_Admin_Customers_Table_Caption").innerHTML = "Customers";
        document.getElementById("PFP_Admin_Customers_Table_First_Name").innerHTML = "First Name";
        document.getElementById("PFP_Admin_Customers_Table_Last_Name").innerHTML = "Last Name";
        document.getElementById("PFP_Admin_Customers_Table_Phone").innerHTML = "Phone";
        document.getElementById("PFP_Admin_Customers_Table_Status").innerHTML = "Status";
        const PFP_Array_Btn_Success = document.getElementsByClassName("btn-success");
        const PFP_Array_Btn_Danger = document.getElementsByClassName("btn-danger");
        for (let i = 0; i < PFP_Array_Btn_Success.length; i++) {
            PFP_Array_Btn_Success[i].innerHTML = " : Enabled";
        }
        for (let i = 0; i < PFP_Array_Btn_Danger.length; i++) {
            PFP_Array_Btn_Danger[i].innerHTML = "Disabled";
        }
    }
}