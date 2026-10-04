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
  if (e.key.toLowerCase() === "r" && e.altKey)
    document
      .querySelector(".container .login-container .create-container button")
      .click();
  if (e.key.toLowerCase() === "x" && e.altKey)
    document.querySelector(".modal .modal-footer .btn_close").click();
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
  if (!phoneStatus || !passwordStatus)
  //  {
      e.preventDefault();
  CheckInputs(); 
  // } else location.href = "../Html/Owner_Home_Page";
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
        "The Restaurant Phone Number Can't Be Empty",
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
    phoneStatus = true;
    setSuccessForWindow(phoneNumber);
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
    setErrorForWindow(password);
  } else {
    CheckMessageSuccess(message_password, "none");
    passwordStatus = true;
    setSuccessForWindow(password);
  }
}

function isValidEmail(email) {
  const re =
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
}

//    ( Window Popup )   //

//   Form Validation   //
let windowForm = document.getElementById("form-container");
let English_Owner_FirstName = document.getElementById("English_Owner_FirstName");
let Arabic_Owner_FirstName = document.getElementById("Arabic_Owner_FirstName");
let English_Owner_LastName = document.getElementById("English_Owner_LastName");
let Arabic_Owner_LastName = document.getElementById("Arabic_Owner_LastName");
let OwnerBirthDate = document.getElementById("BirthDateOwner");
let OwnerImage = document.getElementById("OwnerImage");
let OwnerPhone = document.getElementById("OwnerPhone");
let OwnerEmail = document.getElementById("OwnerEmail");
let Password_Email = document.getElementById("Password_Email");
let ConfirmPassword_Email = document.getElementById("ConfirmPassword_Email");
let message_English_Owner_FirstName = document.getElementById(
  "message-English-Owner-FirstName"
);
let message_Arabic_Owner_FirstName = document.getElementById(
  "message-Arabic-Owner-FirstName"
);
let message_English_Owner_LastName = document.getElementById(
  "message-English-Owner-LastName"
);
let message_Arabic_Owner_LastName = document.getElementById(
  "message-Arabic-Owner-LastName"
);
let message_OwnerBirthDate = document.getElementById("message-BirthDate-Owner");
let message_OwnerLogo = document.getElementById("message-OwnerImage");
// let message_OwnerAddress = document.getElementById(
//   "message-OwnerAddress"
// );
let message_OwnerPhone = document.getElementById(
  "message-OwnerPhone"
);
let message_OwnerEmail = document.getElementById(
  "message-OwnerEmail"
);
let message_PasswordEmail = document.getElementById("message-PasswordEmail");
let message_ConfirmPasswordEmail = document.getElementById(
  "message-ConfirmPasswordEmail"
);
let countMistakeWindow = 0;
windowForm.addEventListener("submit", (e) => {
  if (countMistakeWindow >= 0) 
  //  {
    e.preventDefault();
    CheckInputsWindow(); 
    // } else location.href = "../Html/Owner_Home_Page";
});

