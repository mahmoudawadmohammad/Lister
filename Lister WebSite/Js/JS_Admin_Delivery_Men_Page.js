
import Admin_Delivery from "../Modules/Admin_Delivery.js";
import Cities from "../Modules/Cities.js";
let array_Cities =[];//all cities
let array_Admin_Delivery =[];//all 
//
let c1=new Cities(1,"ct1")
let c3=new Cities(2,"nfnv")
let c2=new Cities(3,"nfnv")
array_Cities.push(c1);
array_Cities.push(c2);
array_Cities.push(c3);
let d1 = new Admin_Delivery(1,"dd","tt","2","ii","df","tg","yy","uu","hh","hh","bb",1);
let d3 = new Admin_Delivery(2,"dd","tt","2","ii","df","tg","yy","uu","hh","hh","bb",1);
let d2 = new Admin_Delivery(3,"dd","tt","3","ii","df","tg","yy","uu","hh","hh","bb",1);
let d4 = new Admin_Delivery(4,"dd","tt","5","ii","df","tg","yy","uu","hh","hh","bb",1);
let d5 = new Admin_Delivery(5,"dd","tt","t","ii","df","tg","yy","uu","hh","hh","bb",1);
array_Admin_Delivery.push(d1);
array_Admin_Delivery.push(d2);
array_Admin_Delivery.push(d3);
array_Admin_Delivery.push(d4);
array_Admin_Delivery.push(d5);
//
let tabel_c=document.getElementById('c_dev');
let temp ="";

for (let index = 0; index < array_Admin_Delivery.length; index++) {
    
    for (let q = 0; q < array_Cities.length; q++) {
        
        if (array_Admin_Delivery[index].getcity_id()===array_Cities[q].getcityId()) {
        temp=array_Cities[q].getcityId();
        }
    }
    tabel_c.innerHTML+=   `
      <div class="col-xl-6 mt-4">
      <div class="PFP_Delivery_Customers_Admins_Son d-flex">
    <figure>
        <img src="${array_Admin_Delivery[index].getImage()}" alt="Image Card" class="PFP_Image_Card">
        <figcaption>
            <button type="button" class="btn btn-outline-info PFP_Button">Disable</button>
        </figcaption>
    </figure>
    <table class="PFP_Delivery_Customers_Admins_Table">
        <tr>
            <td><span class="PFP_Title_Information PFP_Id">Id :</span><span class="PFP_Information">${array_Admin_Delivery[index].getAdmin_delivery_Id()}</span></td>
            <td><span class="PFP_Title_Information PFP_City">City :</span><span class="PFP_Information">${temp}</span></td>
        </tr>
        <tr>
            <td><span class="PFP_Title_Information PFP_First_Name">First Name :</span><span class="PFP_Information">${array_Admin_Delivery[index].getFirst_Name()}</span></td>
            <td><span class="PFP_Title_Information PFP_Last_Name">Last Name :</span><span class="PFP_Information">${array_Admin_Delivery[index].getLast_Name()}</span></td>
        </tr>
        <tr>
            <td><span class="PFP_Title_Information PFP_Phone">Phone :</span><span class="PFP_Information">${array_Admin_Delivery[index].getPhoneNumber()}</span></td>
            <td><span class="PFP_Title_Information PFP_Email">Email :</span><span class="PFP_Information">${array_Admin_Delivery[index].getLast_Name()}</span></td>
        </tr>
        <tr>
            <td><span class="PFP_Title_Information PFP_Address">Address :</span><span class="PFP_Information">${array_Admin_Delivery[index].getAddress()}</span></td>
            <td><span class="PFP_Title_Information PFP_Birth_Date">Birth date :</span><span class="PFP_Information">${array_Admin_Delivery[index].getBirth_Date()}</span></td>
        </tr>
        <tr>
            <td><span class="PFP_Title_Information PFP_Hire_Date">Hire date :</span><span class="PFP_Information">${array_Admin_Delivery[index].gethire_Date()}</span></td>
            <td><span class="PFP_Title_Information PFP_End_Date">End date :</span><span class="PFP_Information">${array_Admin_Delivery[index].getEnd_Date()}</span></td>
        </tr>
        <tr>
            <td colspan="2"><span class="PFP_Title_Information PFP_Number_Mounth_Order">Number of orders received for this month :</span><span class="PFP_Information">:::::400</span></td>
        </tr>
    </table>
</div>
</div>
     `
    
}

