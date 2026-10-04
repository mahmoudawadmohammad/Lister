//   Main InterFace   //
let inputs = document.querySelectorAll(".input");
function focus_Function() {
  let parent = this.parentElement.parentElement;
  parent.classList.add("focus");
}

function blur_Function() {
  let parent = this.parentElement.parentElement;
  if (this.value == "") parent.classList.remove("focus");
}

inputs.forEach((input) => {
  input.addEventListener("focus", focus_Function);
  input.addEventListener("blur", blur_Function);
});

// Abbrevations Start
document.addEventListener("keydown", (e) => {
  if (e.key.toLowerCase() === "n" && e.altKey) phoneNumber.focus();
  if (e.key.toLowerCase() === "p" && e.altKey) password.focus();
  if (e.key.toLowerCase() === "a" && e.shiftKey)
    document.getElementById("arabic").click();
  if (e.key.toLowerCase() === "e" && e.shiftKey)
    document.getElementById("english").click();
  if (e.key.toLowerCase() === "s" && e.altKey)
    document.querySelector(".btn_send .btn_submit").click();
});

// Abbrevations End
// ---------------------- //

//   Form Vaildation   //
let form = document.querySelector("form");
let phoneNumber = document.getElementById("phoneNumber");
let password = document.getElementById("password");
let message_PhoneNumber = document.getElementById("messagePhoneNumber");
let message_password = document.getElementById("messagePassword");
let phoneStatus = false;
let passwordStatus = false;
form.addEventListener("submit", (e) => {
  if (!phoneStatus || !passwordStatus) e.preventDefault();
  CheckInputs();
});
function CheckInputs() {
  if (phoneNumber.value.trim() === "" || phoneNumber.value.trim() === "09") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_PhoneNumber,
        "لا يمكن أن يكون رقم الهاتف فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_PhoneNumber,
        "The Phone Number Can't Be Empty",
        "block"
      );
    setError(phoneNumber);
  } else if (isNaN(phoneNumber.value)) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_PhoneNumber,
        "لا يمكن إدخال نص فقط أرقام",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_PhoneNumber,
        "You Can't Input Text Just Number",
        "block"
      );
    setError(phoneNumber);
  } else if (
    phoneNumber.value.charAt(0) !== "0" ||
    phoneNumber.value.charAt(1) !== "9"
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(message_PhoneNumber, "يحب أن يبدا الرقم ب 09", "block");
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_PhoneNumber,
        "Should Phone Number Begin With 09",
        "block"
      );
    setError(phoneNumber);
  } else {
    CheckMessageSuccess(message_PhoneNumber, "none");
    phoneStatus = true;
    setSuccess(phoneNumber);
  }
  if (password.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_password,
        "لا يمكن أن تكون كلمة السر فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_password,
        "The Password Can't Be Empty",
        "block"
      );
    setError(password);
  } else {
    CheckMessageSuccess(message_password, "none");
    passwordStatus = true;
    setSuccess(password);
  }
}

function setSuccess(input) {
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("success");
  formcontrol.classList.remove("error");
}

function setError(input) {
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("error");
  formcontrol.classList.remove("success");
}

function CheckMessageError(element, message, visibility) {
  element.innerText = message;
  element.style.display = visibility;
}

function CheckMessageSuccess(element, visibility) {
  element.innerText = "";
  element.style.display = visibility;
}

//   Change Language Website Start   //
document.getElementById("arabic").onclick = () => {
  setLanguage("arabic");
  localStorage.setItem("Lang", "arabic");
  document.querySelector(".loader-container").classList.remove("fade-out");
  location.reload();
};

document.getElementById("english").onclick = () => {
  setLanguage("english");
  localStorage.setItem("Lang", "english");
  document.querySelector(".loader-container").classList.remove("fade-out");
  location.reload();
};

onload = () => {
  setLanguage(localStorage.getItem("Lang"));
  vanish();
};

function setLanguage(getLanguage) {
  if (getLanguage == "arabic") {
    document.body.classList.add("arabic");
    document.querySelector("html").dir = "rtl";
    document.querySelector("html").lang = "ar";
    document.querySelector("title").innerHTML = "صفحة تسجيل الدخول للمشرف";
    document.getElementById("linkArabic").href =
      "../css/Restaurant_Login_Arabic_Page.css";
    document.querySelector(".login-container h2").innerHTML = "مرحبا بك";
    document.querySelector(".login-container .one h5").innerHTML = "رقم الهاتف";
    document.querySelector(".login-container .one input").title =
      "(Alt + N) رقم الهاتف";
    document.querySelector(".login-container .two h5").innerHTML =
      "كلمة المرور";
    document.querySelector(".login-container .two input").title =
      "(Alt + P) كلمة المرور";
    document.querySelector(".btn_submit").value = "تسجيل الدخول";
    document.querySelector(".create-container a span").innerHTML =
      "نسيت كلمة المرور ؟؟؟";
    document.querySelector(".btn_send").title = "(Alt + S) إرسال";
    document.querySelector(".languages #arabic").title =
      "(Shift + A) اختر اللغة العربية";
    document.querySelector(".languages #english").title =
      "(Shift + E) اختر اللغة الانكليزية";
  } else if (getLanguage == "english") {
    document.body.classList.remove("arabic");
    document.querySelector("html").dir = "ltr";
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Admin Login Page";
    document.getElementById("linkArabic").href = "";
    document.querySelector(".login-container h2").innerHTML = "Welcome";
    document.querySelector(".login-container .one h5").innerHTML =
      "Phone Number";
    document.querySelector(".login-container .one input").title =
      "Phone Number (Alt + N)";
    document.querySelector(".login-container .two h5").innerHTML = "Password";
    document.querySelector(".login-container .two input").title =
      "Password (Alt + P)";
    document.querySelector(".btn_submit").value = "Login";
    document.querySelector(".create-container a span").innerHTML =
      "forget My Password ???";
    document.querySelector(".btn_send").title = "Send (Alt + S)";
    document.querySelector(".languages #arabic").title =
      "Choose Arabic Language (Shift + A)";
    document.querySelector(".languages #english").title =
      "Choose English Language (Shift + E)";
  }
}
//   Change Language Website End   //

