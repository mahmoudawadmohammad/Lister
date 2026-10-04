// Side Bar Start
const body = document.querySelector("body");
const sidebar = body.querySelector("nav");
const toggle = body.querySelector(".toggle");

toggle.addEventListener("click", () => {
  sidebar.classList.toggle("close");
});

// Side Bar End
// ---------------------- //

// Abbrevations General Start
document.addEventListener("keydown", (e) => {
  if (e.key.toLowerCase() === "l" && e.altKey)
    sidebar.classList.toggle("close");
  if (e.key.toLowerCase() === "p" && e.altKey) location.href = "Main_Page.html";
  if (e.key.toLowerCase() === "m" && e.altKey)
    location.href = "Menus_Page.html";
  if (e.key.toLowerCase() === "o" && e.altKey)
    location.href = "Orders_Page.html";
  if (e.key.toLowerCase() === "e" && e.altKey) location.href = "Mail_Page.html";
  if (e.key.toLowerCase() === "a" && e.ctrlKey && e.altKey)
    location.href = "Advertisements_Page.html";
  if (e.key.toLowerCase() === "s" && e.ctrlKey && e.altKey)
    location.href = "Settings_Page.html";
  if (e.key.toLowerCase() === "t" && e.shiftKey)
    document.getElementById("todo-list").click();
  if (e.key.toLowerCase() === "n" && e.shiftKey)
    document.getElementById("sticky-note").click();
  if (e.key.toLowerCase() === "l" && e.shiftKey) CheckLanguage();
  if (e.key.toLowerCase() === "m" && e.shiftKey) ChangeMode();
});

// Toggle Extenstion Tool
let btn_togle_et = document.getElementById("toggle_Extenstions_Tool");
let ExtenstionTool = document.querySelector(".extension-tool");

function ToggleExtenstionTool() {
  if (ExtenstionTool.style.display === "block") {
    ExtenstionTool.style.display = "none";
    if (document.querySelector("html").lang === "en")
      btn_togle_et.innerHTML = "Show Extensions Tools";
    else btn_togle_et.innerHTML = "إظهار الأدوات الإضافية";
  } else {
    ExtenstionTool.style.display = "block";
    if (document.querySelector("html").lang === "en")
      btn_togle_et.innerHTML = "Hide Extensions Tools";
    else btn_togle_et.innerHTML = "إخفاء الأدوات الإضافية";
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

// Abbrevations General End
// ---------------------- //

// Up Arrow Start

let span_upArrow = document.querySelector(".up-arrow");
window.onscroll = function () {
  if (this.scrollY >= 30) span_upArrow.classList.add("show");
  else span_upArrow.classList.remove("show");
};

span_upArrow.onclick = function () {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
};

// Up Arrow End
// ---------------------- //

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
submitodo.onclick = function () {
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
    span.appendChild(document.createTextNode("Delete"));
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
      arrayOfTasks[i].completed == false
        ? (arrayOfTasks[i].completed = true)
        : (arrayOfTasks[i].completed = false);
    }
  }
  addDataToLocalStorageFrom(arrayOfTasks);
}

// To Do List End
// ---------------------- //

// Sticky Note Start
const form = document.querySelector("#new-task-form");
const input = document.querySelector("#new-task-input");
const list_el = document.querySelector("#tasks");
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
    task_input_el.setAttribute("dir", "auto");
    task_input_el.setAttribute("spellcheck", "false");
    task_input_el.setAttribute("autocomplete", "off");
    task_input_el.setAttribute("readonly", "readonly");
    task_content_el.appendChild(task_input_el);
    const task_actions_el = document.createElement("div");
    task_actions_el.classList.add("actions");
    const task_edit_el = document.createElement("button");
    task_edit_el.classList.add("edit");
    task_edit_el.innerText = "Edit";
    const task_delete_el = document.createElement("button");
    task_delete_el.classList.add("delete");
    task_delete_el.innerText = "Delete";
    task_actions_el.appendChild(task_edit_el);
    task_actions_el.appendChild(task_delete_el);
    task_el.appendChild(task_actions_el);
    list_el.appendChild(task_el);
    input.value = "";
    let task_delete_all = document.getElementById("clear-all");
    task_delete_all.style.display = "block";
    task_edit_el.addEventListener("click", (e) => {
      if (task_edit_el.innerText.toLowerCase() == "edit") {
        task_edit_el.innerText = "Save";
        task_input_el.removeAttribute("readonly");
        task_input_el.focus();
      } else {
        task_edit_el.innerText = "Edit";
        task_input_el.setAttribute("readonly", "readonly");
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

// Sticky Note End
// ---------------------- //

//  Count Characters In TextArea   //
function charactersCountContentAd() {
  let elementAd = document.getElementById("AdvertismentContent").value.length;
  if (!document.body.classList.contains("arabic"))
    document.getElementById("charactersCountAd").innerText =
      " 350 / " + elementAd + " (The maximum Limit 350 Characters)";
  else
    document.getElementById("charactersCountAd").innerText =
      " 350 / " + elementAd + " (الحد الأقصى لعدد المحارف)";
}

//  Count Characters In TextArea   //
function charactersCount() {
  let elementNote = document.getElementById("Ads_Simplified_Content").value
    .length;
  if (!document.body.classList.contains("arabic"))
    document.getElementById("charactersCountNote").innerText =
      " 150 / " + elementNote + " (The maximum Limit 150 Characters)";
  else
    document.getElementById("charactersCountNote").innerText =
      " 150 / " + elementNote + " (الحد الأقصى لعدد المحارف)";
}

// Logout From Current Account
function logout() {
  location.replace("../html/Restaurant_Login_Page.html");
}
