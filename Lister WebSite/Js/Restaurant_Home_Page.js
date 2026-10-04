// Animation Counter Number Start
const counters = document.querySelectorAll(".card .description");
const speed = 100;
counters.forEach((counter) => {
  const updateCount = () => {
    const targets = +counter.getAttribute("data-target");
    const count = +counter.innerText;
    const inc = targets / speed;
    if (count < targets) {
      counter.innerText = Math.ceil(count + inc);
      setTimeout(updateCount, 1);
    } else count.innerText = targets;
  };
  updateCount();
});

// Animation Counter Number End
// ---------------------- //

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
    document.querySelector("html").lang = "ar";
    document.querySelector("title").innerHTML = "الصفحة الرئيسية للمطعم";
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
      "الصفحة الرئيسية";
    document.querySelector(".source-welcome .welcome .text").innerHTML =
      "الأول & الأفضل";
    document.querySelector(".card-calc .card .cnt-del").innerHTML =
      "عدد طلبات التوصيل";
    document.querySelector(".card-calc .card .ta-del").innerHTML =
      "المبلغ الكامل";
    document.querySelector(".card-calc .card .cnt-resv").innerHTML =
      "عدد طلبات الحجز";
    document.querySelector(".card-calc .card .ta-resv").innerHTML =
      "المبلغ الكامل";
    document.querySelector(".orders .table_responsive h1").innerHTML =
      "الطلبات";
    document.querySelector(".orders .table_responsive #oid").innerHTML =
      "رقم التعريف";
    document.querySelector(".orders .table_responsive #or").innerHTML =
      "الطلب";
    document.querySelector(".orders .table_responsive #oc").innerHTML =
      "اسم الزبون";
    document.querySelector(".orders .table_responsive #od").innerHTML =
      "وقت الطلب";
    document.querySelector(".orders .table_responsive #oe").innerHTML =
      "الوقت المستغرق";
    document.querySelector(".orders .table_responsive #os").innerHTML =
      "الملاحظات";
    document.querySelector(".orders .table_responsive #oa").innerHTML =
      "الحدث";
    document.querySelector(".Reservations .table_responsive h1").innerHTML =
      "الحجوزات";
    document.querySelector(".Reservations .table_responsive #ri").innerHTML =
      "رقم التعريف";
    document.querySelector(".Reservations .table_responsive #rr").innerHTML =
      "الحجز";
    document.querySelector(".Reservations .table_responsive #rc").innerHTML =
      "اسم الزبون";
    document.querySelector(".Reservations .table_responsive #rd").innerHTML =
      "وقت البداية";
    document.querySelector(".Reservations .table_responsive #re").innerHTML =
      "وقت النهاية";
    document.querySelector(".Reservations .table_responsive #rp").innerHTML =
      "عدد الأشخاص";
    document.querySelector(".Reservations .table_responsive #rt").innerHTML =
      "عدد الطاولات";
    document.querySelector(".Reservations .table_responsive #rs").innerHTML =
      "الملاحظات";
    document.querySelector(".Reservations .table_responsive #ra").innerHTML =
      "الحدث";
    document.querySelector(".menus .table_responsive h1").innerHTML =
      "القوائم";
    document.querySelector(".menus .table_responsive #mn").innerHTML =
      "الإسم";
    document.querySelector(".menus .table_responsive #mi").innerHTML =
      "الصورة";
    document.querySelector(".menus .table_responsive #mp").innerHTML =
      "السعر";
    document.querySelector(".menus .table_responsive #mt").innerHTML =
      "النوع";
    document.querySelector(".menus .table_responsive #md").innerHTML =
      "الوصف";
      document.querySelector(".topTen .table_responsive h1").innerHTML =
      "أفضل عشرة";
    document.querySelector(".topTen .table_responsive #ti").innerHTML =
      "الرقم";
    document.querySelector(".topTen .table_responsive #tn").innerHTML =
      "الاسم";
    document.querySelector(".topTen .table_responsive #tp").innerHTML =
      "الصورة";
    document.querySelector(".topTen .table_responsive #tr").innerHTML =
      "التقييم";
    document.querySelector(".topTen .table_responsive #ts").innerHTML =
      "المبيعات";
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
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Restaurant Home Page";
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
    document.querySelector(".source-welcome .source a").innerHTML = "Main Page";
    document.querySelector(".source-welcome .welcome .text").innerHTML =
      "First & Best";
    document.querySelector(".card-calc .card .cnt-del").innerHTML =
      "Count Delivery";
    document.querySelector(".card-calc .card .ta-del").innerHTML =
      "Total Amount";
    document.querySelector(".card-calc .card .cnt-resv").innerHTML =
      "Count Reservations";
    document.querySelector(".card-calc .card .ta-resv").innerHTML =
      "Total Amount";
    document.querySelector(".orders .table_responsive h1").innerHTML =
      "The Orders";
    document.querySelector(".orders .table_responsive #oid").innerHTML =
      "Id";
    document.querySelector(".orders .table_responsive #or").innerHTML =
      "Order";
    document.querySelector(".orders .table_responsive #oc").innerHTML =
      "Customer Name";
    document.querySelector(".orders .table_responsive #od").innerHTML =
      "Date Time";
    document.querySelector(".orders .table_responsive #oe").innerHTML =
      "Expected Time";
    document.querySelector(".orders .table_responsive #os").innerHTML =
      "Comments";
    document.querySelector(".orders .table_responsive #oa").innerHTML =
      "Action";
    document.querySelector(".Reservations .table_responsive h1").innerHTML =
      "The Reservations";
    document.querySelector(".Reservations .table_responsive #ri").innerHTML =
      "Id";
    document.querySelector(".Reservations .table_responsive #rr").innerHTML =
      "Reservation";
    document.querySelector(".Reservations .table_responsive #rc").innerHTML =
      "Customer Name";
    document.querySelector(".Reservations .table_responsive #rd").innerHTML =
      "Date Time";
    document.querySelector(".Reservations .table_responsive #re").innerHTML =
      "Edate Time";
    document.querySelector(".Reservations .table_responsive #rp").innerHTML =
      "Person Numbe";
    document.querySelector(".Reservations .table_responsive #rt").innerHTML =
      "Tables Number";
    document.querySelector(".Reservations .table_responsive #rs").innerHTML =
      "Comments";
    document.querySelector(".Reservations .table_responsive #ra").innerHTML =
      "Action";
    document.querySelector(".menus .table_responsive h1").innerHTML =
      "Menus";
    document.querySelector(".menus .table_responsive #mn").innerHTML =
      "Name";
    document.querySelector(".menus .table_responsive #mi").innerHTML =
      "Image";
    document.querySelector(".menus .table_responsive #mp").innerHTML =
      "Price";
    document.querySelector(".menus .table_responsive #mt").innerHTML =
      "Type";
    document.querySelector(".menus .table_responsive #md").innerHTML =
      "Description";
    document.querySelector(".topTen .table_responsive h1").innerHTML =
      "Top Ten";
    document.querySelector(".topTen .table_responsive #ti").innerHTML =
      "Id";
    document.querySelector(".topTen .table_responsive #tn").innerHTML =
      "Name";
    document.querySelector(".topTen .table_responsive #tp").innerHTML =
      "Image";
    document.querySelector(".topTen .table_responsive #tr").innerHTML =
      "Rating";
    document.querySelector(".topTen .table_responsive #ts").innerHTML =
      "Selling";
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