// Loader Start

let vanish = () => {
  document.querySelector(".loader-container").classList.add("fade-out");
};

// function fadeOut() {
//   setInterval(loader, 3000);
// }
// Loader End
// ---------------------- //

// let state = false;
// if (documet.getElementById("password").value === null) 
//   document.querySelector(".show").style.display = "none";
//   else 
//   document.querySelector(".show").style.display = "block";
// function tooglepas() {
//   if (state) {
//     documet.getElementById("password").setAttribute("type", "password");
//     state = false;
//   } else {
//     documet.getElementById("password").setAttribute("type", "text");
//     state = true;
//   }
// }

//Show Password
const showPassword = document.getElementById("showicon");
showPassword.onclick = () => {
  if (password.type == "password") {
    password.type = "text";
    showPassword.classList.replace("fa-eye-slash","fa-eye");
  } else {
    password.type = "password";
    showPassword.classList.replace("fa-eye","fa-eye-slash");
  }
};


// ApI Js Start
const api = "http://192.168.43.116:8040/api/Restaurants";
const apiBackUp = "http://192.168.201.136:8030/api/Restaurants";
function getItems() {
  fetch(api)
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Unable to get items.', error));
}

function SignIn() {
  const item = {
    isComplete: false,
    email: document.getElementById("email").value,
    Password: document.getElementById("password").value
  }
  fetch(api, {
    method: 'POST',
            mode: 'cors',
            cache: 'no-cache',
            credentials: 'same-origin' ,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify(item)
  })
    .then(response => response.json())
    .then(data => { if(data['length'] > 0){
RId = data['Restaurant_id'],
Rname = data['name'],
Rlogo = data['logo'],
Raddress = data['address'],
Rcity = data['city'],
Rphone = data['phone'],
Rtype = data['type'],
RtotalTables = data['total_tables'],
Remail = data['email'],
Rpassword = data['password'],
Ractivation = data['activation'],
RownerId = data['Owner_id']
newLocation();
    }
    else
    {
      message_password.innerText = "Password or Email incorrect";
      message_password.style.display = "block";
      setErrorFor(password);
    }
})
    .catch(error => console.error('Unable to add item.', error));
}

function newLocation() {
  window.location.href="../Html/Restaurant_Home_Page.html";
}

let Rname;
let Rlogo;
let Raddress;
let Rcity;
let Rphone;
let Rtype;
let RtotalTables;
let Remail;
let Rpassword;
let Ractivation;
let RownerId;
let RId;
// async function getData() {
//   try {
//     const response = await fetch(api);
//     const data = await response.json();
//     console.log(data);
//     CheckInputs(data)
//   }catch(e) {
//   console.log(e.message);
//   }
// }
// getData();

// function CheckInputs(data) {
//   if (email.value.trim() === "") {
//     message_email.innerText = "The Email Can't Be Empty";
//     message_email.style.display = "block";
//     setErrorFor(email);
//   } else if (!isValidEmail(email.value)) {
//     message_email.innerText = "The Email Is Invalid";
//     message_email.style.display = "block";
//     setErrorFor(email);
//   } else if(email.value !== data.email){
//     message_email.innerText = "The Email Incorrect";
//     message_email.style.display = "block";
//     setErrorFor(email);
//   } else if (email.value === data.email) {
//     message_email.innerText = "";
//     message_email.style.display = "none";
//     setSuccessFor(email);
//   }
//   if (password.value.trim() === "") {
//     message_password.innerText = "The Password Can't Be Empty";
//     message_password.style.display = "block";
//     setErrorFor(password);
//   } else if (password.value !== data.password) {
//     message_password.innerText = "The Password Incorrect";
//     message_password.style.display = "block";
//     setErrorFor(password);
//   } else if (password.value === data.password) {
//     message_password.innerText = "";
//     message_password.style.display = "none";
//     setSuccessFor(password);
//   }
// }

// --------------------
// ApI Js End