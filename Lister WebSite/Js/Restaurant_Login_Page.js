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
  if (!phoneStatus || !passwordStatus) {
    e.preventDefault();
    CheckInputs();
  } else location.href = "../Html/Restaurant_Home_Page.html";
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

// function RegexPassword(password) {
//   const re =
//   /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8})$/;
//   return re.test(String(password).toLowerCase());
// }

//    ( Window Popup )   //

//   Form Validation   //
let windowForm = document.getElementById("form-container");
let RestaurantEnglishName = document.getElementById("Restaurant_EnglishName");
let RestaurantArabicName = document.getElementById("RestaurantArabicName");
let RestaurantLogo = document.getElementById("RestaurantLogo");
let RestaurantAddress = document.getElementById("RestaurantAddress");
let RestaruantPhone = document.getElementById("RestaruantPhone");
let TablesTotal = document.getElementById("TablesTotal");
let RestaurantEmail = document.getElementById("RestaurantEmail");
let Password_Email = document.getElementById("Password_Email");
let ConfirmPassword_Email = document.getElementById("ConfirmPassword_Email");
let message_RestaurantEnglish_Name = document.getElementById(
  "message-Restaurant-EnglishName"
);
let message_RestaurantArabic_Name = document.getElementById(
  "message-Restaurant-ArabicName"
);
let message_RestaurantLogo = document.getElementById("message-RestaurantLogo");
let message_RestaurantAddress = document.getElementById(
  "message-RestaurantAddress"
);
let message_RestaruantPhone = document.getElementById(
  "message-RestaruantPhone"
);
let message_TablesTotal = document.getElementById("message-RestaurantTables");
let message_EmailRestaurant = document.getElementById(
  "message-RestaurantEmail"
);
let message_PasswordEmail = document.getElementById("message-PasswordEmail");
let message_ConfirmPasswordEmail = document.getElementById(
  "message-ConfirmPasswordEmail"
);
let countMistakeWindow = 0;
windowForm.addEventListener("submit", (e) => {
  if (countMistakeWindow >= 0) {
    e.preventDefault();
    CheckInputsWindow();
  } else location.href = "../Html/Owner_Home_Page.html";
});