function CheckInputsWindow() {
  if (English_Owner_FirstName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_English_Owner_FirstName,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_English_Owner_FirstName,
        "The Name Can't Be Empty",
        "block"
      );
    setErrorForWindow(English_Owner_FirstName);
  } else {
    CheckMessageSuccess(message_English_Owner_FirstName, "none");
    setSuccessForWindow(English_Owner_FirstName);
  }
  if (Arabic_Owner_FirstName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_Arabic_Owner_FirstName,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_Arabic_Owner_FirstName,
        "The Name Can't Be Empty",
        "block"
      );
    setErrorForWindow(Arabic_Owner_FirstName);
  } else {
    CheckMessageSuccess(message_Arabic_Owner_FirstName, "none");
    setSuccessForWindow(Arabic_Owner_FirstName);
  }
  if (English_Owner_LastName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_English_Owner_LastName,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_English_Owner_LastName,
        "The Name Can't Be Empty",
        "block"
      );
    setErrorForWindow(English_Owner_LastName);
  } else {
    CheckMessageSuccess(message_English_Owner_LastName, "none");
    setSuccessForWindow(English_Owner_LastName);
  }
  if (Arabic_Owner_LastName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_Arabic_Owner_LastName,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_Arabic_Owner_LastName,
        "The Name Can't Be Empty",
        "block"
      );
    setErrorForWindow(Arabic_Owner_LastName);
  } else {
    CheckMessageSuccess(message_Arabic_Owner_LastName, "none");
    setSuccessForWindow(Arabic_Owner_LastName);
  }
  if (OwnerBirthDate.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_OwnerBirthDate,
        "لا يمكن أن يكون تاريخ الولادة فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_OwnerBirthDate,
        "The BirthDate Can't Be Empty",
        "block"
      );
    setErrorForWindow(OwnerBirthDate);
  } else {
    CheckMessageSuccess(message_OwnerBirthDate, "none");
    setSuccessForWindow(OwnerBirthDate);
  }
  if (
    OwnerPhone.value.trim() === "" ||
    OwnerPhone.value.trim() === "09"
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_OwnerPhone,
        "لا يمكن أن يكون رقم الهاتف فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_OwnerPhone,
        "The Phone Number Can't Be Empty",
        "block"
      );
    setErrorForWindow(OwnerPhone);
  } else if (isNaN(OwnerPhone.value)) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_OwnerPhone,
        "لا يمكن إدخال نص فقط أرقام",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_OwnerPhone,
        "You Can't Input Text Just Number",
        "block"
      );
    setErrorForWindow(OwnerPhone);
  } else if (
    OwnerPhone.value.charAt(0) !== "0" ||
    OwnerPhone.value.charAt(1) !== "9"
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_OwnerPhone,
        "يحب أن يبدا الرقم ب 09",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_OwnerPhone,
        "Should Phone Number Begin With 09",
        "block"
      );
    setErrorForWindow(OwnerPhone);
  } else {
    CheckMessageSuccess(message_OwnerPhone, "none");
    setSuccessForWindow(OwnerPhone);
  }
  if (OwnerEmail.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_OwnerEmail,
        "لا يمكن أن يكون البريد الإلكتروني فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_OwnerEmail,
        "The Email Can't Be Empty",
        "block"
      );
    setErrorForWindow(OwnerEmail);
  } else if (!isValidEmail(OwnerEmail.value)) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_OwnerEmail,
        "البريد الإلكتروني غير صالح",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_OwnerEmail,
        "The Email Is Invalid",
        "block"
      );
    setErrorForWindow(OwnerEmail);
  } else {
    CheckMessageSuccess(message_OwnerEmail, "none");
    setSuccessForWindow(OwnerEmail);
  }
  if (Password_Email.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_PasswordEmail,
        "لا يمكن أن تكون كلمة السر فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_PasswordEmail,
        "The Password Can't Be Empty",
        "block"
      );
    setErrorForWindow(Password_Email);
  } else {
    CheckMessageSuccess(message_PasswordEmail, "none");
    setSuccessForWindow(Password_Email);
  }
  if (ConfirmPassword_Email.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_ConfirmPasswordEmail,
        "لا يمكن أن يكون تأكيد كلمة السر فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_ConfirmPasswordEmail,
        "The Password Confirm Can't Be Empty",
        "block"
      );
    setErrorForWindow(ConfirmPassword_Email);
  } else if (
    ConfirmPassword_Email.value.trim() !== Password_Email.value.trim()
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_ConfirmPasswordEmail,
        "كلمة السر غير مطابقة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_ConfirmPasswordEmail,
        "The Password don't Match",
        "block"
      );
    setErrorForWindow(ConfirmPassword_Email);
  } else {
    CheckMessageSuccess(message_ConfirmPasswordEmail, "none");
    setSuccessForWindow(ConfirmPassword_Email);
  }
}

