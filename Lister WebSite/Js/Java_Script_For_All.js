// Side Bar Start
const body = document.querySelector("body");
const sidebar = body.querySelector("nav");
const toggle = body.querySelector(".toggle");

toggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
});

// Side Bar End
// ---------------------- //
// Toggle Extenstion Tool Star //
function ToggleExtenstionTool() {
    if (document.getElementById("PFP_Extension_Tool").style.display === 'none') {
        document.getElementById("PFP_Extension_Tool").style.display = 'flex';
        if (document.querySelector('html').dir === "ltr")
            document.getElementById('toggle_Extenstions_Tool').innerHTML = "Hide Extension Tools";
        else
            document.getElementById('toggle_Extenstions_Tool').innerHTML = "إخفاء الأدوات الإضافية";
    } else {
        document.getElementById("PFP_Extension_Tool").style.display = 'none';
        if (document.querySelector('html').dir === "ltr")
            document.getElementById('toggle_Extenstions_Tool').innerHTML = "Show Extension Tools";
        else
            document.getElementById('toggle_Extenstions_Tool').innerHTML = "إظهار الأدوات الإضافية";
    }
}
// Toggle Extenstion Tool End //
// ---------------------- //
// Sticky Note Start
const form = document.querySelector("#PFP_Popup_Window_Sticky_Note_Add_Note_Form");
const input = document.querySelector("#PFP_Popup_Window_Sticky_Note_Add_Note_Input");
const list_el = document.querySelector("#PFP_Popup_Window_Sticky_Note_Container_Tasks");
form.addEventListener("submit", (e) => {
    e.preventDefault();
    const task = input.value;
    if (task === "") {
        alert("Please Enter Any Thing");
    } else {
        const task_el = document.createElement("div");
        task_el.classList.add("task");
        const task_content_el = document.createElement("div");
        task_content_el.classList.add("content");
        task_el.appendChild(task_content_el);
        const task_input_el = document.createElement("input");
        task_input_el.classList.add("text");
        task_input_el.type = "text";
        task_input_el.value = task;
        task_input_el.setAttribute("spellcheck", "false");
        task_input_el.setAttribute("autocomplete", "off");
        task_input_el.setAttribute("readonly", "readonly");
        task_content_el.appendChild(task_input_el);
        const task_actions_el = document.createElement("div");
        task_actions_el.classList.add("actions");
        const task_edit_el = document.createElement("button");
        task_edit_el.classList.add("edit");
        if (document.getElementsByTagName("html")[0].dir === "ltr") {
            task_edit_el.innerText = "Edit";
        } else {
            task_edit_el.innerText = "تعديل";
        }
        const task_delete_el = document.createElement("button");
        task_delete_el.classList.add("delete");
        if (document.getElementsByTagName("html")[0].dir === "ltr") {
            task_delete_el.innerText = "Delete";
        } else {
            task_delete_el.innerText = "حذف";
        }
        task_actions_el.appendChild(task_edit_el);
        task_actions_el.appendChild(task_delete_el);
        task_el.appendChild(task_actions_el);
        list_el.appendChild(task_el);
        input.value = "";
        let task_delete_all = document.getElementById("PFP_Popup_Window_Sticky_Note_Clear_Button");
        task_delete_all.style.display = "block";
        task_edit_el.addEventListener("click", (e) => {
            if (document.getElementsByTagName("html")[0].dir === "ltr") {
                if (task_edit_el.innerText.toLowerCase() == "Edit") {
                    task_edit_el.innerText = "Save";
                    task_input_el.removeAttribute("readonly");
                    task_input_el.focus();
                } else {
                    task_edit_el.innerText = "Edit";
                    task_input_el.setAttribute("readonly", "readonly");
                }
            } else {
                if (task_edit_el.innerText.toLowerCase() == "تعديل") {
                    task_edit_el.innerText = "حفظ";
                    task_input_el.removeAttribute("readonly");
                    task_input_el.focus();
                } else {
                    task_edit_el.innerText = "تعديل";
                    task_input_el.setAttribute("readonly", "readonly");
                }
            }
        });
        task_delete_el.addEventListener("click", (e) => {
            list_el.removeChild(task_el);
            count_tasks--;
        });
        task_delete_all.addEventListener("click", (e) => {
            list_el.innerHTML = "";
            task_delete_all.style.display = "none";
        });
    }
});

