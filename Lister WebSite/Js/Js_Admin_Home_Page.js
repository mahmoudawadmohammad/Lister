import Cities from "../Modules/Cities.js";
import Admin_Delivery from "../Modules/Admin_Delivery.js";
import Restaurants from "../Modules/Restaurants.js";

let array_Cities =[];//all cities
let array_Admin_Delivery =[];//all 
let array_Restaurants=[];//all customers that sid Id in order
let tabel_c_T_D=document.getElementById('PFP_Delivey_Men_Number_In_cites_Table');
let tabel_c_t_R=document.getElementById('PFP_resto_Number_In_cites_Table');
let tem_del=0;
let tem_res=0;
//
let d = new Admin_Delivery(1,"","","","","","","","","","","",1)
let re1 =new Restaurants(1,"ee","jcsj","03956955",2,"","","","e","e","3",1,1,);
let re2 =new Restaurants(1,"ee","jcsj","03956955",2,"","","","e","e","3",1,1,);
let re3 =new  Restaurants(1,"ee","jcsj","03956955",2,"","","","e","e","3",1,1,);
let c1=new Cities(1,"ct1")
let c3=new Cities(2,"nfnv")
let c2=new Cities(3,"nfnv")
array_Cities.push(c1);
array_Cities.push(c2);
array_Cities.push(c3);
array_Admin_Delivery.push(d);
array_Restaurants.push(re1);
array_Restaurants.push(re2);
array_Restaurants.push(re3);
//
for (let we = 0; we < array_Cities.length; we++) {
    tem_res=0;
    for (let index = 0; index < array_Restaurants.length; index++) {
        if (array_Cities[we].getcityId()===array_Restaurants[index].getCity_id()) {
            tem_res+=1;
        }
    }
    tabel_c_t_R.innerHTML+=`
    <tbody>
    <tr>
        <td>${array_Cities[we].getName()}</td>
        <td>${tem_res}</td>
    </tr>
    
    </tbody>`

    
}
for (let we = 0; we < array_Cities.length; we++) {
    tem_del=0;
    for (let index = 0; index < array_Admin_Delivery.length; index++) {
        if (array_Cities[we].getcityId()===array_Admin_Delivery[index].getcity_id()) {
            tem_del+=1;
        }
    }
    tabel_c_T_D.innerHTML+=`
    <tbody>
    <tr>
        <td>${array_Cities[we].getName()}</td>
        <td>${tem_del}</td>
    </tr>
    
    </tbody>`

    
}
function PFP_Admin_Change_Language_Home_Page() {
    if (document.getElementById("PFP_Admin_Home_Page").dir === "rtl") {
        document.getElementById("PFP_Admins_Page_Title").innerHTML = "الصفحة الرئيسة";
        // document.getElementById("PFP_Customers_Number_In_cites_Table").caption.innerHTML = "عدد المستخدمين في المدن ";
        document.getElementById("PFP_Cites_Table").innerHTML = "المدينة";
        document.getElementById("PFP_Customers_Table").innerHTML = "الزبائن";
    } else if (document.getElementById("PFP_Admin_Home_Page").dir === "ltr") {
        document.getElementById("PFP_Admins_Page_Title").innerHTML = "Home Page";
        // document.getElementById("PFP_Customers_Number_In_cites_Table").caption.innerHTML = "Users Number in Cities";
        document.getElementById("PFP_Cites_Table").innerHTML = "City";
        document.getElementById("PFP_Customers_Table").innerHTML = "Customers";
    }
}