English_Owner_FirstName.addEventListener("keypress", function (e) {
  if (suppressNonEnglish(e)) return suppressNonEnglish(e);
  return (English_Owner_FirstName.value = "");
});
function suppressNonEnglish(EventKey) {
  var key = EventKey.keyCode;
  if (key > 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_English_Owner_FirstName,
        "Please Enter Just In English Language",
        "block"
      );
      setErrorForWindow(English_Owner_FirstName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_English_Owner_FirstName,
        "من فضلك أدخل فقط باللغة الإنكليزية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_English_Owner_FirstName, "none");
    setSuccessForWindow(English_Owner_FirstName);
    return true;
  }
}

Arabic_Owner_FirstName.addEventListener("keypress", function (e) {
  if (suppressNonArabic(e)) return suppressNonArabic(e);
  return (Arabic_Owner_FirstName.value = "");
});
function suppressNonArabic(EventKey) {
  var key = EventKey.keyCode;
  if (key < 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_Arabic_Owner_FirstName,
        "Please Enter Just In Arabic Language",
        "block"
      );
      setErrorForWindow(Arabic_Owner_FirstName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_Arabic_Owner_FirstName,
        "من فضلك أدخل فقط باللغة العربية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_Arabic_Owner_FirstName, "none");
    setSuccessForWindow(Arabic_Owner_FirstName);
    return true;
  }
}

English_Owner_LastName.addEventListener("keypress", function (e) {
  if (suppressNonEnglish(e)) return suppressNonEnglish(e);
  return (English_Owner_LastName.value = "");
});
function suppressNonEnglish(EventKey) {
  var key = EventKey.keyCode;
  if (key > 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_English_Owner_LastName,
        "Please Enter Just In Arabic Language",
        "block"
      );
      setErrorForWindow(English_Owner_LastName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_English_Owner_LastName,
        "من فضلك أدخل فقط باللغة العربية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_English_Owner_LastName, "none");
    setSuccessForWindow(English_Owner_LastName);
    return true;
  }
}

Arabic_Owner_LastName.addEventListener("keypress", function (e) {
  if (suppressNonArabic(e)) return suppressNonArabic(e);
  return (Arabic_Owner_LastName.value = "");
});
function suppressNonArabic(EventKey) {
  var key = EventKey.keyCode;
  if (key < 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_Arabic_Owner_LastName,
        "Please Enter Just In Arabic Language",
        "block"
      );
      setErrorForWindow(Arabic_Owner_LastName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_Arabic_Owner_LastName,
        "من فضلك أدخل فقط باللغة العربية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_Arabic_Owner_LastName, "none");
    setSuccessForWindow(Arabic_Owner_LastName);
    return true;
  }
}

function setErrorForWindow(input) {
  countMistakeWindow++;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("error");
  formcontrol.classList.remove("success");
}

function setSuccessForWindow(input) {
  countMistakeWindow = -1;
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
  setTimeout(() => {
    document.querySelector(".explain-btn").click();
  }, 3500);
};