// To Do List Start
let inputodo = document.querySelector(".input");
let submitodo = document.querySelector(".add");
let tasksDiv = document.querySelector(".tasks");

// Empty Array To Store The Tasks
let arrayOfTasks = [];

// Check if Theres Tasks In Local Storage
if (localStorage.getItem("tasks")) {
    arrayOfTasks = JSON.parse(localStorage.getItem("tasks"));
}

// Trigger Get Data From Local Storage Function
getDataFromLocalStorage();

// Add Task
submitodo.onclick = function() {
    if (inputodo.value !== "") {
        addTaskToArray(inputodo.value); // Add Task To Array Of Tasks
        inputodo.value = ""; // Empty Input Field
    }
};

document.addEventListener("keydown", (e) => {
    if (e.keyCode == 13)
        if (inputodo.value !== "") {
            addTaskToArray(inputodo.value); // Add Task To Array Of Tasks
            inputodo.value = ""; // Empty Input Field
        }
});

// Click On Task Element
tasksDiv.addEventListener("click", (e) => {
    // Delete Button
    if (e.target.classList.contains("del")) {
        // Remove Task From Local Storage
        deleteTaskWith(e.target.parentElement.getAttribute("data-id"));
        // Remove Element From Page
        e.target.parentElement.remove();
    }
    // Task Element
    if (e.target.classList.contains("task")) {
        // Toggle Completed For The Task
        toggleStatusTaskWith(e.target.getAttribute("data-id"));
        // Toggle Done Class
        e.target.classList.toggle("done");
    }
});

function addTaskToArray(taskText) {
    // Task Data
    const task = {
        id: Date.now(),
        title: taskText,
        completed: false,
    };
    // Push Task To Array Of Tasks
    arrayOfTasks.push(task);
    // Add Tasks To Page
    addElementsToPageFrom(arrayOfTasks);
    // Add Tasks To Local Storage
    addDataToLocalStorageFrom(arrayOfTasks);
}

function addElementsToPageFrom(arrayOfTasks) {
    // Empty Tasks Div
    tasksDiv.innerHTML = "";
    // Looping On Array Of Tasks
    arrayOfTasks.forEach((task) => {
        // Create Main Div
        let div = document.createElement("div");
        div.className = "task";
        // Check If Task is Done
        if (task.completed) {
            div.className = "task done";
        }
        div.setAttribute("data-id", task.id);
        div.appendChild(document.createTextNode(task.title));
        // Create Delete Button
        let span = document.createElement("span");
        span.className = "del";
        if (document.getElementsByTagName("html")[0].dir === "ltr")
            span.appendChild(document.createTextNode("Delete"));
        else
            span.appendChild(document.createTextNode("حذف"));
        // Append Button To Main Div
        div.appendChild(span);
        // Add Task Div To Tasks Container
        tasksDiv.appendChild(div);
    });
}

function addDataToLocalStorageFrom(arrayOfTasks) {
    window.localStorage.setItem("tasks", JSON.stringify(arrayOfTasks));
}

function getDataFromLocalStorage() {
    let data = window.localStorage.getItem("tasks");
    if (data) {
        let tasks = JSON.parse(data);
        addElementsToPageFrom(tasks);
    }
}

function deleteTaskWith(taskId) {
    // For Explain Only
    // for (let i = 0; i < arrayOfTasks.length; i++) {
    //   console.log(`${arrayOfTasks[i].id} === ${taskId}`);
    // }
    arrayOfTasks = arrayOfTasks.filter((task) => task.id != taskId);
    addDataToLocalStorageFrom(arrayOfTasks);
}

function toggleStatusTaskWith(taskId) {
    for (let i = 0; i < arrayOfTasks.length; i++) {
        if (arrayOfTasks[i].id == taskId) {
            arrayOfTasks[i].completed == false ?
                (arrayOfTasks[i].completed = true) :
                (arrayOfTasks[i].completed = false);
        }
    }
    addDataToLocalStorageFrom(arrayOfTasks);
}

// To Do List End
// ---------------------- //
// toggle.addEventListener("click", () => {
//     sidebar.classList.toggle("close");
// });
// ---------------------- //
//    <i class="fa-solid fa-angle-right toggle" title="Let's Go ( Alt + O )" id="PFP_Toggle"></i>

