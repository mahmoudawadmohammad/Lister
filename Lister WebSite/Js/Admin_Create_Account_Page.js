//   Main InterFace   //
const inputs = document.querySelectorAll(".input");
function focusFunction() {
  let parent = this.parentNode.parentNode;
  parent.classList.add("focus");
}
function blurFunction() {
  let parent = this.parentNode.parentNode;
  if (this.value == "") {
    parent.classList.remove("focus");
  }
}
inputs.forEach((input) => {
  input.addEventListener("focus", focusFunction);
  input.addEventListener("blur", blurFunction);
});

// Abbrevations Start
document.addEventListener("keydown", (e) => {
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
let form = document.getElementById("form");
let FirstNameEnglish = document.getElementById("FirstNameEnglish");
let FirstNameArabic = document.getElementById("FirstNameArabic");
let lastNameEnglish = document.getElementById("lastNameEnglish");
let LastNameArabic = document.getElementById("LastNameArabic");
let BirthDate = document.getElementById("BirthDate");
let PhoneNumber = document.getElementById("PhoneNumber");
let HireDate = document.getElementById("HireDate");
let EndDate = document.getElementById("EndDate");
let Email = document.getElementById("AdminEmail");
let Password = document.getElementById("AdminPassword");
let PasswordConfirm = document.getElementById("AdminPasswordConfirm");
let AdminAddress = document.getElementById("AdminAddress");

let message_FirstNameEnglish = document.getElementById(
  "message-FirstNameEnglish"
);
let message_FirstNameArabic = document.getElementById("message-FirstNameArabic");
let message_lastNameEnglish = document.getElementById(
  "message-lastNameEnglish"
);
let message_LastNameArabic = document.getElementById("message-LastNameArabic");
let message_BirthDate = document.getElementById("message-BirthDate");
let message_PhoneNumber = document.getElementById("message-PhoneNumber");
let message_HireDate = document.getElementById("message-HireDate");
let message_EndDate = document.getElementById("message-EndDate");
let message_AdminEmail = document.getElementById("message-AdminEmail");
let message_AdminPassword = document.getElementById("message-AdminPassword");
let message_AdminPasswordConfirm = document.getElementById(
  "message-AdminPasswordConfirm"
);
let countMistake = 0;
form.addEventListener("submit", (e) => {
  if (countMistake >= 0)
    // {
    e.preventDefault();
  CheckInputs();
  // } else location.href = "../Html/Admin_Home_Page.html"
});

function CheckInputs() {
  if (FirstNameEnglish.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_FirstNameEnglish,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_FirstNameEnglish,
        "The Name Can't Be Empty",
        "block"
      );
    setError(FirstNameEnglish);
  } else {
    CheckMessageSuccess(message_FirstNameEnglish, "none");
    setSuccess(FirstNameEnglish);
  }
  if (FirstNameArabic.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_FirstNameArabic,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_FirstNameArabic,
        "The Name Can't Be Empty",
        "block"
      );
    setError(FirstNameArabic);
  } else {
    CheckMessageSuccess(message_FirstNameArabic, "none");
    setSuccess(FirstNameArabic);
  }
  if (lastNameEnglish.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_lastNameEnglish,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_lastNameEnglish,
        "The Name Can't Be Empty",
        "block"
      );
    setError(lastNameEnglish);
  } else {
    CheckMessageSuccess(message_lastNameEnglish, "none");
    setSuccess(lastNameEnglish);
  }
  if (LastNameArabic.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_lastNameEnglish,
        "لا يمكن أن يكون الاسم فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_lastNameEnglish,
        "The Name Can't Be Empty",
        "block"
      );
    setError(LastNameArabic);
  } else {
    CheckMessageSuccess(message_lastNameEnglish, "none");
    setSuccess(LastNameArabic);
  }

  if (BirthDate.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_BirthDate,
        "لا يمكن أن يكون تاريخ الولادة فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_BirthDate,
        "The BirthDate Can't Be Empty",
        "block"
      );
    setError(BirthDate);
  } else {
    CheckMessageSuccess(message_BirthDate, "none");
    setSuccess(BirthDate);
  }
  if (PhoneNumber.value.trim() === "" || PhoneNumber.value.trim() === "09") {
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
    setError(PhoneNumber);
  } else if (isNaN(PhoneNumber.value)) {
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
    setError(PhoneNumber);
  } else if (
    PhoneNumber.value.charAt(0) !== "0" ||
    PhoneNumber.value.charAt(1) !== "9"
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(message_PhoneNumber, "يحب أن يبدا الرقم ب 09", "block");
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_PhoneNumber,
        "Should Phone Number Begin With 09",
        "block"
      );
    setError(PhoneNumber);
  } else {
    CheckMessageSuccess(message_PhoneNumber, "none");
    setSuccess(PhoneNumber);
  }
  if (HireDate.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_HireDate,
        "لا يمكن أن يكون تاريخ التعيين فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_HireDate,
        "The HireDate Can't Be Empty",
        "block"
      );
    setError(HireDate);
  } else {
    CheckMessageSuccess(message_HireDate, "none");
    setSuccess(HireDate);
  }
  if (Email.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_AdminEmail,
        "لا يمكن أن يكون البريد الإلكتروني فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_AdminEmail,
        "The Email Can't Be Empty",
        "block"
      );
    setError(Email);
  } else if (!isValidEmail(Email.value)) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_AdminEmail,
        "البريد الإلكتروني غير صالح",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(message_AdminEmail, "The Email Is Invalid", "block");
    setError(Email);
  } else {
    CheckMessageSuccess(message_AdminEmail, "none");
    setSuccess(Email);
  }
  if (Password.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_AdminPassword,
        "لا يمكن أن تكون كلمة السر فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_AdminPassword,
        "The Password Can't Be Empty",
        "block"
      );
    setError(Password);
  } else {
    CheckMessageSuccess(message_AdminPassword, "none");
    setSuccess(Password);
  }
  if (PasswordConfirm.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_AdminPasswordConfirm,
        "لا يمكن أن يكون تأكيد كلمة السر فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_AdminPasswordConfirm,
        "The Password Confirm Can't Be Empty",
        "block"
      );
    setError(PasswordConfirm);
  } else if (PasswordConfirm.value.trim() !== Password.value.trim()) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_AdminPasswordConfirm,
        "كلمة السر غير مطابقة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_AdminPasswordConfirm,
        "The Password don't Match",
        "block"
      );
    setError(PasswordConfirm);
  } else {
    CheckMessageSuccess(message_AdminPasswordConfirm, "none");
    setSuccess(PasswordConfirm);
  }
}

