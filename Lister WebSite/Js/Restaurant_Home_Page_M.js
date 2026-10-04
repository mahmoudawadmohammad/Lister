import Orders from "../Modules/Orders.js";
import Order_Item from "../Modules/Order_Item.js";
import Reservations from "../Modules/Reservations.js";
import Items from "../Modules/Items.js";
import Types from "../Modules/Types.js";
import Customer_Owner from "../Modules/Customer_Owner.js";
let array_ordrer =[];//all order in con not st!= done
let array_ordrer_item =[];//all order items
let array_reserv =[];//all reservation that st != done
let array_Items =[];//ALL RESTORANT ITEMS
let array_Items_tostring =[];// temp arr
let array_types =[];
let array_customer=[];//all customers that sid Id in order

//
let Type =new Types(1,"fu");
let us1 =new Customer_Owner(1,"ggggvi","fu");
let us2 =new Customer_Owner(4,"ss","fu");
let us3 =new Customer_Owner(5,"r","fu");
let or_i1=new Order_Item(1,1,3,3000);
let or_i2=new Order_Item(1,1,3,3000);
let or_i3=new Order_Item(1,1,3,3000);
let or_i4=new Order_Item(2,2,3,3000);
let or_i5=new Order_Item(2,2,3,3000);
let or_i6=new Order_Item(2,2,3,3000);
let or_i7=new Order_Item(3,3,3,3000);
let or_i8=new Order_Item(3,3,3,3000);
let or_i9=new Order_Item(3,1,3,3000);
let item1 =new Items (1,"vvvv","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
let item2 =new Items (2,"eee","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
let item3 =new Items (3,"gggg","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
let re1 =new Reservations(1,"2/1/2020;4:00","ontibel","2/1/2020;4:00","aaevsvvsdkvnk",1,2,3,5);
let re2 =new Reservations(1,"2/1/2020;4:00","ontibel","2/1/2020;4:00","aaevsvvsdkvnk",1,2,3,5);
let re3 =new Reservations(1,"2/1/2020;4:00","ontibel","2/1/2020;4:00","aaevsvvsdkvnk",1,2,3,5);
let or1 = new Orders(1,"12/1/2022/4:00",'ww',"4:00",'vreveveverv',1,3,41,2); 
let or2 = new Orders(2,"12/1/2022/4:00",'ww',"4:00",'vreveveverv',4,3,41,2); 
let or3 = new Orders(3,"12/1/2022/4:00",'ww',"4:00",'vreveveverv',5,3,41,2); 
array_customer.push(us1);
array_customer.push(us2);
array_customer.push(us3);
array_ordrer.push(or1);
array_ordrer.push(or2);
array_ordrer.push(or3);
array_ordrer_item.push(or_i1);
array_ordrer_item.push(or_i2);
array_ordrer_item.push(or_i3);
array_ordrer_item.push(or_i4);
array_ordrer_item.push(or_i5);
array_ordrer_item.push(or_i6);
array_ordrer_item.push(or_i7);
array_ordrer_item.push(or_i8);
array_ordrer_item.push(or_i9);
array_reserv.push(re1);
array_reserv.push(re2);
array_reserv.push(re3);
array_Items.push(item1);
array_Items.push(item2);
array_Items.push(item3);
array_types.push(Type);
//
//console.log(array_Items.length); //to display the total dev

let tabel_order=document.getElementById('t_ord');
let tabel_reser=document.getElementById('t_res');
let tabel_me=document.getElementById('t_me');
let temp_user_ord_holder ="";
let temp_user_res_holder ="";
let temp_user_me_holder ="";


for (let index = 0; index < array_ordrer.length; index++) {
  array_Items_tostring[index]="";
  for (let w = 0; w < array_ordrer_item.length; w++) {
   if ( array_ordrer_item[w].getOrder_Id()===array_ordrer[index].getOrder_id() ) {
    for (let r = 0; r < array_Items.length; r++) {
     if (array_ordrer_item[w].getitem_id()===array_Items[r].getItemsId()) {
      
      array_Items_tostring[index]+=array_Items[r].getName()+",";
     } 
    }
   } 
  }
}
for (let index = 0; index <array_ordrer.length; index++) {
  if (array_ordrer[index].getcustomer_id()===array_customer[index].getcustomer_owner_Id()) {
    temp_user_ord_holder=array_customer[index].getFirst_Name()+" "+array_customer[index].getLast_Name();
  }
  tabel_order.innerHTML+=`
  
             <tbody>
               <tr id="h">
                 <td>${array_ordrer[index].getOrder_id()}</td>
                 <td>${array_Items_tostring[index]}</td>
                 <td>${temp_user_ord_holder}</td>
                 <td>${array_ordrer[index].getdate_time()}</td>
                 <td>${array_ordrer[index].getexpected_time()}</td>
                 <td>${array_ordrer[index].getcomments()}</td>
                 <td>
                   <span class="action_btn">
                     <button>Accept</button>
                     <button onclick="refuseOrder()">Refuse</button>
                   </span>
                 </td>
               </tr> 
               
               </tbody>`

}
for (let index = 0; index <array_reserv.length; index++) {
  if (array_reserv[index].getcustomer_id()===array_customer[index].getcustomer_owner_Id()) {
    temp_user_res_holder=array_customer[index].getFirst_Name()+" "+array_customer[index].getLast_Name();
  }
  tabel_reser.innerHTML+=`
  
                <tbody>
                <tr id="he">
              <td>${array_reserv[index].getreservationsId()}</td>
              <td>${temp_user_res_holder} </td>
              <td>${array_reserv[index].getdate_time()}</td>
              <td>${array_reserv[index].getedate_time()}</td>
              <td>${array_reserv[index].getpersones_number()}</td>
              <td>${array_reserv[index].gettabel_number()}</td>
              <td>${array_reserv[index].getcomments()}<td>
              <span class="action_btn">
                <button>Accept</button>
                <button onclick="refuseOrder()">Refuse</button>
              </span>
              </td>
              </tr>

             </tbody>`

}
for (let index = 0; index <array_Items.length; index++) {
  for (let ee = 0; ee < array_types.length; ee++) {
    if (array_types[ee].getType_id()===array_Items[index].getType_id()) {
      temp_user_me_holder=array_types[ee].getName();
    }
    
  }
  tabel_me.innerHTML+=`

                        <tbody>
                        <tr>
                          <td>${array_Items[index].getName()}</td>
                          <td><img src="${array_Items[index].getphoto()}"></td>
                          <td>${array_Items[index].getprice()+"sp"}</td>
                          <td>${temp_user_me_holder}</td>
                          <td>${array_Items[index].getdescription()}</td>
                          </tr>
                      </tbody>
             
             `

}