document.addEventListener("keydown", (e) => {
    if (e.key.toLowerCase() === "o" && e.altKey)
        sidebar.classList.remove("close");
    // if (e.key.toLowerCase() === "c" && e.altKey)
    //     sidebar.classList.add("close");
    //     if (e.key.toLowerCase() === "s" && e.altKey) topSearch.focus();
    //     if (e.key.toLowerCase() === "p" && e.altKey) location.href = "Main_Page.html";
    if (e.key.toLowerCase() === "h" && e.altKey)
        location.href = "Admin_Home_Page.html";
    if (e.key.toLowerCase() === "d" && e.altKey)
        location.href = "Admin_Delivery_Men_Page.html";
    if (e.key.toLowerCase() === "c" && e.shiftKey && e.altKey)
        location.href = "Admin_Customers_Page.html";
    if (e.key.toLowerCase() === "a" && e.shiftKey && e.altKey)
        location.href = "Admin_Admins_Page.html";
    if (e.key.toLowerCase() === "r" && e.altKey)
        location.href = "Admin_Restaurants_Page.html";
    if (e.key.toLowerCase() === "a" && e.ctrlKey && e.altKey)
        location.href = "Admin_Advertisements_Page.html";
    if (e.key.toLowerCase() === "c" && e.ctrlKey && e.altKey)
        location.href = "Admin_Complaints_page.html";
    if (e.key.toLowerCase() === "s" && e.altKey)
        location.href = "Admin_Settings_Page.html";
    //     if (e.key.toLowerCase() === "o" && e.altKey)
    //         location.href = "Orders_Page.html";
    //     if (e.key.toLowerCase() === "e" && e.altKey) location.href = "Mail_Page.html";
    //     if (e.key.toLowerCase() === "a" && e.ctrlKey && e.altKey)
    //         location.href = "Advertisements_Page.html";
    //     if (e.key.toLowerCase() === "s" && e.ctrlKey && e.altKey)
    //         location.href = "Settings_Page.html";
    //     if (e.key.toLowerCase() === "t" && e.shiftKey)
    //         document.getElementById("todo-list").click();
    //     if (e.key.toLowerCase() === "n" && e.shiftKey)
    //         document.getElementById("sticky-note").click();
    //     if (e.key.toLowerCase() === "l" && e.shiftKey) CheckLanguage();
    //     if (e.key.toLowerCase() === "m" && e.shiftKey) ChangeMode();
});

// Abbrevations General End
// ---------------------- //

