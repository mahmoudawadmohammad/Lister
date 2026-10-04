import Discount from "../Modules/Discount.js";

let array_Discount=[];//
let a1 =new Discount(1,3,3444,10,"../Picture/v.jpg","rr",'t',"dvfffffffffffffffffffffffffffffff","svdfvvdvdv",1);
let a2 =new Discount(1,3,3444,150,"../Picture/v.jpg","rr",'t',"dvfffffffffffffffffffffffffffffff","svdfvvdvdv",4);
let a3 =new Discount(1,3,3444,103,"../Picture/v.jpg","rr",'t',"dvfffffffffffffffffffffffffffffff","svdfvvdvdv",6);
array_Discount.push(a1);
array_Discount.push(a2);
array_Discount.push(a3);
array_Discount.push(a1);
array_Discount.push(a2);
array_Discount.push(a3);
let cred_ade=document.getElementById('t_dis');
//           
let temp_rest_img =[];
temp_rest_img[0]="kkk";
for (let index = 0; index < array_Discount.length; index++) {
   
    cred_ade.innerHTML+=`
          <tbody>
                       <tr>
							<td id="oid">${array_Discount[index].getdiscountId()}</td>
							<td id="or">${array_Discount[index].getpercentage()}</td>
							<td id="oc">${array_Discount[index].getsimplified_explination()}</td>
							<td id="od">${array_Discount[index].getstart_date()}</td>
							<td id="oe">${array_Discount[index].getEnd_date()}</td>
							<td id="os">${array_Discount[index].getdescription()}</td>
				 		</tr>
                         </tbody>             

    `
    
}






