// Abbrevations Start
document.addEventListener("keydown", (e) => {
  if (e.key.toLowerCase() === "a" && e.shiftKey)
    document.getElementById("arabic").click();
  if (e.key.toLowerCase() === "e" && e.shiftKey)
    document.getElementById("english").click();
});

// Abbrevations End
// ---------------------- //
const codes = document.querySelectorAll(".code");
codes[0].focus();
codes.forEach((code, idx) => {
  code.addEventListener("keydown", (e) => {
    if (e.key >= 0 && e.key <= 9) {
      codes[idx].value = "";
      codes[idx + 1].setAttribute("placeholder", "");
      codes[idx + 1].style.caretColor = "black";
      setTimeout(() => codes[idx + 1].focus(), 10);
    } else if (e.key === "Backspace") {
      setTimeout(() => codes[idx - 1].focus(), 10);
      codes[idx].setAttribute("placeholder", "0");
    }
  });
});

let btn_verify = document.getElementById("btn_verify");
let code1 = document.getElementById("code1");
let code2 = document.getElementById("code2");
let code3 = document.getElementById("code3");
let code4 = document.getElementById("code4");
let code5 = document.getElementById("code5");
let code6 = document.getElementById("code6");
let codesString = [];
let message_codeString = document.getElementById("message-codeString");
let codeFromApi = "123456";
let countMistake = -1;
codesString.push(code1, code2, code3, code4, code5, code6);
btn_verify.addEventListener("click", (e) => {
  if (countMistake >= 0) {
    e.preventDefault();
    CheckInputs();
  } else {
    document.getElementById("GetInfo").click();
  }
});

function CheckInputs() {
  for (let i = 0; i < codesString.length; i++) {
    if (codesString[i].value === null ) {
      if (document.querySelector("html").lang === "ar")
        CheckMessageError(
          message_codeString,
          "لا يمكن أن يكون الكود فارغ",
          "block"
        );
      else if (document.querySelector("html").lang === "en")
        CheckMessageError(message_codeString, "The Code Can't Be Empty", "block");
      setErrorForWindow(codesString,countMistake);
    } else {
      CheckMessageSuccess(message_codeString, "none");
      setSuccessForWindow(codesString,countMistake);
    }
  }
  for (let i = 0; i < codesString.length; i++) {
    if (codesString[i].value !== codeFromApi[i].value) {
          if (document.querySelector("html").lang === "ar")
            CheckMessageError(
              message_codeString,
              "الكود غير صحيح",
              "block"
            );
          else if (document.querySelector("html").lang === "en")
            CheckMessageError(message_codeString, "The Code Incorrect", "block");
          setErrorForWindow(codesString,countMistake);
        } else {
          CheckMessageSuccess(message_codeString, "none");
          setSuccessForWindow(codesString,countMistake);
        }
  }
}

function setErrorForWindow(input,element) {
  element++;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("error");
  formcontrol.classList.remove("success");
}

