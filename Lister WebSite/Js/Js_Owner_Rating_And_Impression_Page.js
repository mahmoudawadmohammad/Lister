import Customer_Owner from "../Modules/Customer_Owner.js";
import Orders from "../Modules/Orders.js";
import Restaurant_Rate from "../Modules/Restaurant_Rate.js";
import Restaurants from "../Modules/Restaurants.js";
let array_customer=[];
let array_ordrer=[];
let array_Restaurants=[];
let array_Restaurant_Rate=[];
//
let r1 = new Restaurant_Rate(1,1,3.1,1,"2/34/2222",3.2,4,2,"kill the m ")
let r2 = new Restaurant_Rate(1,1,3.2,3,"2/34/2222",3.2,4,2,"kill the m ")
let r3 = new Restaurant_Rate(1,1,3.3,4,"2/34/2222",3.2,4,2,"kill the m ")
let us1 =new Customer_Owner(1,"ggggvi","fu");
let us2 =new Customer_Owner(4,"ss","fu");
let us3 =new Customer_Owner(5,"r","fu");
let or1 = new Orders(1,"12/1/2022/4:00",'ww',"4:00",'vreveveverv',1,3,41,2); 
let or2 = new Orders(2,"12/1/2022/4:00",'ww',"4:00",'vreveveverv',4,3,41,2); 
let or3 = new Orders(3,"12/1/2022/4:00",'ww',"4:00",'vreveveverv',5,3,41,2); 
let re1 =new Restaurants(1,"ee","jcsj","03956955",2,"","","","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","e","3",1,1,);
let re2 =new Restaurants(1,"ee","jcsj","03956955",2,"","","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","e","3",2,1,);
let re3 =new  Restaurants(1,"ee","jcsj","03956955",2,"","","","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","e","3",3,1,);
array_ordrer.push(or1);
array_ordrer.push(or2);
array_ordrer.push(or3);
array_customer.push(us1);
array_customer.push(us2);
array_customer.push(us3);
array_Restaurant_Rate.push(r1);
array_Restaurant_Rate.push(r2);
array_Restaurant_Rate.push(r3);
array_Restaurants.push(re1);
array_Restaurants.push(re2);
array_Restaurants.push(re3);
//
let tabel_rate=document.getElementById('t_res');
let temp_customer_name="";
let temp_order_number="";

for (let index = 0; index < array.length; index++) {

    for (let jndex = 0; jndex < array.length; jndex++) {
        
        if (array_customer[jndex].getcustomer_owner_Id()==array_Restaurant_Rate[index].getCustomer_id()) {
             temp_customer_name=array_customer[jndex].getFirst_Name()+array_customer[jndex].getFirst_Name();
        }
        if (array_ordrer[jndex].getOrder_id()==array_Restaurant_Rate[index].getOrder_id()) {
            temp_order_number=array_ordrer[jndex].getOrder_id();
       }
      

    }
     
    tabel_rate.innerHTML+=       `

       <div class="col-xl-6 mt-4">
                               <div class="PFP_Owner_Rating_And_Impression_Card">
                                   <div class="PFP_Owner_Rating_And_Impression_Left_Card">
                                       <img src="../Picture/test.jpg">
                                       <div class="PFP_Owner_Rating_And_Impression_Information_Left_Card">
                                           <h2>Information</h2>
                                           <div class="PFP_Owner_Rating_And_Impression_Information_Data_Card">
                                               <h4 class="PFP_Owner_Rating_And_Impression_Full_Name_Card">Full Name : </h4>
                                               <h3 class="PFP_Owner_Rating_And_Impression_Full_Name_Information_Card">${temp_customer_name}</h3>
                                           </div>
                                           <div class="PFP_Owner_Rating_And_Impression_Information_Data_Card">
                                               <h4 class="PFP_Owner_Rating_And_Impression_Order_Number_Card">Order Number :</h4>
                                               <h3 class="PFP_Owner_Rating_And_Impression_Order_Number_Information_Card">${temp_order_number}</h3>
                                           </div>
                                       </div>
                                       <button type="button" class="btn btn-outline-info PFP_Button">Disable</button>
                                   </div>
                                   <div class="PFP_Owner_Rating_And_Impression_Right_Card">
                                       <div class="PFP_Owner_Rating_And_Impression_Question_Card">
                                           <span class="PFP_Owner_Rating_And_Impression_Text_Question_1_Card">How would you rate the quality of our food ?</span>
                                           <span class="PFP_Stars">
                                               <i class="fa-solid fa-star PFP_Star"></i>
                                               <i class="fa-solid fa-star PFP_Star"></i>
                                               <i class="fa-solid fa-star PFP_Star"></i>
                                               <i class="fa-solid fa-star PFP_Star"></i>
                                               <i class="fa-solid fa-star-half PFP_Star"></i>
                                           </span>
                                           <hr class="PFP_Owner_Rating_And_Impression_Horizontal_Line_Card">
                                       </div>
                                       <div class="PFP_Owner_Rating_And_Impression_Question_Card">
                                           <span class="PFP_Owner_Rating_And_Impression_Text_Question_2_Card">How would you rate the restaurant's level of service ?</span>
                                           <span class="PFP_Stars">
                                               <i class="fa-solid fa-star PFP_Star"></i>
                                               <i class="fa-solid fa-star PFP_Star"></i>
                                               <i class="fa-solid fa-star PFP_Star"></i>
                                               <i class="fa-solid fa-star-half PFP_Star"></i>
                                           </span>
                                           <hr class="PFP_Owner_Rating_And_Impression_Horizontal_Line_Card ">
                                       </div>
                                       <div class="PFP_Owner_Rating_And_Impression_Question_Card">
                                           <span class="PFP_Owner_Rating_And_Impression_Text_Question_3_Card">Was the staff friendly and welcoming ?</span>
                                           <span class="PFP_Owner_Rating_And_Impression_Information_Choice_Card">${array_Restaurant_Rate[index].getq3()}</span>
                                           <hr class="PFP_Owner_Rating_And_Impression_Horizontal_Line_Card">
                                       </div>
                                       <div class="PFP_Owner_Rating_And_Impression_Question_Card">
                                           <span class="PFP_Owner_Rating_And_Impression_Question_4_Card">Note :</span>
                                           <p class="PFP_Owner_Rating_And_Impression_Text_Question_4_Card">
                                               Lorem ipsum dolor sit, amet consectetur adipisicing elit. Officiis harum atque aliquam natus magnam aut obcaecati laboriosam sapiente enim! Unde sint maiores quaerat non sed blanditiis pariatur magnam eius ratione. Lorem ipsum dolor sit amet consectetur
                                               adipisicing elit. Officiis earum vitae amet dolores tempore voluptatem tempora qui sint minus dolorum. Distinctio iusto laudantium animi dolorem aliquam facilis doloribus autem quisquam.
                                           </p>
                                       </div>
                                   </div>
                               </div>`




    
}






