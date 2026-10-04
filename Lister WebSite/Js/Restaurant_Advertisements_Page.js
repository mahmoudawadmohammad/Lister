let formAds = document.getElementById('form-container');
let Ads_Start_Date = document.getElementById('Ads_Start_Date');
let Ads_End_Date = document.getElementById('Ads_End_Date');
let AdvertisementImage = document.getElementById('AdvertisementImage');
let AdvertismentContent = document.getElementById('AdvertismentContent');
let Ads_Simplified_Content = document.getElementById('Ads_Simplified_Content');
let selectItems = document.getElementById('selectItems');
let AdvertisementPercentage = document.getElementById('AdvertisementPercentage');

let message_Ads_Start_Date = document.getElementById('message_Ads_Start_Date');
let message_Ads_End_Date = document.getElementById('message_Ads_End_Date');
let message_AdvertisementImage = document.getElementById('message_AdvertisementImage');
let message_AdvertismentContent = document.getElementById('message_AdvertismentContent');
let message_Ads_Simplified_Content = document.getElementById('message_Ads_Simplified_Content');
let message_selectItems = document.getElementById('message_selectItems');
let message_AdvertisementPercentage = document.getElementById('message_AdvertisementPercentage');
let options = document.querySelectorAll("#AdvertismentSubscribe .modal-body  form .five .list label input[type='checkbox']");

document.querySelector('#AdvertismentSubscribe .modal-body  form .five .select-field').addEventListener('click',()=>{
    document.querySelector('#AdvertismentSubscribe .modal-body  form .five .list').classList.toggle('show');
    document.querySelector('#AdvertismentSubscribe .modal-body  form .five .down-arrow').classList.toggle('rotate180');
    });
    function selectAll() {
      for(let i = 0 ;i < options.length;i++) {
        if(options[i].id === "All")
        continue;
      options[i].checked = "true";
      // if(options[i].id === "All" && options[i].checked === "false" )
      //   options[i].checked = "false";
      }
			}

let countMistakeWindow = 0;
formAds.addEventListener("submit", (e) => {
  if (countMistakeWindow >= 0) { e.preventDefault();
  CheckInputsWindow();
  } 
  else alert('Holako');
});

function CheckInputsWindow() {
  if (Ads_Start_Date.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_Ads_Start_Date,
        "لا يمكن أن يكون عنوان الإعلان فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_Ads_Start_Date,
        "The Advertisements Address Can't Be Empty",
        "block"
      );
    setErrorForWindow(Ads_Start_Date);
  } else {
    CheckMessageSuccess(message_Ads_Start_Date, "none");
    setSuccessForWindow(Ads_Start_Date);
  }
  if (Ads_End_Date.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_Ads_End_Date,
        "لا يمكن أن يكون عنوان الإعلان فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_Ads_End_Date,
        "The Advertisements Address Can't Be Empty",
        "block"
      );
    setErrorForWindow(Ads_End_Date);
  } else {
    CheckMessageSuccess(message_Ads_End_Date, "none");
    setSuccessForWindow(Ads_End_Date);
  }
  if (AdvertismentContent.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_AdvertismentContent,
        "لا يمكن أن يكون محتوى الإعلان فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_AdvertismentContent,
        "The Advertisements Content Can't Be Empty",
        "block"
      );
    setErrorForWindow(AdvertismentContent);
  } else {
    CheckMessageSuccess(message_AdvertismentContent, "none");
    setSuccessForWindow(AdvertismentContent);
  }
  if (Ads_Simplified_Content.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_Ads_Simplified_Content,
        "لا يمكن أن يكون الشرح المختصر للإعلان فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_Ads_Simplified_Content,
        "The Advertisements Simplified Content Can't Be Empty",
        "block"
      );
    setErrorForWindow(Ads_Simplified_Content);
  } else {
    CheckMessageSuccess(message_Ads_Simplified_Content, "none");
    setSuccessForWindow(Ads_Simplified_Content);
  }
  if (AdvertisementPercentage.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_AdvertisementPercentage,
        "لا يمكن أن تكون نسبة الخصم فارغة",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_AdvertisementPercentage,
        "The Discount Percentage Can't Be Empty",
        "block"
      );
    setErrorForWindow(AdvertisementPercentage);
  } else {
    CheckMessageSuccess(message_AdvertisementPercentage, "none");
    setSuccessForWindow(AdvertisementPercentage);
  }
  // for(let i = 0 ;i < options.length;i++) {
  //   if(options[i].checked !== "true") {
  //     if (document.querySelector("html").lang === "ar")
  //     CheckMessageError(
  //       message_selectItems,
  //       "يجب أن تقوم باختيار عنصر واحد على الأقل",
  //       "block"
  //     );
  //   else if (document.querySelector("html").lang === "en")
  //     CheckMessageError(
  //       message_selectItems,
  //       "You must choose at least one item",
  //       "block"
  //     );
  //   setErrorForWindow(selectItems);
  //   } else {
  //   CheckMessageSuccess(message_selectItems, "none");
  //   setSuccessForWindow(selectItems);
  //   }
  // }
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