function PFP_Function_Change_Language_Admin_Delivery_Men_Page() {
    if (document.getElementById("PFP_Delivery_men_Page").dir === "rtl") {
        document.getElementById("PFP_Admin_Delivery_men_Title").innerHTML = "رحال التوصيل";
        document.getElementById("PFP_Admin_Home_A").innerHTML = "الصفحة الرئيسة";
        document.getElementById("PFP_Admin_Home_T").title = "الصفحة الرئيسة ( Alt + P )";
        document.getElementById("PFP_Delivery_Men_A").innerHTML = "عمال التوصيل";
        document.getElementById("PFP_Delivery_Men_T").title = "عمال التوصيل ( Alt + D )";
        document.getElementById("PFP_Customers_A").innerHTML = "الزبائن";
        document.getElementById("PFP_Customers_T").title = "الزبائن ( Alt + H )";
        document.getElementById("PFP_Admins_A").innerHTML = "المشرفون";
        document.getElementById("PFP_Admins_T").title = "المشرفون ( Alt + A )";
        document.getElementById("PFP_Restaurants_A").innerHTML = "المطاعم";
        document.getElementById("PFP_Restaurants_T").title = "المطاعم ( Alt + R )";
        document.getElementById("PFP_Advertisements_A").innerHTML = "الإعلانات";
        document.getElementById("PFP_Advertisements_T").title = "الإعلانات ( Ctrl + Alt + A )";
        document.getElementById("PFP_Complaints_A").innerHTML = "الشكاوي";
        document.getElementById("PFP_Complaints_T").title = "الشكاوي ( Alt + C )";
        document.getElementById("PFP_Admin_Settings_A").innerHTML = "الإعدادات";
        document.getElementById("PFP_Admin_Settings_T").title = "الإعدادات ( Alt + S )";
        document.getElementById("PFP_Logout_A").innerHTML = "تسجيل الخروج";
        document.getElementById("PFP_Logout_T").title = "تسجيل الخروج ( Alt + L )";
        document.getElementById("PFP_Log_Out_Warning").innerHTML = "هل انت متأكد من انك تود مغادرة هذا الموقع ؟";
        document.getElementById("staticBackdropLabel").innerHTML = "تسجيل الخروج";
        document.getElementById("PFP_Log_out").innerHTML = "سجل خرج";
        document.getElementById("Btn_close").innerHTML = "اغلاق";
        document.getElementById("PFP_Toggle").classList.remove("fa-angle-right");
        document.getElementById("PFP_Toggle").classList.add("fa-angle-left");
        const PFP_Array_Id = document.getElementsByClassName("PFP_Id");
        const PFP_Array_City = document.getElementsByClassName("PFP_City");
        const PFP_Array_First_Name = document.getElementsByClassName("PFP_First_Name");
        const PFP_Array_Last_Name = document.getElementsByClassName("PFP_Last_Name");
        const PFP_Array_Phone = document.getElementsByClassName("PFP_Phone");
        const PFP_Array_Email = document.getElementsByClassName("PFP_Email");
        const PFP_Array_Address = document.getElementsByClassName("PFP_Address");
        const PFP_Array_Birth_Date = document.getElementsByClassName("PFP_Birth_Date");
        const PFP_Array_Hire_Date = document.getElementsByClassName("PFP_Hire_Date");
        const PFP_Array_End_Date = document.getElementsByClassName("PFP_End_Date");
        const PFP_Array_Number_Month = document.getElementsByClassName("PFP_Number_Mounth_Order");
        const PFP_Array_Buttons = document.getElementsByClassName("btn-outline-info");
        for (let i = 0; i < PFP_Array_Id.length; i++) {
            PFP_Array_Id[i].innerHTML = " : رقم العامل";
            PFP_Array_City[i].innerHTML = " : المدينة";
            PFP_Array_First_Name[i].innerHTML = " : الاسم الأول";
            PFP_Array_Last_Name[i].innerHTML = " : اسم العائلة";
            PFP_Array_Phone[i].innerHTML = " : رقم الهاتف";
            PFP_Array_Email[i].innerHTML = " : البريد الالكتروني";
            PFP_Array_Address[i].innerHTML = " : العنوان";
            PFP_Array_Birth_Date[i].innerHTML = " : تايرخ الولادة";
            PFP_Array_Hire_Date[i].innerHTML = " : تاريخ التعيين";
            PFP_Array_End_Date[i].innerHTML = " : تاريخ الاستقالة";
            PFP_Array_Number_Month[i].innerHTML = " : عدد الطلبات الموصلة لهذا الشهر";
            PFP_Array_Buttons[i].innerHTML = "تفعيل";
        }
    } else if (document.getElementById("PFP_Delivery_men_Page").dir === "ltr") {
        document.getElementById("PFP_Admin_Delivery_men_Title").innerHTML = "Delivery Men";
        document.getElementById("PFP_Admin_Home_A").innerHTML = "Home Page";
        document.getElementById("PFP_Admin_Home_T").title = "Home Page ( Alt + P )";
        document.getElementById("PFP_Delivery_Men_A").innerHTML = "Delivery Men";
        document.getElementById("PFP_Delivery_Men_T").title = "Delivery Men  ( Alt + D )";
        document.getElementById("PFP_Customers_A").innerHTML = "Customers";
        document.getElementById("PFP_Customers_T").title = "Customers ( Alt + H )";
        document.getElementById("PFP_Admins_A").innerHTML = "Admins";
        document.getElementById("PFP_Admins_T").title = "Admins ( Alt + A )";
        document.getElementById("PFP_Restaurants_A").innerHTML = "Restaurants";
        document.getElementById("PFP_Restaurants_T").title = "Restaurants ( Alt + R )";
        document.getElementById("PFP_Advertisements_A").innerHTML = "Advertisements";
        document.getElementById("PFP_Advertisements_T").title = "Advertisements ( Ctrl + Alt + A )";
        document.getElementById("PFP_Complaints_A").innerHTML = "Complaints";
        document.getElementById("PFP_Complaints_T").title = "Complaints ( Alt + C )";
        document.getElementById("PFP_Admin_Settings_A").innerHTML = "Settings";
        document.getElementById("PFP_Admin_Settings_T").title = "Settings ( Alt + S )";
        document.getElementById("PFP_Logout_A").innerHTML = "Logout";
        document.getElementById("PFP_Logout_T").title = "Logout ( Alt + L )";
        document.getElementById("PFP_Log_Out_Warning").innerHTML = "Are you sure you want to log out of the website ?";
        document.getElementById("staticBackdropLabel").innerHTML = "Log Out";
        document.getElementById("PFP_Log_out").innerHTML = "Log Out";
        document.getElementById("Btn_close").innerHTML = "Close";
        document.getElementById("PFP_Toggle").classList.remove("fa-angle-left");
        document.getElementById("PFP_Toggle").classList.add("fa-angle-right");
        const PFP_Array_Id = document.getElementsByClassName("PFP_Id");
        const PFP_Array_City = document.getElementsByClassName("PFP_City");
        const PFP_Array_First_Name = document.getElementsByClassName("PFP_First_Name");
        const PFP_Array_Last_Name = document.getElementsByClassName("PFP_Last_Name");
        const PFP_Array_Phone = document.getElementsByClassName("PFP_Phone");
        const PFP_Array_Email = document.getElementsByClassName("PFP_Email");
        const PFP_Array_Address = document.getElementsByClassName("PFP_Address");
        const PFP_Array_Birth_Date = document.getElementsByClassName("PFP_Birth_Date");
        const PFP_Array_Hire_Date = document.getElementsByClassName("PFP_Hire_Date");
        const PFP_Array_End_Date = document.getElementsByClassName("PFP_End_Date");
        const PFP_Array_Number_Month = document.getElementsByClassName("PFP_Number_Mounth_Order");
        const PFP_Array_Buttons = document.getElementsByClassName("btn-outline-info");
        for (let i = 0; i < PFP_Array_Id.length; i++) {
            PFP_Array_Id[i].innerHTML = "Id : ";
            PFP_Array_City[i].innerHTML = "City : ";
            PFP_Array_First_Name[i].innerHTML = "First Name : ";
            PFP_Array_Last_Name[i].innerHTML = "Last Name : ";
            PFP_Array_Phone[i].innerHTML = "Phone : ";
            PFP_Array_Email[i].innerHTML = "Email : ";
            PFP_Array_Address[i].innerHTML = "Address : ";
            PFP_Array_Birth_Date[i].innerHTML = "Birth date : ";
            PFP_Array_Hire_Date[i].innerHTML = "Hire date : ";
            PFP_Array_End_Date[i].innerHTML = "End date : ";
            PFP_Array_Number_Month[i].innerHTML = "Number of orders received for this month : ";
            PFP_Array_Buttons[i].innerHTML = "Enable";
        }
    }
}