function setSuccessForWindow(input,element) {
  element = -1;
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

function RegexPassword(password) {
  const re =
  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
  return re.test(String(password).toLowerCase());
}

let form_ChangePassword = document.getElementById("form-changepassword");
let NewPassword = document.getElementById('NewPassword');
let ConfirmNewPassword = document.getElementById('ConfirmNewPassword');
let message_NewPassword = document.getElementById('message-NewPassword');
let message_ConfirmNewPassword = document.getElementById('message-ConfirmNewPassword');
countMistakeWindow = 0;
form_ChangePassword.addEventListener("click", (e) => {
  if (countMistakeWindow >= 0) {
    e.preventDefault();
    CheckInputsWindow();
  } 
});

function CheckInputsWindow() {
  if (NewPassword.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_NewPassword,
        "لا يمكن أن تكون كلمة السر فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_NewPassword,
        "The Password Can't Be Empty",
        "block"
      );
    setErrorForWindow(NewPassword,countMistakeWindow);
  }
   else if (!RegexPassword(NewPassword.value)) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_NewPassword,
        "يجب أن تحتوي كلمة المرور رمز و رقم و 8 محارف على الأقل",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_NewPassword,
        "Should Password Contain 1 Char & 1 Number & At Least 8 Characters",
        "block"
      );
    setErrorForWindow(NewPassword,countMistakeWindow);
    }
    else {
    CheckMessageSuccess(message_NewPassword, "none");
    setSuccessForWindow(NewPassword,countMistakeWindow);
  }
  if (ConfirmNewPassword.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_ConfirmNewPassword,
        "لا يمكن أن يكون تأكيد كلمة السر فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_ConfirmNewPassword,
        "The Password Confirm Can't Be Empty",
        "block"
      );
    setErrorForWindow(ConfirmPassword_Email,countMistakeWindow);
  } else if (
    ConfirmNewPassword.value.trim() !== NewPassword.value.trim()
  ) {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_ConfirmNewPassword,
        "كلمة السر غير مطابقة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_ConfirmNewPassword,
        "The Password don't Match",
        "block"
      );
    setErrorForWindow(ConfirmNewPassword,countMistakeWindow);
  } else {
    CheckMessageSuccess(message_ConfirmNewPassword, "none");
    setSuccessForWindow(ConfirmNewPassword,countMistakeWindow);
  }
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
    document.querySelector("html").lang = "ar";
    document.querySelector("title").innerHTML = "صفحة رمز التحقق لكلمة المرور";
    document.getElementById("linkArabic").href =
      "../css/Restaurant_Login_Arabic_Page.css";
    document.querySelector(".containers h2").innerHTML = "أدخل الرمز";
    document.querySelector(".containers p").innerHTML =
      " , من فضلك أدخل الرمز الذي إستقبلته <br> وبعدها سيتم الذهاب إلى صفحة تغيير كلمة المرور";
    document.querySelector(".containers .btn").innerHTML = "تحقق";
    document.querySelector(".containers #receive").innerHTML = "لم أتقى الرمز";
    document.querySelector(".containers strong").innerHTML = "إعادة إرسال";
    document.querySelector("#PasswordEdit .modal-header h4").innerHTML = "تغيير كلمة المرور";
    document.querySelector("#PasswordEdit .modal-body .one h5").innerHTML = "كلمة المرور الجديدة";
    document.querySelector("#PasswordEdit .modal-body .one input").setAttribute('placeholder','أدخل كلمة المرور الجديدة');
    document.querySelector("#PasswordEdit .modal-body .two h5").innerHTML = "تأكيد كلمة المرور الجديدة";
    document.querySelector("#PasswordEdit .modal-body .two input").setAttribute('placeholder','أدخل تأكيد كلمة المرور الجديدة');
    document.querySelector("#PasswordEdit .modal-footer .modal_create .btn_create").value = "تغيير";
    document.querySelector("#PasswordEdit .modal-footer .btn_close").innerHTML = "إغلاق";

    document.querySelector(".languages #arabic").title =
      "(Shift + A) اختر اللغة العربية";
    document.querySelector(".languages #english").title =
      "(Shift + E) اختر اللغة الانكليزية";
  } else if (getLanguage == "english") {
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Password Verification Page";
    document.getElementById("linkArabic").href =
      "";
    document.querySelector(".containers h2").innerHTML = "Enter The Code";
    document.querySelector(".containers p").innerHTML =
      "Please Enter your The Code You Received ,<br> and we'll Take you To Page For Change Your Password";
    document.querySelector(".containers .btn").innerHTML = "Verfiy";
    document.querySelector(".containers #receive").innerHTML =
      "I don't receive a code";
    document.querySelector(".containers strong").innerHTML = "RESEND";
    document.querySelector("#PasswordEdit .modal-header h4").innerHTML = "Change Password";
    document.querySelector("#PasswordEdit .modal-body .one h5").innerHTML = "New Password";
    document.querySelector("#PasswordEdit .modal-body .one input").setAttribute('placeholder','Enter The Name Password');
    document.querySelector("#PasswordEdit .modal-body .two h5").innerHTML = "Confirm The New Password";
    document.querySelector("#PasswordEdit .modal-body .two input").setAttribute('placeholder','Enter Confirm The Name Password') = "تأكيد كلمة المرور الجديدة";
    document.querySelector("#PasswordEdit .modal-footer .modal_create .btn_create").value = "Change";
    document.querySelector("#PasswordEdit .modal-footer .btn_close").innerHTML = "Close";
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

const showPassword = document.getElementById("showiconPassword");
const showPasswordConfirm = document.getElementById("showiconPasswordConfirm");
showPassword.onclick = () => {
  if (NewPassword.type == "password") {
    NewPassword.type = "text";
    showPassword.classList.replace("fa-eye-slash", "fa-eye");
  } else {
    NewPassword.type = "password";
    showPassword.classList.replace("fa-eye", "fa-eye-slash");
  }
};

showPasswordConfirm.onclick = () => {
  if (ConfirmNewPassword.type == "password") {
    ConfirmNewPassword.type = "text";
    showPasswordConfirm.classList.replace("fa-eye-slash", "fa-eye");
  } else {
    ConfirmNewPassword.type = "password";
    showPasswordConfirm.classList.replace("fa-eye", "fa-eye-slash");
  }
};