// Change Language Website Start

function CheckLanguage() {
  document.body.classList.toggle("two-language");
  if (document.body.classList.contains("two-language")) {
    setLanguage("arabic");
    localStorage.setItem("Lang", "arabic");
    // document.querySelector(".loader-container").classList.remove("fade-out");
    // location.reload();
  } else {
    setLanguage("english");
    localStorage.setItem("Lang", "english");
    // document.querySelector(".loader-container").classList.remove("fade-out");
    // location.reload();
  }
}



function setLanguage(getLanguage) {
  if (getLanguage === "arabic") {
    document.body.classList.add("arabic");
    document.querySelector("html").lang = "ar";
    document.querySelector("title").innerHTML = "صفحة الإعلانات للمطعم";
    document.querySelector(".sidebar .image-text .image").title = "شعار المطعم";
    document.querySelector(".sidebar .image-text .image img").alt =
      "شعار المطعم";
    document.querySelector(".sidebar .text .name").innerHTML = "الأول & الأفضل";
    document.querySelector(".toggle").title = "( Alt + O ) انطلق";
    document.querySelector(".menu-bar .menu .home-link").title =
      "( Alt + P ) الصفحة الرئيسية";
    document.querySelector(".menu-bar .menu .home-text").innerHTML =
      "الصفحة الرئيسية";
    document.querySelector(".menu-bar .menu .menu-link").title =
      "( Alt + M ) القوائم";
    document.querySelector(".menu-bar .menu .menu-text").innerHTML = "القوائم";
    document.querySelector(".menu-bar .menu .order-link").title =
      "( Alt + O ) الطلبات";
    document.querySelector(".menu-bar .menu .order-text").innerHTML = "الطلبات";
    document.querySelector(".menu-bar .menu .advertisements-link").title =
      "( Ctrl + Alt + A ) الإعلانات";
    document.querySelector(".menu-bar .menu .advertisements-text").innerHTML =
      "الإعلانات";
    document.querySelector(".menu-bar .menu .settings-link").title =
      "( Ctrl + Alt + S ) الإعدادات";
    document.querySelector(".menu-bar .menu .settings-text").innerHTML =
      "الإعدادات";
    document.querySelector(".menu-bar .bottom-navigation .logout-link").title =
      "تسجيل الخروج";
    document.querySelector(
      ".menu-bar .bottom-navigation .logout-text"
    ).innerHTML = "تسجيل خروج";
    document.querySelector(".menu-bar .bottom-navigation .image").title =
      "الصورة الشخصية";
    document.querySelector(".menu-bar .bottom-navigation .image img").alt =
      "الصورة الشخصية";
    document.querySelector(".top-header .image-text .image").title =
      "الصورة الشخصية";
    document.querySelector(".top-header .image-text .image img").alt =
      "الصورة الشخصية";
    document.querySelector(".extension-tool .todo-list").title =
      "( Shift + T ) قائمة المهام";
    document.querySelector(".extension-tool .sticky-note").title =
      "( Shift + N ) ملاحظات";
    document.querySelector(".extension-tool .language").title =
      "( Shift + L ) اللغة";
    document.querySelector(".extension-tool .theme-mode").title =
      "( Shift + M ) اختيار الوضع";
    document.querySelector(".source-welcome .source a").innerHTML =
      "صفحة الإعلانات";
    document.querySelector(".source-welcome .welcome .text").innerHTML =
      "الأول & الأفضل";
    document.querySelector(".container .explain h3").innerHTML =
      "ما الفائدة من الإعلان";
    document.querySelector(".container .explain #explain1").innerHTML =
      "يساعد في نشر منتجات المطعم وحعله منتشر على نطاق أوسع";
    document.querySelector(".container .explain #explain2").innerHTML =
      "يساعد في تحقيق أربح إضافية كبيرة";
    document.querySelector(".container .explain #explain3").innerHTML =
      "يساعد في جعل المطعم كسب شهرة أكثر عند أغلب الناس وعامتهم";
    document.querySelector(".ad-subscribe span").innerHTML =
      "إشتراك";
    document.querySelector(".myAds h2").innerHTML =
      " إعلاناتي الخاصة";
    document.querySelector("#AdvertismentSubscribe .modal-header h4").innerHTML =
      "إشتراك";
    document.querySelector("#AdvertismentSubscribe .modal-body .three h5").innerHTML =
      "بداية الإعلان";
    document.querySelector("#AdvertismentSubscribe .modal-body .four h5").innerHTML =
      "نهاية الإعلان";
    document.querySelector("#AdvertismentSubscribe .modal-body .five h5").innerHTML = "تحديد العناصر";
    // document.querySelector("#AdvertismentSubscribe .modal-body .five .input").setAttribute('placeholder','اختر عناصر');
    document.querySelector("#AdvertismentSubscribe .modal-body .six h5").innerHTML =
      "صورة الإعلان";
    document.querySelector("#AdvertismentSubscribe .modal-body .six #AdvertisementImageLabel").innerHTML =
      "اختر صورة" + "<i class='fa-solid fa-plus'></i>";
      document.querySelector("#AdvertismentSubscribe .modal-body .cntOrder h5").innerHTML = "عدد الطلبات";
    document.querySelector("#AdvertismentSubscribe .modal-body .required-price h5").innerHTML = "السعر المطلوب";
    document.querySelector("#AdvertismentSubscribe .modal-body .discount-percentage h5").innerHTML = "نسبة الخصم";
    document.querySelector("#AdvertismentSubscribe .modal-body .seven h5").innerHTML = "محتوى الإعلان";
    document.querySelector("#AdvertismentSubscribe .modal-body .seven #AdvertismentContent").setAttribute('placeholder','من فضلك أدخل محتوى الإعلان');
    document.querySelector(
      "#AdvertismentSubscribe .modal-body .seven #charactersCountAd"
    ).innerHTML = "350 / 0 (الحد الأقصى لعدد المحارف)";    
    document.querySelector("#AdvertismentSubscribe .modal-body .eight h5").innerHTML = "محتوى مختصر";
    document.querySelector("#AdvertismentSubscribe .modal-body .eight #Ads_Simplified_Content").setAttribute('placeholder','من فضلك أدخل محتوى مختصر');
    document.querySelector(
      "#AdvertismentSubscribe .modal-body .eight #charactersCountNote"
    ).innerHTML = "150 / 0 (الحد الأقصى لعدد المحارف)"; 
    document.querySelector('.modal-footer .modal_create .btn_create').value = 'إرسال'    
    document.querySelector('.modal-footer #btnClose').innerHTML = 'خروج';  
      document.querySelector("#logout .modal-header h5").innerHTML =
      "تسجيل خروج";
    document.querySelector("#logout .modal-body span").innerHTML =
      "هل أنت متأكد أنك تريد الخروج من الموقع";
    document.querySelector("#logout .modal-footer .btn_close").innerHTML =
      "إغلاق";
    document.querySelector("#logout .modal-footer .logout").innerHTML =
      "تسجيل خروج";
    // --------------------------------
  } else if (getLanguage === "english") {
    document.body.classList.remove("arabic");
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Restaurant Advertisements Page";
    document.querySelector(".sidebar .image-text .image").title =
      "Resturant Logo";
    document.querySelector(".sidebar .image-text .image img").alt =
      "Resturant Logo";
    document.querySelector(".sidebar .text .name").innerHTML = "Costaic";
    document.querySelector(".toggle").title = "Let's Go ( Alt + O )";
    document.querySelector(".menu-bar .menu .home-link").title =
      "Main Page ( Alt + P )";
    document.querySelector(".menu-bar .menu .home-text").innerHTML =
      "Main Page";
    document.querySelector(".menu-bar .menu .menu-link").title =
      "Menus ( Alt + M )";
    document.querySelector(".menu-bar .menu .menu-text").innerHTML = "Menus";
    document.querySelector(".menu-bar .menu .order-link").title =
      "Orders ( Alt + O )";
    document.querySelector(".menu-bar .menu .order-text").innerHTML = "Orders";
    document.querySelector(".menu-bar .menu .advertisements-link").title =
      "Advertisements ( Ctrl + Alt + A )";
    document.querySelector(".menu-bar .menu .advertisements-text").innerHTML =
      "Advertisements";
    document.querySelector(".menu-bar .menu .settings-link").title =
      "Settings ( Ctrl + Alt + S )";
    document.querySelector(".menu-bar .menu .settings-text").innerHTML =
      "Settings";
    document.querySelector(".menu-bar .bottom-navigation .logout-link").title =
      "Logout";
    document.querySelector(
      ".menu-bar .bottom-navigation .logout-text"
    ).innerHTML = "Logout";
    document.querySelector(".menu-bar .bottom-navigation .image").title =
      "Personal Image";
    document.querySelector(".menu-bar .bottom-navigation .image img").alt =
      "Personal Image";
    document.querySelector(".top-header .image-text .image").title =
      "Personal Image";
    document.querySelector(".top-header .image-text .image img").alt =
      "Personal Image";
    document.querySelector(".extension-tool .todo-list").title =
      "To Do List ( Shift + T )";
    document.querySelector(".extension-tool .sticky-note").title =
      "Sticky Note ( Shift + N )";
    document.querySelector(".extension-tool .language").title =
      "Language ( Shift + L )";
    document.querySelector(".extension-tool .theme-mode").title =
      "Theme Mode ( Shift + M )";
    document.querySelector(".source-welcome .source a").innerHTML = "Advertisements Page";
    document.querySelector(".source-welcome .welcome .text").innerHTML =
      "First & Best";
      document.querySelector(".container .explain h3").innerHTML =
      "What Is The Interest Of Advertising";
    document.querySelector(".container .explain #explain1").innerHTML =
      "Publish The Product And Varieties Of The Restaurant To The Largest Scale";
    document.querySelector(".container .explain #explain2").innerHTML =
      "Achieve Additional Huge Profits";
    document.querySelector(".container .explain #explain3").innerHTML =
      "Make The Restaurant More Famous When People General";
    document.querySelector(".ad-subscribe span").innerHTML =
      "Subscribe";
    document.querySelector(".myAds h2").innerHTML =
      "My Advertisements";
      document.querySelector("#AdvertismentSubscribe .modal-header h4").innerHTML =
      "Subscribe";
    document.querySelector("#AdvertismentSubscribe .modal-body .three h5").innerHTML =
      "Advertisement Start Date";
    document.querySelector("#AdvertismentSubscribe .modal-body .four h5").innerHTML =
      "Advertisement End Date";
    document.querySelector("#AdvertismentSubscribe .modal-body .five h5").innerHTML = "Select Items";
    // document.querySelector("#AdvertismentSubscribe .modal-body .five .input").setAttribute('placeholder','Choose Items');
    document.querySelector("#AdvertismentSubscribe .modal-body .six h5").innerHTML =
      "Advertisement Image";
    document.querySelector("#AdvertismentSubscribe .modal-body .six #AdvertisementImageLabel").innerHTML =
      "Choose a Image" + "<i class='fa-solid fa-plus'></i>";
      document.querySelector("#AdvertismentSubscribe .modal-body .cntOrder h5").innerHTML = "Orders Count";
      document.querySelector("#AdvertismentSubscribe .modal-body .required-price h5").innerHTML = "Required Price";
      document.querySelector("#AdvertismentSubscribe .modal-body .discount-percentage h5").innerHTML = "Discount Percentage";
    document.querySelector("#AdvertismentSubscribe .modal-body .seven h5").innerHTML = "Advertisement Content";
    document.querySelector("#AdvertismentSubscribe .modal-body .seven #AdvertismentContent").setAttribute('placeholder','Please Enter The Advertisment Content');
    document.querySelector(
      "#AdvertismentSubscribe .modal-body .seven #charactersCountAd"
    ).innerHTML = "350 / 0 (الحد الأقصى لعدد المحارف)";    
    document.querySelector("#AdvertismentSubscribe .modal-body .eight h5").innerHTML = "Simpliefied Content";
    document.querySelector("#AdvertismentSubscribe .modal-body .eight #Ads_Simplified_Content").setAttribute('placeholder','Please Enter The Simpliefied Content');
    document.querySelector(
      "#AdvertismentSubscribe .modal-body .eight #charactersCountNote"
    ).innerHTML = "150 / 0 (الحد الأقصى لعدد المحارف)"; 
    document.querySelector('.modal-footer .modal_create .btn_create').value = 'Send'    
    document.querySelector('.modal-footer #btnClose').innerHTML = 'Close';

    document.querySelector("#logout .modal-header h5").innerHTML =
      "Log Out";
    document.querySelector("#logout .modal-body span").innerHTML =
      "Are you sure you want to log out of the website";
    document.querySelector("#logout .modal-footer .btn_close").innerHTML =
      "Close";
    document.querySelector("#logout .modal-footer .logout").innerHTML =
      "log out";
  }
}

// Change Language Website End
// ---------------------- //


// Loader Start

// onload = () => vanish();
// let vanish = () =>
//   document.querySelector(".loader-container").classList.add("fade-out");

// Loader End