FirstNameEnglish.addEventListener("keypress", function (e) {
  if (suppressNonEnglish(e)) return suppressNonEnglish(e);
  return (FirstNameEnglish.value = "");
});
function suppressNonEnglish(EventKey) {
  var key = EventKey.keyCode;
  if (key > 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_FirstNameEnglish,
        "Please Enter Just In English Language",
        "block"
      );
      setError(FirstNameEnglish);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_FirstNameEnglish,
        "من فضلك أدخل فقط باللغة الإنكليزية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_FirstNameEnglish, "none");
    setSuccess(FirstNameEnglish);
    return true;
  }
}

FirstNameArabic.addEventListener("keypress", function (e) {
  if (suppressNonArabic(e)) return suppressNonArabic(e);
  return (FirstNameArabic.value = "");
});
function suppressNonArabic(EventKey) {
  var key = EventKey.keyCode;
  if (key < 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_FirstNameArabic,
        "Please Enter Just In Arabic Language",
        "block"
      );
      setError(fullNameArabic);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_FirstNameArabic,
        "من فضلك أدخل فقط باللغة العربية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_FirstNameArabic, "none");
    setSuccess(FirstNameArabic);
    return true;
  }
}





lastNameEnglish.addEventListener("keypress", function (e) {
  if (suppressNonEnglish(e)) return suppressNonEnglish(e);
  return (lastNameEnglish.value = "");
});
function suppressNonEnglish(EventKey) {
  var key = EventKey.keyCode;
  if (key > 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_lastNameEnglish,
        "Please Enter Just In English Language",
        "block"
      );
      setError(lastNameEnglish);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_lastNameEnglish,
        "من فضلك أدخل فقط باللغة الإنكليزية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_lastNameEnglish, "none");
    setSuccess(lastNameEnglish);
    return true;
  }
}

LastNameArabic.addEventListener("keypress", function (e) {
  if (suppressNonArabic(e)) return suppressNonArabic(e);
  return (LastNameArabic.value = "");
});
function suppressNonArabic(EventKey) {
  var key = EventKey.keyCode;
  if (key < 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_LastNameArabic,
        "Please Enter Just In Arabic Language",
        "block"
      );
      setError(LastNameArabic);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_LastNameArabic,
        "من فضلك أدخل فقط باللغة العربية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_LastNameArabic, "none");
    setSuccess(LastNameArabic);
    return true;
  }
}

function setError(input) {
  countMistake++;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("error");
  formcontrol.classList.remove("success");
}