function setLanguage(getLanguage) {
  if (getLanguage == "arabic") {
    document.body.classList.add("arabic");
    document.querySelector("html").dir = "rtl";
    document.querySelector("html").lang = "ar";
    document.querySelector("title").innerHTML = "صفحة تسجيل الدخول للمالك";
    document.getElementById("linkArabic").href =
      "../css/Restaurant_Login_Arabic_Page.css";
    
    document.querySelector("#explain .modal-header h5").innerHTML = "توضيح";
    document.querySelector("#explain .modal-body #sen1").innerHTML = "إذا كنت تملك حسابا فقط قم بتسجيل الدخول";
    document.querySelector("#explain .modal-body #sens1").innerHTML = "لربط المطاعم الخاصة بك ببعضها";
    document.querySelector("#explain .modal-body #sen2").innerHTML = "و إذا كنت لا تملك حساب فيجب عليك أن تقوم بإنشاء حساب";
    document.querySelector("#explain .modal-body #sens2").innerHTML = "لربط المطاعم الخاصة بك ببعضها";
    document.querySelector("#explain .modal-footer .btn_close").innerHTML = "خروج";
    document.querySelector(".login-container h2").innerHTML = "مرحبا بك";
    document.querySelector(".login-container .one h5").innerHTML = "رقم الهاتف";
    document.querySelector(".login-container .one input").title =
      "(Alt + N) رقم الهاتف";
    document.querySelector(".login-container .two h5").innerHTML =
      "كلمة المرور";
    document.querySelector(".login-container .two input").title =
      "(Alt + P) كلمة المرور";
    document.querySelector(".btn_submit").value = "تسجيل الدخول";
    document.querySelector(".create-container span").innerHTML = "ليس لدي حساب";
    document.querySelector(".create-container button").innerHTML = "إنشاء حساب";
    document.querySelector(".create-container a span").innerHTML =
      "نسيت كلمة المرور ؟؟؟";
    document.querySelector(".btn_send").title = "(Alt + S) إرسال";
    document.querySelector(".modal .modal-content .modal-header h4").innerHTML =
      "إنشاء حساب";
    document.querySelector(
      ".modal .modal-content .modal-body .one-fne h5"
    ).innerHTML = "الاسم الأول";
    document.querySelector(
      ".modal .modal-content .modal-body .one-fne input"
    ).setAttribute('placeholder','من فضلك أدخل اسمك الأول باللغة الإنكليزية');
    document.querySelector(
      ".modal .modal-content .modal-body .one-fna h5"
    ).innerHTML = "الاسم الأول";
    document.querySelector(
      ".modal .modal-content .modal-body .one-fna input"
    ).setAttribute('placeholder','من فضلك أدخل اسمك الأول باللغة العربية');
    document.querySelector(
      ".modal .modal-content .modal-body .one-lne h5"
    ).innerHTML = "الاسم الآخير";
    document.querySelector(
      ".modal .modal-content .modal-body .one-lne input"
    ).setAttribute('placeholder','من فضلك أدخل اسمك الآخير باللغة الإنكليزية');
    document.querySelector(
      ".modal .modal-content .modal-body .one-lna h5"
    ).innerHTML = "الاسم الآخير";
    document.querySelector(
      ".modal .modal-content .modal-body .one-lna input"
    ).setAttribute('placeholder','من فضلك أدخل اسمك الآخير باللغة العربية');
    document.querySelector(".modal .modal-content .modal-body .two h5").innerHTML = "تاريخ الولادة";
    document.querySelector(".modal .modal-content .modal-body .three h5").innerHTML = "صورة للمالك";
    document.querySelector(
      ".modal .modal-content .modal-body .three label"
    ).innerHTML = "اختر صورة" + "<i class='fa-solid fa-image'></i>";
    document.querySelector(
      ".modal .modal-content .modal-body .four h5"
    ).innerHTML = "عنوان المالك";
    document.querySelector(
      ".modal .modal-dialog .modal-body form .google a"
    ).innerHTML = "تحديد الموقع";
    document.querySelector(
      ".modal .modal-content .modal-body .five h5"
    ).innerHTML = "المحافظة";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #one-op"
    ).innerHTML = "اختر المحافظة المناسبة";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #two-op"
    ).innerHTML = "دمشق";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #three-op"
    ).innerHTML = "ريف دمشق";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #four-op"
    ).innerHTML = "حلب";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .five #OwnerCountry #two-op"
    // ).value = "دمشق";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .five #OwnerCountry #three-op"
    // ).value = "ريف دمشق";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .five #OwnerCountry #four-op"
    // ).value = "حلب";
    document.querySelector(
      ".modal .modal-content .modal-body .seven h5"
    ).innerHTML = "رقم الهاتف المحمول";
    document.querySelector(
      ".modal .modal-content .modal-body .nine h5"
    ).innerHTML = "البريد الإلكتروني";
    document.querySelector(
      ".modal .modal-content .modal-body .nine input"
    ).setAttribute('placeholder','من فضلك أدخل بريدك الإلكتروني');
    document.querySelector(
      ".modal .modal-content .modal-body .ten h5"
    ).innerHTML = "كلمة المرور";
    document.querySelector(
      ".modal .modal-content .modal-body .ten input"
    ).setAttribute('placeholder','من فضلك أدخل كلمة المرور');
    document.querySelector(
      ".modal .modal-content .modal-body .tewelve h5"
    ).innerHTML = "تأكيد كلمة المرور";
    document.querySelector(
      ".modal .modal-content .modal-body .tewelve input"
    ).setAttribute('placeholder','من فضلك أدخل تأكيد كلمة المرور');
    document.querySelector(
      ".modal .modal-content .modal-footer .btn_create"
    ).value = "إنشاء";
    document.querySelector(
      ".modal .modal-content .modal-footer button#close"
    ).innerHTML = "خروج";
    document.querySelector(
      ".container .login-container .create-container button"
    ).title = "(Alt + R) إنشاء حساب";
    document.querySelector(".modal .modal-footer .btn_close").title =
      "(Alt + X) إغلاق";
    document.querySelector(".languages #arabic").title =
      "(Shift + A) اختر اللغة العربية";
    document.querySelector(".languages #english").title =
      "(Shift + E) اختر اللغة الانكليزية";
  } else if (getLanguage == "english") {
    document.body.classList.remove("arabic");
    document.querySelector("html").dir = "ltr";
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Owner Login Page";
    document.getElementById("linkArabic").href = "";
    document.querySelector("#explain .modal-header h5").innerHTML = "Illustation";
    document.querySelector("#explain .modal-body #sen1").innerHTML = "If You Have An Account Just Login";
    document.querySelector("#explain .modal-body #sens1").innerHTML = "To Connect Your Restaurants Together";
    document.querySelector("#explain .modal-body #sen2").innerHTML = "And If You Don't Have Account You Should Create Account";
    document.querySelector("#explain .modal-body #sens2").innerHTML = "To Connect Your Restaurants Together";
    document.querySelector("#explain .modal-footer .btn_close").innerHTML = "Close";
    document.querySelector(".login-container h2").innerHTML = "Welcome";
    document.querySelector(".login-container .one h5").innerHTML =
      "Phone Number";
    document.querySelector(".login-container .one input").title =
      "Phone Number (Alt + N)";
    document.querySelector(".login-container .two h5").innerHTML = "Password";
    document.querySelector(".login-container .two input").title =
      "Password (Alt + P)";
    document.querySelector(".btn_submit").value = "Login";
    document.querySelector(".create-container span").innerHTML =
      "I Don't Have Account";
    document.querySelector(".create-container button").innerHTML =
      "Create Account";
    document.querySelector(".create-container a span").innerHTML =
      "forget My Password ???";
    document.querySelector(".btn_send").title = "Send (Alt + S)";
    document.querySelector(".modal .modal-content .modal-header h4").innerHTML =
      "Create Account";
      document.querySelector(
        ".modal .modal-content .modal-body .one-fne h5"
      ).innerHTML = "First Name";
      document.querySelector(
        ".modal .modal-content .modal-body .one-fne input"
      ).setAttribute('placeholder','Please Enter First Name In English');
      document.querySelector(
        ".modal .modal-content .modal-body .one-fna h5"
      ).innerHTML = "First Name";
      document.querySelector(
        ".modal .modal-content .modal-body .one-fna input"
      ).setAttribute('placeholder','Please Enter First Name In Arabic');
      document.querySelector(
        ".modal .modal-content .modal-body .one-lne h5"
      ).innerHTML = "Last Name";
      document.querySelector(
        ".modal .modal-content .modal-body .one-lne input"
      ).setAttribute('placeholder','Please Enter Last Name In English');
      document.querySelector(
        ".modal .modal-content .modal-body .one-lna h5"
      ).innerHTML = "Last Name";
      document.querySelector(
        ".modal .modal-content .modal-body .one-lna input"
      ).setAttribute('placeholder','Please Enter Last Name In Arabic');
    document.querySelector(".modal .modal-content .modal-body .two h5").innerHTML = "BirthDate";
    document.querySelector(".modal .modal-content .modal-body .three h5").innerHTML = "Image For Owner";
    document.querySelector(
      ".modal .modal-content .modal-body .three label"
    ).innerHTML = "Choose a Image" + "<i class='fa-solid fa-image'></i>";
    document.querySelector(
      ".modal .modal-content .modal-body .four h5"
    ).innerHTML = "Owner Address";
    document.querySelector(
      ".modal .modal-dialog .modal-body form .google a"
    ).innerHTML = "Select Address";
    document.querySelector(
      ".modal .modal-content .modal-body .five h5"
    ).innerHTML = "Province";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #one-op"
    ).innerHTML = "Check The Province Suitable";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #two-op"
    ).innerHTML = "Damascus";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #three-op"
    ).innerHTML = "Damascus rural";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #four-op"
    ).innerHTML = "Aleppo";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #two-op"
    ).value = "Damascus";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #three-op"
    ).value = "Damascus rural";
    document.querySelector(
      ".modal .modal-content .modal-body .five #OwnerCountry #four-op"
    ).value = "Aleppo";
    document.querySelector(
      ".modal .modal-content .modal-body .seven h5"
    ).innerHTML = "Phone Number";
    document.querySelector(
      ".modal .modal-content .modal-body .nine h5"
    ).innerHTML = "Email";
    document.querySelector(
      ".modal .modal-content .modal-body .nine input"
    ).setAttribute('placeholder','Please Enter The Email');
    document.querySelector(
      ".modal .modal-content .modal-body .ten h5"
    ).innerHTML = "Password";
    document.querySelector(
      ".modal .modal-content .modal-body .ten input"
    ).setAttribute('placeholder','Please Enter The Password');
    document.querySelector(
      ".modal .modal-content .modal-body .tewelve h5"
    ).innerHTML = "Password Confirm";
    document.querySelector(
      ".modal .modal-content .modal-body .tewelve input"
    ).setAttribute('placeholder','Please Enter The Password Confirm');
    document.querySelector(
      ".modal .modal-content .modal-footer .btn_create"
    ).value = "Create";
    document.querySelector(
      ".modal .modal-content .modal-footer button#close"
    ).innerHTML = "Close";
    document.querySelector(
      ".container .login-container .create-container button"
    ).title = "Create Account (Alt + R)";
    document.querySelector(".modal .modal-footer .btn_close").title =
      "Close (Alt + X)";
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