function CheckInputsWindow() {
  if (RestaurantEnglishName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_RestaurantEnglish_Name,
        "لا يمكن أن يكون اسم المطعم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_RestaurantEnglish_Name,
        "The Restaurant Name Can't Be Empty",
        "block"
      );
    setErrorForWindow(RestaurantEnglishName);
  } else {
    CheckMessageSuccess(message_RestaurantEnglish_Name, "none");
    setSuccessForWindow(RestaurantEnglishName);
  }
  if (RestaurantArabicName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_RestaurantArabic_Name,
        "لا يمكن أن يكون اسم المطعم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_RestaurantArabic_Name,
        "The Restaurant Name Can't Be Empty",
        "block"
      );
    setErrorForWindow(RestaurantArabicName);
  } else {
    CheckMessageSuccess(message_RestaurantArabic_Name, "none");
    setSuccessForWindow(RestaurantArabicName);
  }
  if (
    RestaruantPhone.value.trim() === "" ||
    RestaruantPhone.value.trim() === "09"
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_RestaruantPhone,
        "لا يمكن أن يكون رقم الهاتف فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_RestaruantPhone,
        "The Restaurant Phone Number Can't Be Empty",
        "block"
      );
    setErrorForWindow(RestaruantPhone);
  } else if (isNaN(RestaruantPhone.value)) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_RestaruantPhone,
        "لا يمكن إدخال نص فقط أرقام",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_RestaruantPhone,
        "You Can't Input Text Just Number",
        "block"
      );
    setErrorForWindow(RestaruantPhone);
  } else if (
    RestaruantPhone.value.charAt(0) !== "0" ||
    RestaruantPhone.value.charAt(1) !== "9"
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_RestaruantPhone,
        "يحب أن يبدا الرقم ب 09",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_RestaruantPhone,
        "Should Phone Number Begin With 09",
        "block"
      );
    setErrorForWindow(RestaruantPhone);
  } else {
    CheckMessageSuccess(message_RestaruantPhone, "none");
    setSuccessForWindow(RestaruantPhone);
  }
  if (TablesTotal.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_TablesTotal,
        "لا يمكن أن يكون عدد الطاولات فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_TablesTotal,
        "The Number Of Tables Can't Be Empty",
        "block"
      );
    setErrorForWindow(TablesTotal);
  } else {
    CheckMessageSuccess(message_TablesTotal, "none");
    setSuccessForWindow(TablesTotal);
  }
  if (RestaurantEmail.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_EmailRestaurant,
        "لا يمكن أن يكون البريد الإلكتروني فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_EmailRestaurant,
        "The Email Can't Be Empty",
        "block"
      );
    setErrorForWindow(RestaurantEmail);
  } else if (!isValidEmail(RestaurantEmail.value)) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_EmailRestaurant,
        "البريد الإلكتروني غير صالح",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_EmailRestaurant,
        "The Email Is Invalid",
        "block"
      );
    setErrorForWindow(RestaurantEmail);
  } else {
    CheckMessageSuccess(message_EmailRestaurant, "none");
    setSuccessForWindow(RestaurantEmail);
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

RestaurantEnglishName.addEventListener("keypress", function (e) {
  if (suppressNonEnglish(e)) return suppressNonEnglish(e);
  return (RestaurantEnglishName.value = "");
});
function suppressNonEnglish(EventKey) {
  var key = EventKey.keyCode;
  if (key > 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_RestaurantEnglish_Name,
        "Please Enter Just In English Language",
        "block"
      );
      setErrorForWindow(RestaurantEnglishName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_RestaurantEnglish_Name,
        "من فضلك أدخل فقط باللغة الإنكليزية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_RestaurantEnglish_Name, "none");
    setSuccessForWindow(RestaurantEnglishName);
    return true;
  }
}

RestaurantArabicName.addEventListener("keypress", function (e) {
  if (suppressNonArabic(e)) return suppressNonArabic(e);
  return (RestaurantArabicName.value = "");
});
function suppressNonArabic(EventKey) {
  var key = EventKey.keyCode;
  if (key < 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_RestaurantArabic_Name,
        "Please Enter Just In Arabic Language",
        "block"
      );
      setErrorForWindow(RestaurantArabicName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_RestaurantArabic_Name,
        "من فضلك أدخل فقط باللغة العربية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_RestaurantArabic_Name, "none");
    setSuccessForWindow(RestaurantArabicName);
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
};

function setLanguage(getLanguage) {
  if (getLanguage == "arabic") {
    document.body.classList.add("arabic");
    document.querySelector("html").dir = "rtl";
    document.querySelector("html").lang = "ar";
    document.querySelector("title").innerHTML = "صفحة تسجيل الدخول للمطعم";
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
    document.querySelector(".create-container span").innerHTML = "ليس لدي حساب";
    document.querySelector(".create-container button").innerHTML = "إنشاء حساب";
    document.querySelector(".create-container a span").innerHTML =
      "نسيت كلمة المرور ؟؟؟";
    document.querySelector(".btn_send").title = "(Alt + S) إرسال";
    document.querySelector(".modal .modal-content .modal-header h4").innerHTML =
      "إنشاء حساب";
    document.querySelector(
      ".modal .modal-content .modal-body .one h5"
    ).innerHTML = "اسم المطعم";
    document
      .querySelector(".modal .modal-content .modal-body .one input")
      .setAttribute("placeholder", "من فضلك أدخل اسم المطعم باللغة الإنكليزية");
    document.querySelector(
      ".modal .modal-content .modal-body .two h5"
    ).innerHTML = "اسم المطعم";
    document
      .querySelector(".modal .modal-content .modal-body .two input")
      .setAttribute("placeholder", "من فضلك أدخل اسم المطعم باللغة العربية");
    document.querySelector(
      ".modal .modal-content .modal-body .three h5"
    ).innerHTML = "شعار المطعم";
    document.querySelector(
      ".modal .modal-content .modal-body .three label"
    ).innerHTML = "اختر شعار" + "<i class='fa-solid fa-image'></i>";
    document.querySelector(
      ".modal .modal-content .modal-body .four h5"
    ).innerHTML = "عنوان المطعم";
    document.querySelector(
      ".modal .modal-dialog .modal-body form .google a"
    ).innerHTML = "تحديد الموقع";
    document.querySelector(
      ".modal .modal-content .modal-body .five h5"
    ).innerHTML = "المحافظة";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #one-op"
    ).innerHTML = "اختر المحافظة المناسبة";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #two-op"
    ).innerHTML = "دمشق";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #three-op"
    ).innerHTML = "ريف دمشق";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #four-op"
    ).innerHTML = "حلب";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #two-op"
    ).value = "دمشق";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #three-op"
    ).value = "ريف دمشق";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #four-op"
    ).value = "حلب";
    document.querySelector(
      ".modal .modal-content .modal-body .six h5"
    ).innerHTML = "النوع";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #one-ty"
    ).innerHTML = "حجز";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #two-ty"
    ).innerHTML = "طلب";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #three-ty"
    ).innerHTML = "حجز & طلب";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .six #RestaurantType #one-ty"
    // ).value = "حجز";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .six #RestaurantType #two-ty"
    // ).value = "طلب";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .six #RestaurantType #three-ty"
    // ).value = "حجز & طلب";
    document.querySelector(
      ".modal .modal-content .modal-body .seven h5"
    ).innerHTML = "رقم الهاتف المحمول";
    document.querySelector(
      ".modal .modal-content .modal-body .eight h5"
    ).innerHTML = "عدد الطاولات";
    document.querySelector(
      ".modal .modal-content .modal-body .activation h5"
    ).innerHTML = "وقت الإفتتاح & الإغلاق";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .activation #illustrationActivation"
    // ).setAttribute('title','توضيح هام');
    // document.querySelector(
    //   ".modal .modal-content .modal-body .activation #illustrationActivation"
    // ).setAttribute('data-bs-content','في حال لم يتم تحديد الأوقات في يوم ما فإنه يتم إعتبار هذا اليوم عطلة');
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr th#days"
    ).innerHTML = "الأيام";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr th#sd"
    ).innerHTML = "وقت الإفتتاح";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr th#es"
    ).innerHTML = "وقت الإغلاق";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day1"
    ).innerHTML = "السبت";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day2"
    ).innerHTML = "الأحد";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day3"
    ).innerHTML = "الإثنين";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day4"
    ).innerHTML = "الثلاثاء";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day5"
    ).innerHTML = "الأربعاء";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day6"
    ).innerHTML = "الخميس";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day7"
    ).innerHTML = "الجمعة";
    document.querySelector(
      ".modal .modal-content .modal-body .nine h5"
    ).innerHTML = "البريد الإلكتروني";
    document
      .querySelector(".modal .modal-content .modal-body .nine input")
      .setAttribute("placeholder", "من فضلك أدخل البريد الإلكتروني");
    document.querySelector(
      ".modal .modal-content .modal-body .ten h5"
    ).innerHTML = "كلمة المرور";
    document
      .querySelector(".modal .modal-content .modal-body .ten input")
      .setAttribute("placeholder", "من فضلك أدخل كلمة المرور");
    document.querySelector(
      ".modal .modal-content .modal-body .tewelve h5"
    ).innerHTML = "تأكيد كلمة المرور";
    document
      .querySelector(".modal .modal-content .modal-body .tewelve input")
      .setAttribute("placeholder", "من فضلك أدخل تأكيد كلمة المرور");
    document.querySelector(
      ".modal .modal-content .modal-body .therteen h5"
    ).innerHTML = "النسق";
    // document
    //   .querySelector(
    //     ".modal .modal-content .modal-body .therteen button#illustrationLayout"
    //   )
    //   .setAttribute("title", "ما معنى النسق ؟");
    // document
    //   .querySelector(
    //     ".modal .modal-content .modal-body .therteen button#illustrationLayout"
    //   )
    //   .setAttribute(
    //     "data-bs-content",
    //     "نسق المطعم هو رسم تخطيطي لمساحة مطعمك يتضمن مناطق تناول الطعام والمطبخ والحمامات وما إلى غير ذلك. إنه يوضح كيف سيبدو مطعمك ويعمل. يعد إنشاء مخطط خطوة حاسسمة لبدء العمل الحقيقي في المطعم"
    //   );
    document.querySelector(
      ".modal .modal-content .modal-body .therteen label"
    ).innerHTML = "رفع النسق" + "<i class='fa-solid fa-upload'></i>";
    document.querySelector(
      ".modal .modal-content .modal-footer .btn_create"
    ).value = "إنشاء";
    document.querySelector(
      ".modal .modal-content .modal-footer .btn_close"
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
    document.querySelector("title").innerHTML = "Restaurant Login Page";
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
      ".modal .modal-content .modal-body .one h5"
    ).innerHTML = "Restaurant Name";
    document
      .querySelector(".modal .modal-content .modal-body .one input")
      .setAttribute("placeholder", "Please Enter Restaurant Name English");
    document.querySelector(
      ".modal .modal-content .modal-body .two h5"
    ).innerHTML = "Restaurant Name";
    document
      .querySelector(".modal .modal-content .modal-body .two input")
      .setAttribute("placeholder", "Please Enter Restaurant Name Arabic");
    document.querySelector(
      ".modal .modal-content .modal-body .three h5"
    ).innerHTML = "Restaurant Logo";
    document.querySelector(
      ".modal .modal-content .modal-body .three label"
    ).innerHTML = "Restaurant Logo" + "<i class='fa-solid fa-image'></i>";
    document.querySelector(
      ".modal .modal-content .modal-body .four h5"
    ).innerHTML = "Restaurant Address";
    document.querySelector(
      ".modal .modal-dialog .modal-body form .google a"
    ).innerHTML = "Select Address";
    document.querySelector(
      ".modal .modal-content .modal-body .five h5"
    ).innerHTML = "Province";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #one-op"
    ).innerHTML = "Check The Province Suitable";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #two-op"
    ).innerHTML = "Damascus";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #three-op"
    ).innerHTML = "Damascus rural";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #four-op"
    ).innerHTML = "Aleppo";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #two-op"
    ).value = "Damascus";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #three-op"
    ).value = "Damascus rural";
    document.querySelector(
      ".modal .modal-content .modal-body .five #RestaurantCountry #four-op"
    ).value = "Aleppo";
    document.querySelector(
      ".modal .modal-content .modal-body .six h5"
    ).innerHTML = "Type";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #one-ty"
    ).innerHTML = "Reservation";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #two-ty"
    ).innerHTML = "Order";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #three-ty"
    ).innerHTML = "Reservation & Order";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #one-ty"
    ).value = "R";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #two-ty"
    ).value = "O";
    document.querySelector(
      ".modal .modal-content .modal-body .six #RestaurantType #three-ty"
    ).value = "R & O";
    document.querySelector(
      ".modal .modal-content .modal-body .seven h5"
    ).innerHTML = "Phone Number";
    document.querySelector(
      ".modal .modal-content .modal-body .eight h5"
    ).innerHTML = "Number Of Tables";
    document.querySelector(
      ".modal .modal-content .modal-body .activation h5"
    ).innerHTML = "Opening & Closing Time";
    // document.querySelector(
    //   ".modal .modal-content .modal-body .activation #illustrationActivation"
    // ).setAttribute('title','Important Illustration');
    // document.querySelector(
    //   ".modal .modal-content .modal-body .activation #illustrationActivation"
    // ).setAttribute('data-bs-content','If the times are not specified on a day , that day is considered a holiday');
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr th#days"
    ).innerHTML = "Days";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr th#sd"
    ).innerHTML = "Start Date";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr th#es"
    ).innerHTML = "End Date";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day1"
    ).innerHTML = "Saturday";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day2"
    ).innerHTML = "Sunday";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day3"
    ).innerHTML = "Mondy";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day4"
    ).innerHTML = "Tuesday";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day5"
    ).innerHTML = "Wensday";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day6"
    ).innerHTML = "Thursday";
    document.querySelector(
      ".modal .modal-content .modal-body .activation table tr td#day7"
    ).innerHTML = "Friday";
    document.querySelector(
      ".modal .modal-content .modal-body .nine h5"
    ).innerHTML = "Email";
    document
      .querySelector(".modal .modal-content .modal-body .nine input")
      .setAttribute("placeholder", "Please Enter The Email");
    document.querySelector(
      ".modal .modal-content .modal-body .ten h5"
    ).innerHTML = "Password";
    document
      .querySelector(".modal .modal-content .modal-body .ten input")
      .setAttribute("placeholder", "Please Enter The Password");
    document.querySelector(
      ".modal .modal-content .modal-body .tewelve h5"
    ).innerHTML = "Password Confirm";
    document
      .querySelector(".modal .modal-content .modal-body .tewelve input")
      .setAttribute("placeholder", "Please Enter The Password Confirm");
    document.querySelector(
      ".modal .modal-content .modal-body .therteen h5"
    ).innerHTML = "Layout";
    // document
    //   .querySelector(
    //     ".modal .modal-content .modal-body .therteen h5 #illustrationLayout"
    //   )
    //   .setAttribute("title", "What Does The Layout Mean ?");
    // document
    //   .querySelector(
    //     ".modal .modal-content .modal-body .therteen h5 #illustrationLayout"
    //   )
    //   .setAttribute(
    //     "data-bs-content",
    //     "A restaurant layout is a conceptual sketch of your restaurant space that includes the dining areas, kitchen, storage, bathrooms, and so on. It shows how your restaurant will look and function. Creating a layout is a crucial step to getting started with a restaurant"
    //   );
    document.querySelector(
      ".modal .modal-content .modal-body .therteen label"
    ).innerHTML = "Upload a Layout" + "<i class='fa-solid fa-upload'></i>";
    document.querySelector(
      ".modal .modal-content .modal-footer .btn_create"
    ).value = "Create";
    document.querySelector(
      ".modal .modal-content .modal-footer .btn_close"
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

// Show Password
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

// ApI Js Start
const api = "http://192.168.43.116:8040/api/Restaurants";
const apiBackUp = "http://192.168.201.136:8030/api/Restaurants";
function getItems() {
  fetch(api)
    .then((response) => response.json())
    .then((data) => console.log(data))
    .catch((error) => console.error("Unable to get items.", error));
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
    activation:
      "1,6:00,18:00-2,6:00,18:00-3,6:00,18:00-4,6:00,18:00-5,6:00,18:00",
    Owner_id: "1",
  };
  fetch(api + "/NewRestaurant", {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify(item),
  })
    .then((response) => response.json())
    .then(() => {
      getItems();
    })
    .catch((error) => console.error("Unable to add item.", error));
}

function SignIn() {
  const item = {
    isComplete: false,
    email: document.getElementById("email").value,
    Password: document.getElementById("password").value,
  };
  fetch(api, {
    method: "POST",
    mode: "cors",
    cache: "no-cache",
    credentials: "same-origin",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify(item),
  })
    .then((response) => response.json())
    .then((data) => {
      if (data["length"] > 0) {
        (RId = data["Restaurant_id"]),
          (Rname = data["name"]),
          (Rlogo = data["logo"]),
          (Raddress = data["address"]),
          (Rcity = data["city"]),
          (Rphone = data["phone"]),
          (Rtype = data["type"]),
          (RtotalTables = data["total_tables"]),
          (Remail = data["email"]),
          (Rpassword = data["password"]),
          (Ractivation = data["activation"]),
          (RownerId = data["Owner_id"]);
        newLocation();
      } else {
        message_password.innerText = "Password or Email incorrect";
        message_password.style.display = "block";
        setErrorFor(password);
      }
    })
    .catch((error) => console.error("Unable to add item.", error));
}

function newLocation() {
  window.location.href = "../Html/Restaurant_Home_Page.html";
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
