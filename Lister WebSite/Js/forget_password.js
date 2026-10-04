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
  if (e.key.toLowerCase() === "p" && e.altKey) phoneNumber.focus();
  if (e.key.toLowerCase() === "s" && e.altKey)
    document.querySelector(".btn_send .btn_submit").click();
  if (e.key.toLowerCase() === "a" && e.shiftKey)
    document.getElementById("arabic").click();
  if (e.key.toLowerCase() === "e" && e.shiftKey)
    document.getElementById("english").click();
});

// Abbrevations End
// ---------------------- //

//   Form Vaildation   //
let html = document.querySelector("html");
let form = document.querySelector("form");
let phoneNumber = document.getElementById("PhoneNumber");
let message_PhoneNumber = document.getElementById("messagePhoneNumber");
let countMistake = 0;
form.addEventListener("submit", (e) => {
  if (countMistake >= 0) {
    e.preventDefault();
    CheckInputs();
  } else {
    e.preventDefault();
    newLocation();
  }
})

function newLocation() {
  window.location.href="../html/Password_Verification_Page.html";
}

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
    setErrorForWindow(phoneNumber);
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
    setErrorForWindow(phoneNumber);
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
    setErrorForWindow(phoneNumber);
  } else {
    CheckMessageSuccess(message_PhoneNumber, "none");
    setSuccessForWindow(phoneNumber);
  }
}

function setErrorForWindow(input) {
  countMistake++;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("error");
  formcontrol.classList.remove("success");
}

function setSuccessForWindow(input) {
  countMistake = -1;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("success");
  formcontrol.classList.remove("error");
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
    document.querySelector("title").innerHTML = "نسيت كلمة المرور ؟";
    document.getElementById("linkArabic").href =
      "../css/Restaurant_Login_Arabic_Page.css";
    document.querySelector(".login-container h2").innerHTML =
      "نسيت كلمة المرور ؟";
    document.querySelector(".login-container h5").innerHTML =
      "من فضلك أدخل رقم هاتفك وسنرسل لك تعليمات لإعادة تعيين كلمة مرورك";
    document.querySelector(".login-container .one h5").innerHTML = "رقم الهاتف";
    document.querySelector(".login-container .one input").title =
      "(Alt + P) رقم الهاتف";
    document.querySelector(
      ".login-container .one .check .fa-check-circle"
    ).title = "أيقونة القبول";
    document.querySelector(
      ".login-container .one .check .fa-exclamation-circle"
    ).title = "أيقونة الرفض";
    document.querySelector(".btn_send").title = "(Alt + S) إرسال";
    document.querySelector(".btn_send .btn_submit").value = "إرسال";
    document.querySelector(".btn_send .i i").title = "أيقونة الإرسال";
    document.querySelector(".languages #arabic").title =
      "(Shift + A) اختر اللغة العربية";
    document.querySelector(".languages #english").title =
      "(Shift + E) اختر اللغة الانكليزية";
  } else if (getLanguage == "english") {
    document.body.classList.remove("arabic");
    document.querySelector("html").dir = "ltr";
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Forgot your password ?";
    document.getElementById("linkArabic").href =
      "../css/Restaurant_Login_Arabic_Page.css";
    document.querySelector(".login-container h2").innerHTML =
      "Forgot your password ?";
    document.querySelector(".login-container h5").innerHTML =
      "Please Enter your phone number, and we'll send you instructions to reset your password";
    document.querySelector(".login-container .one h5").innerHTML =
      "Phone Number";
    document.querySelector(".login-container .one input").title =
      "Phone Number (Alt + P)";
    document.querySelector(
      ".login-container .one .check .fa-check-circle"
    ).title = "Accept icon";
    document.querySelector(
      ".login-container .one .check .fa-exclamation-circle"
    ).title = "Refusal icon";
    document.querySelector(".btn_send").title = "Send (Alt + S)";
    document.querySelector(".btn_send .btn_submit").value = "Send";
    document.querySelector(".btn_send .i i").title = "Send Icon";
    document.querySelector(".languages #arabic").title =
      "Choose Arabic Language (Shift + A)";
    document.querySelector(".languages #english").title =
      "Choose English Language (Shift + E)";
  }
}
//   Change Language Website End   //
// ---------------------- //

// Loader Start

let vanish = () => {
  document.querySelector(".loader-container").classList.add("fade-out");
};
// Loader End
// ---------------------- //