function PFP_Change_Language_Admin_pages() {
    if (document.getElementsByTagName("html")[0].dir === "rtl")
        document.getElementsByTagName("html")[0].dir = "ltr";
    else
        document.getElementsByTagName("html")[0].dir = "rtl";
    if (document.getElementsByTagName("html")[0].dir === "rtl") {
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
        document.getElementById("todo-list").title = "قائمة المهام ( Shift + T )";
        document.getElementById("sticky-note").title = "ملاحظات ( Shift + N )";
        document.getElementById("languages").title = "اللغة ( Shift + L )";
        document.getElementById("sticky-note").title = "وضع الالوان ( Shift + M )";
        document.getElementById("PFP_Log_out").innerHTML = "سجل خرج";
        document.getElementById("Btn_close").innerHTML = "اغلاق";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Top_Title").innerHTML = "ملاحظات";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Main_Title").innerHTML = "ملاحظات";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Clear_Button").innerHTML = "إزالة الجميع";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Down_Button_Close").innerHTML = "إغلاق";
        document.PFP_Popup_Window_Sticky_Note_Add_Note_Form_Name.PFP_Popup_Window_Sticky_Note_Add_Note_Button_Name.value = "أضف ملاحظة";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Add_Note_Input").placeholder = "أدخل أي ملاحظة تريدها";
        document.getElementById("PFP_Popup_Window_To_Do_List_Top_Title").innerHTML = "قائمة المهام";
        document.getElementById("PFP_Popup_Window_To_Do_List_Body_Title").innerHTML = "المهام";
        document.getElementById("PFP_Popup_Window_To_Do_List_Down_Button_Close").innerHTML = "إغلاق";
        document.PFP_Popup_Window_To_Do_List_Form_Name.PFP_Popup_Window_To_Do_List_Button_Name.value = "أضف مهمة";
        document.getElementById("PFP_Popup_Window_To_Do_List_Input").placeholder = "أدخل أي شيء تريده";
        if (document.getElementById("toggle_Extenstions_Tool").innerHTML === "Hide Extension Tools")
            document.getElementById("toggle_Extenstions_Tool").innerHTML = "إخفاء الأدوات الإضافية";
        else
            document.getElementById("toggle_Extenstions_Tool").innerHTML = "إظهار الأدوات الإضافية";
        document.getElementById("PFP_Toggle").classList.remove("fa-angle-right");
        document.getElementById("PFP_Toggle").classList.add("fa-angle-left");
        let PFP_Array_Edit_Sticky_Note_Buttons = document.getElementsByClassName("edit");
        let PFP_Array_Delete_Sticky_Note_Buttons = document.getElementsByClassName("delete");
        let PFP_Array_Delete_To_Do_List_Buttons = document.getElementsByClassName("del");
        for (let i = 0; i < PFP_Array_Edit_Sticky_Note_Buttons.length; i++) {
            PFP_Array_Edit_Sticky_Note_Buttons[i].innerHTML = "تعديل";
            PFP_Array_Delete_Sticky_Note_Buttons[i].innerHTML = "حذف";
        }
        for (let i = 0; i < PFP_Array_Delete_To_Do_List_Buttons.length; i++) {
            PFP_Array_Delete_To_Do_List_Buttons[i].innerHTML = "حذف";
        }
    } else {
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
        document.getElementById("todo-list").title = "To Do List ( Shift + T )";
        document.getElementById("sticky-note").title = "Sticky Note ( Shift + N )";
        document.getElementById("languages").title = "Language ( Shift + L )";
        document.getElementById("sticky-note").title = "Theme Mode ( Shift + M )";
        document.getElementById("Btn_close").innerHTML = "Close";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Top_Title").innerHTML = "Sticky Note";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Main_Title").innerHTML = "Notes";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Clear_Button").innerHTML = "Clear All";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Down_Button_Close").innerHTML = "Close";
        document.PFP_Popup_Window_Sticky_Note_Add_Note_Form_Name.PFP_Popup_Window_Sticky_Note_Add_Note_Button_Name.value = "Add Note";
        document.getElementById("PFP_Popup_Window_Sticky_Note_Add_Note_Input").placeholder = "Enter Any Note You Want";
        document.getElementById("PFP_Popup_Window_To_Do_List_Top_Title").innerHTML = "To Do List";
        document.getElementById("PFP_Popup_Window_To_Do_List_Body_Title").innerHTML = "Tasks";
        document.getElementById("PFP_Popup_Window_To_Do_List_Down_Button_Close").innerHTML = "Close";
        document.PFP_Popup_Window_To_Do_List_Form_Name.PFP_Popup_Window_To_Do_List_Button_Name.value = "Add Task";
        document.getElementById("PFP_Popup_Window_To_Do_List_Input").placeholder = "Enter Any Thing You Want";
        let PFP_Array_Edit_Sticky_Note_Buttons = document.getElementsByClassName("edit");
        let PFP_Array_Delete_Sticky_Note_Buttons = document.getElementsByClassName("delete");
        let PFP_Array_Delete_To_Do_List_Buttons = document.getElementsByClassName("del");
        for (let i = 0; i < PFP_Array_Edit_Sticky_Note_Buttons.length; i++) {
            PFP_Array_Edit_Sticky_Note_Buttons[i].innerHTML = "Edit";
            PFP_Array_Delete_Sticky_Note_Buttons[i].innerHTML = "Delete";
        }
        for (let i = 0; i < PFP_Array_Delete_To_Do_List_Buttons.length; i++) {
            PFP_Array_Delete_To_Do_List_Buttons[i].innerHTML = "Delete";
        }
        if (document.getElementById("toggle_Extenstions_Tool").innerHTML === "إخفاء الأدوات الإضافية")
            document.getElementById("toggle_Extenstions_Tool").innerHTML = "Hide Extension Tools";
        else
            document.getElementById("toggle_Extenstions_Tool").innerHTML = "Show Extension Tools";
        document.getElementById("PFP_Toggle").classList.remove("fa-angle-left");
        document.getElementById("PFP_Toggle").classList.add("fa-angle-right");
    }
}

function ChangeMode() {
    document.body.classList.toggle("dark-theme");
    if (document.body.classList.contains("dark-theme"))
        localStorage.setItem("theme", "dark-theme");
    else localStorage.setItem("theme", "light-theme");
    // location.reload();
}

onload = () => {
    document.body.classList.add(localStorage.getItem("theme"));
};