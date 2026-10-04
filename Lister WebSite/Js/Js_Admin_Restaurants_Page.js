
import Restaurants from "../Modules/Restaurants.js";
import day from "../Modules/day.js";
import Customer_Owner from "../Modules/Customer_Owner.js";
import Cities from "../Modules/Cities.js";
let array_Cities =[];//all cities
let array_Customer_Owner=[];//all 
let array_day=[];//all 
let array_Restaurants=[];//
//
//let holdr_day =new day("","","");
//array_day.push(holdr_day);
let re1 =new Restaurants(1,"ee","jcsj","03956955",2,"","","","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","e","3",1,1,);
let re2 =new Restaurants(1,"ee","jcsj","03956955",2,"","","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","e","3",2,1,);
let re3 =new  Restaurants(1,"ee","jcsj","03956955",2,"","","","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","e","3",3,1,);
let c1=new Cities(1,"ct1")
let c3=new Cities(2,"nfnv")
let c2=new Cities(3,"nfnv")
array_Cities.push(c1);
array_Cities.push(c2);
array_Cities.push(c3);
let us1 =new Customer_Owner(1,"ggggvi","fu","h");
let us2 =new Customer_Owner(4,"ss","fu");
let us3 =new Customer_Owner(5,"r","fu");
array_Customer_Owner.push(us1);
array_Customer_Owner.push(us2);
array_Customer_Owner.push(us3);
array_Restaurants.push(re1);
array_Restaurants.push(re2);
array_Restaurants.push(re3);
//
let tabel_c=document.getElementById('c_spe');
let temp ="";
let temp_ind=-1;
let temp_index=0;
for (let index = 0; index < array_Restaurants.length; index++) {
   array_day.length=0;
    for (let q = 0; q < array_Cities.length; q++) {
        
        if (array_Customer_Owner[index].getcustomer_owner_Id()===array_Cities[q].getcityId()) {
        temp=array_Cities[q].getName();
        }
    }
    for (let w = 0; w < array_Customer_Owner.length; w++) {
        
        if (array_Restaurants[index].getOwner_id()===array_Customer_Owner[w].getcustomer_owner_Id()) {
        temp_ind=w;
        }
    }
    //Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00
    let a=new day("","","")
    let ockerd=0;
    let string_y="";
   let temp_f_u=""
   let temp_f_u_2=""
    for (let qw = 0; qw < array_Restaurants[index].getactivation().length; qw++) {
      
        string_y=  array_Restaurants[index].getactivation();
        let char = string_y.charAt(qw);
        if (char==='-'||qw===string_y.length-1) {
            ockerd=0;
            let part = string_y.slice(temp_index, qw);
            temp_index=qw+1;
          a.settime_e(part);
          array_day.push(a);
          a=new day("","","");
        }
    if (char===',') {
        ockerd+=1;
        let part = string_y.slice(temp_index, qw);
        temp_index=qw+1;
        if (ockerd===1) {
         
          a.setName(part);
            
        }else
        a.settime_S(part);
            
            
                
        
    }
  
   
    }
    
  const days_now = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
  const d_now = new Date();
  
  let day_now = days_now[d_now.getDay()];
  
    let temo_str_time
    let temo_end_time
    
 for (let rt = 0; rt < array_day.length; rt++) {

    if (day_now=== array_day[rt].getName ()) {

        temo_str_time= array_day[rt].gettime_S();
        temo_end_time =  array_day[rt].gettime_e();
        console.log(temo_str_time);
        console.log(temo_end_time);
    }
    
 }
    

    tabel_c.innerHTML+=   `
     
<div class="col-xl-6 mt-4">
<div class="PFP_Restaurant_Card">
    <div class="PFP_Restaurant_Front_Card ">
        <div class="PFP_Restaurant_Content">
            <div class="PFP_Restaurant_Front_Up_Card">
                <img src="../Picture/M.jpg">
                <div class="PFP_Restaurant_Title_Card">
                    <h2>Aldewan Almalalaki</h2>
                    <div class="PFP_Restaurant_Card_Buttons">
                        <button type="button" class="btn btn-warning" id="button_1">Flip cards</button>
                        <button type="button" class="btn btn-warning">Disable</button>
                    </div>
                </div>
            </div>
            <div class="PFP_Restaurant_Front_Down_Card">
                <div class="PFP_Restaurant_Front_Down_Left_Card">
                    <ul>
                        <li><span class="PFP_Title_Information">Id :</span><span class="PFP_Information">${array_Restaurants[index].getRestaurant_id()}</span></li>
                        <li><span class="PFP_Title_Information">City :</span><span class="PFP_Information">${temp}</span></li>
                        <li><span class="PFP_Title_Information">Address :</span><span class="PFP_Information">${array_Restaurants[index].getAddress()}</span></li>
                        <li><span class="PFP_Title_Information">Phone :</span><span class="PFP_Information">${array_Restaurants[index].getPhoneNumber()}</span></li>
                        <li><span class="PFP_Title_Information">type :</span><span class="PFP_Information">${array_Restaurants[index].gettype()} </span></li>
                    </ul>
                </div>
                <div class="PFP_Restaurant_Front_Down_Right_Card">
                    <ul>
                        <li><span class="PFP_Title_Information">email :</span><span class="PFP_Information">${array_Restaurants[index].getEmail()}</span></li>
                        <li><span class="PFP_Title_Information">total tables :</span><span class="PFP_Information">${array_Restaurants[index].gettotal_tables()}</span></li>
                        <li><span class="PFP_Title_Information">Opening time :</span><span class="PFP_Information">${temo_str_time}</span></li>
                        <li><span class="PFP_Title_Information">Closing time :</span><span class="PFP_Information">${temo_end_time}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="PFP_Restaurant_Back_Card">
        <div class="PFP_Restaurant_Content">
            <div class="PFP_Restaurant_Front_Up_Card">
                <img src="../Picture/test.jpg" alt="">
                <div class="PFP_Restaurant_Title_Card">
                    <h2>${ array_Customer_Owner[temp_ind].getFirst_Name()+" "+array_Customer_Owner[temp_ind].getLast_Name()}</h2>
                    <div class="PFP_Restaurant_Card_Buttons">
                        <button type="button" class="btn btn-warning" onclick="flip()">Flip cards</button>
                        <button type="button" class="btn btn-warning">Disable</button></div>
                </div>
            </div>
            <div class="PFP_Restaurant_Front_Down_Card">
                <div class="PFP_Restaurant_Front_Down_Left_Card">
                    <ul>
                        <li><span class="PFP_Title_Information">Id :</span><span class="PFP_Information">${ array_Customer_Owner[temp_ind].getcustomer_owner_Id()}</span></li>
                        <li><span class="PFP_Title_Information">City :</span><span class="PFP_Information">${ temp}</span></li>
                        <li><span class="PFP_Title_Information">Address :</span><span class="PFP_Information">${ array_Customer_Owner[temp_ind].getAddress()}</span></li>
                    </ul>
                </div>
                <div class="PFP_Restaurant_Front_Down_Right_Card">
                    <ul>
                        <li><span class="PFP_Title_Information">Birth date :</span><span class="PFP_Information">${ array_Customer_Owner[temp_ind].getBirth_Date()}</span></li>
                        <li><span class="PFP_Title_Information">email :</span><span class="PFP_Information">${ array_Customer_Owner[temp_ind].getEmail()}</span></li>
                        <li><span class="PFP_Title_Information">Phone :</span><span class="PFP_Information">${ array_Customer_Owner[temp_ind].getPhoneNumber()}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

     `
    
}


































