
import Discount from "../Modules/Discount.js";
import Restaurants from "../Modules/Restaurants.js";
import Items from "../Modules/Items.js";
import Item_has_discount from "../Modules/Item_has_discount.js";
let array_Item_has_discount=[];//
let array_Restaurants=[];//
let array_Discount=[];//
let array_Items=[];//
let a1 =new Discount(1,3,3444,10,"../Picture/v.jpg","rr",'t',"dvfffffffffffffffffffffffffffffff","svdfvvdvdv",1);
let a2 =new Discount(1,3,3444,150,"../Picture/v.jpg","rr",'t',"dvfffffffffffffffffffffffffffffff","svdfvvdvdv",4);
let a3 =new Discount(1,3,3444,103,"../Picture/v.jpg","rr",'t',"dvfffffffffffffffffffffffffffffff","svdfvvdvdv",6);
let re1 =new Restaurants(1,"alghrpbr","../Picture/v.jpg","03956955",2,"","../Picture/v.jpg","","Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00","e","3",1,1,);
let re2 =new Restaurants(4,"ee","../Picture/v.jpg","03956955",2,"","../Picture/v.jpg","","e","e","3",2,1,);
let re3 =new  Restaurants(6,"ee","../Picture/v.jpg","03956955",2,"","../Picture/v.jpg","","e","e","3",3,1,);
let item1 =new Items (1,"vvvv","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
let item2 =new Items (2,"eee","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
let item3 =new Items (3,"gggg","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
array_Items.push(item1);
array_Items.push(item2);
array_Items.push(item3);
array_Discount.push(a1);
array_Discount.push(a2);
array_Discount.push(a3);
array_Restaurants.push(re1);
array_Restaurants.push(re2);
array_Restaurants.push(re3);
let cred_ade=document.getElementById('C_ad');

//           
let temp_rest_img =[];
temp_rest_img[0]="kkk";
for (let index = 0; index < array_Discount.length; index++) {
    for (let q = 0; q < array_Restaurants.length; q++) {
      
      if (array_Discount[index].getrestaurant_id()===array_Restaurants[q].getRestaurant_id()) {
        temp_rest_img[index] =array_Restaurants[q].getImage();
        temp_rest_img[index+1]=array_Restaurants[q].getName();
      
      }
     
    }
    cred_ade.innerHTML+=`
    <div class="col-md-6 mt-4">
    <!-- START PFP_Card_Advertising-->
    <div class="PFP_Card_Advertising">
        <div class="PFP_Card_Top">
            <img src="${array_Discount[index].getimg()} " alt=" " class="PFP_Image_Top">
            <div class="PFP_Card_Bottom ">
                <img src="${ temp_rest_img[index]}" class="PFP_Image_Circle">
            </div>
        </div>z
        <div class="PFP_Card_Container_Title">
            <div class="PFP_Card_Title">
            <h3 class="PFP_Card_Title_Word">${ temp_rest_img[index+1]}</h3>
            </div>
            <div class="PFP_Card_Title_Id">
                <p class="PFP_Card_Title_Id_P">${array_Discount[index].getdiscountId()}</p>
            </div>
        </div>
        <div class="PFP_Card_Container_Txt">
            <p class="PFP_Card_Title_Advertising">${array_Discount[index].getpercentage()}</p>
            <p class="PFP_Card_Txt"> ${array_Discount[index].getdescription()} </p>
            <hr class="bg-danger border-2 border-top border-danger">
            <p class="PFP_Card_Txt"> ${array_Discount[index].getsimplified_explination()} </div>
        <div class="PFP_Card_Down">
            <div class="PFP_Card_Down_Container_Information">
                <p class="PFP_Card_Down_Information"${array_Discount[index].getstart_date()}</p>
            </div>
            <div class="PFP_Card_Down_Container_Information">
                <p class="PFP_Card_Down_Information">${array_Discount[index].getEnd_date()}</p>
            </div>
            <div class="PFP_Card_Down_Container_Information">
                <p class="PFP_Card_Down_Information">${array_Discount[index].getrequired_price()}</p>
            </div>
        </div>
        <!-- END PFP_Card_Advertising-->
    </div>
</div>`
    
}