// Loader End
// ---------------------- //

//Show Password
const showPassword = document.getElementById("showicon");
showPassword.onclick = () => {
  if (password.type == "password") {
    password.type = "text";
    showPassword.classList.replace("fa-eye-slash", "fa-eye");
  } else {
    password.type = "password";
    showPassword.classList.replace("fa-eye", "fa-eye-slash");
  }
};


// Count Character In TextArea
function charactersCount() {
  let element = document.getElementById("OwnerAddress").value.length;
  if (!document.body.classList.contains("arabic"))
    document.getElementById("charactersCount").innerText =
      " 150 / " + element + " (The maximum Limit 150 Characters)";
  else
    document.getElementById("charactersCount").innerText =
      " 150 / " + element + " (الحد الأقصى لعدد المحارف)";
}


// ApI Js Start
const api = "http://192.168.43.116:8040/api/Restaurants";
const apiBackUp = "http://192.168.201.136:8030/api/Restaurants";
function getItems() {
  fetch(api)
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Unable to get items.', error));
}

function SignUp() {
  const item = {
    isComplete: false,
    name: RestaurantName,
    logo: RestaurantLogo,
    address: RestaurantAddress,
    city: city,
    phone: RestaruantPhone,
    type: type,
    total_tables: TablesTotal,
    email: Email_Restaurant,
    password: Password_Email,
    activation: '1,6:00,18:00-2,6:00,18:00-3,6:00,18:00-4,6:00,18:00-5,6:00,18:00',
    Owner_id: '1'
  };
  fetch(api + "/NewRestaurant", {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: JSON.stringify(item)
  })
    .then(response => response.json())
    .then(() => {
      getItems();
    })
    .catch(error => console.error('Unable to add item.', error));
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