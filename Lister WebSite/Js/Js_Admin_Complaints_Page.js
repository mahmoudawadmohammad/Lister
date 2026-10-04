
import Complaints from "../Modules/Complaints.js";
let array_Complaints =[];
let tabel_complain=document.getElementById('c_comp');
//
let c1 =new Complaints(1,"ndsnvlksdnvkldsnvkldsnvkldsvndkslnvkslvn","complain","fucking gfk");
let c2 =new Complaints(2,"ndsnvlksdnvkldsnvkldsnvkldsvndkslnvkslvn","complain","fucking gfk");
let c3 =new Complaints(3,"ndsnvlksdnvkldsnvkldsnvkldsvndkslnvkslvn","complain","fucking gfk");
let c4 =new Complaints(4,"ndsnvlksdnvkldsnvkldsnvkldsvndkslnvkslvn","complain","fucking gfk");
let c5 =new Complaints(5,"ndsnvlksdnvkldsnvkldsnvkldsvndkslnvkslvn","complain","fucking gfk");
array_Complaints.push(c1);
array_Complaints.push(c2);
array_Complaints.push(c3);
array_Complaints.push(c4);
array_Complaints.push(c5);
//

for (let index = 0; index <array_Complaints.length; index++) {

    tabel_complain.innerHTML+=`
        <div class="col-md-4 mt-4">
        <div class="PFP_Complaints_Admins_Card">
            <div class="PFP_Complaints_Admins_Title_Card">
                <div class="PFP_Complaints_Admins_Id_Container_Card">
                    <h2 class="PFP_Complaints_Admins_Id_Card">${array_Complaints[index].getComplaintsId()}</h2>
                    </div>
                    <div class="PFP_Complaints_Admins_Type_Complaint_Container_Card">
                    <h4 class="PFP_Complaints_Admins_Type_Complaint_Card">${array_Complaints[index].gettype()}</h4>
                    </div>
                    <div class="PFP_Complaints_Admins_Type_Complaint_Container_Card">
                    <h4 class="PFP_Complaints_Admins_Type_Complaint_Card">${array_Complaints[index].getto()}</h4>
                </div>
            </div>
            <hr class="PFP_Horizontal_Line">
            <div class="PFP_Complaints_Admins_Text_Complaint_Card">${array_Complaints[index].getdescription()} 
            </div>
                
               </div>
            </div> 
        </div>
        `
  }