function setSuccess(input) {
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

// Show Password

const showPassword = document.getElementById("showiconPassword");
const showPasswordConfirm = document.getElementById("showiconPasswordConfirm");
showPassword.onclick = () => {
  if (Password.type == "password") {
    Password.type = "text";
    showPassword.classList.replace("fa-eye-slash", "fa-eye");
  } else {
    Password.type = "password";
    showPassword.classList.replace("fa-eye", "fa-eye-slash");
  }
};

showPasswordConfirm.onclick = () => {
  if (PasswordConfirm.type == "password") {
    PasswordConfirm.type = "text";
    showPasswordConfirm.classList.replace("fa-eye-slash", "fa-eye");
  } else {
    PasswordConfirm.type = "password";
    showPasswordConfirm.classList.replace("fa-eye", "fa-eye-slash");
  }
};

function isValidEmail(email) {
  const re =
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
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
    document.querySelector("title").innerHTML = "صفحة تسجيل الدخول للمالك";
    document.getElementById("linkArabic").href =
      "../css/Restaurant_Login_Arabic_Page.css";
    document.querySelector(".login-container h2").innerHTML = "إنشاء حساب";
    document.querySelector(".login-container .fne h5").innerHTML =
      "الاسم الأول";
    document
      .querySelector(".login-container .fne input")
      .setAttribute("placeholder", " أدخل باللغة الإنكليزية فقط");
    document.querySelector(".login-container .fna h5").innerHTML =
      "الاسم الأول";
    document
      .querySelector(".login-container .fna input")
      .setAttribute("placeholder", " أدخل باللغة العربية فقط");
    document.querySelector(".login-container .lne h5").innerHTML =
      "الاسم الآخير";
    document
      .querySelector(".login-container .lne input")
      .setAttribute("placeholder", " أدخل باللغة الإنكليزية فقط");
    document.querySelector(".login-container .lna h5").innerHTML =
      "الاسم الآخير";
    document
      .querySelector(".login-container .lna input")
      .setAttribute("placeholder", " أدخل باللغة العربية فقط");
    document.querySelector(".login-container .bd h5").innerHTML =
      "تاريخ الولادة";
    document.querySelector(".login-container .ph h5").innerHTML =
      "رقم الهاتف";
    document.querySelector(".login-container .image h5").innerHTML =
      "الصورة";
    document.querySelector(".login-container .image label").innerHTML =
      "اختر صورة";
    document.querySelector(".login-container .hd h5").innerHTML =
      "تاريخ التعيين";
    document.querySelector(".login-container .ed h5").innerHTML =
      "تاريخ الانتهاء";
    document.querySelector(".login-container .email h5").innerHTML =
      "البريد الإلكتروني";
    document.querySelector(".login-container .p h5").innerHTML = "كلمة المرور";
    document.querySelector(".login-container .pc h5").innerHTML =
      "تأكيد كلمة المرور";
    document.querySelector(".login-container h5#Adminaddress").innerHTML =
      "العنوان";
      document.querySelector(".container .login-container form #google").innerHTML =
      "تحديد الموقع";
    document
      .querySelector(".login-container .btn_send .btn_submit").value = "إنشاء";
    document.querySelector(".languages #arabic").title =
      "(Shift + A) اختر اللغة العربية";
    document.querySelector(".languages #english").title =
      "(Shift + E) اختر اللغة الانكليزية";
  } else if (getLanguage == "english") {
    document.body.classList.remove("arabic");
    document.querySelector("html").dir = "ltr";
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Admin Create Account Page";
    document.querySelector(".login-container h2").innerHTML = "Create Account";
    document.querySelector(".login-container .fne h5").innerHTML =
      "First Name";
    document
      .querySelector(".login-container .fne input")
      .setAttribute("placeholder", "Enter English Only");
    document.querySelector(".login-container .fna h5").innerHTML =
      "First Name";
    document
      .querySelector(".login-container .fna input")
      .setAttribute("placeholder", "Enter Arabic Only");
    document.querySelector(".login-container .lne h5").innerHTML =
      "Last Name";
    document
      .querySelector(".login-container .lne input")
      .setAttribute("placeholder", "Enter English Only");
    document.querySelector(".login-container .lna h5").innerHTML =
      "Last Name";
    document
      .querySelector(".login-container .lna input")
      .setAttribute("placeholder", "Enter Arabic Only");
    document.querySelector(".login-container .bd h5").innerHTML =
      "BirthDate";
    document.querySelector(".login-container .ph h5").innerHTML =
      "Phone Number";
    document.querySelector(".login-container .image h5").innerHTML =
      "Image";
    document.querySelector(".login-container .image label").innerHTML =
      "Choose Image";
    document.querySelector(".login-container .hd h5").innerHTML =
      "Hire Date";
    document.querySelector(".login-container .ed h5").innerHTML =
      "End Date";
    document.querySelector(".login-container .email h5").innerHTML =
      "Email";
    document.querySelector(".login-container .p h5").innerHTML = "Password";
    document.querySelector(".login-container .pc h5").innerHTML =
      "Password Confirm";
    document.querySelector(".login-container h5#Adminaddress").innerHTML =
      "Address";
    document.querySelector(".container .login-container form #google").innerHTML =
      "Select Address";
    document
      .querySelector(".login-container .btn_send .btn_submit").value = "Create";
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