
//import Items from "../Modules/Items.js";

let ProductName = document.getElementById("ProductName");
let ProductPrice = document.getElementById("ProducetPrice");
let ProductType = document.getElementById("ProductType");
let ProductDescription = document.getElementById("ProductDescription");

let message_ProductName = document.getElementById("message_ProductName");
let message_ProductPrice = document.getElementById("message_ProductPrice");
let message_ProductDescription = document.getElementById(
  "message_ProductDescription"
);
let AddButton = document.getElementById("btn_add");
let EditButton = document.getElementById("EditButton");
let DeleteBtn = document.getElementById("DeleteBtn");

let array_Items =[];
//
//let item1 =new Items (1,"vvvv","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
//let item2 =new Items (2,"eee","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
//let item3 =new Items (3,"gggg","give the mony",3000,"../Images/1.gif","3:00",'a' ,1,1);
// array_Items.push(item1);
// array_Items.push(item2);
// array_Items.push(item3);
//onload
function fun_get  () {
  
  alert("0");
  console.log("1");
};
let EditProductName = document.getElementById("EditProductName");
let EditProductPrice = document.getElementById("EditProductPrice");
let EditProductDescription = document.getElementById("EditProductDescription");
let message_EditProductName = document.getElementById(
  "message_EditProductName"
);
let message_EditProductPrice = document.getElementById(
  "message_EditProductPrice"
);
let message_EditProductDescription = document.getElementById(
  "message_EditProductDescription"
);
let countMistakeCreate = 0;
let countMistake = 0;
AddButton.addEventListener("click", (e) => {
  if (countMistakeCreate >= 0) {
    e.preventDefault();
    CheckInputsCreate();
  } else addProduct();
});


function addProduct_from_arry() {
  for (let index = 0; index < array_Items.length; index++) {
        
          let card = document.createElement("div");
        card.classList.add("card");
        let productImage = document.createElement("img");
        productImage.classList.add("card-img-top");
        productImage.classList.add("product-image");
        productImage.src = `${uploadImage}`;
        let inputFile = document.createElement("input");
        inputFile.type = "file";
        inputFile.setAttribute("id", "ProductImage");
        inputFile.addEventListener("change", function () {
          const reader = new FileReader();
          reader.addEventListener("load", () => {
            uploadImage = reader.result;
            document.querySelector("card-img-top").src = `${uploadImage}`;
          });
          reader.readAsDataURL(this.files[0]);
        });
        card.appendChild(inputFile);
        card.appendChild(productImage);
        let cardBody = document.createElement("div");
        cardBody.classList.add("card-body");
        card.appendChild(cardBody);
        let productName = document.createElement("h3");
        productName.classList.add("card-title");
        productName.classList.add("product-name");
        console.log(array_Items[index].getName())
        productName.textContent = array_Items[index].getName();
        cardBody.appendChild(productName);
        let productPrice = document.createElement("p");
        productPrice.classList.add("card-text");
        productPrice.classList.add("product-price");
        productPrice.textContent = ProductPrice.value + " s.p";
        cardBody.appendChild(productPrice);
        let productType = document.createElement("h5");
        productType.classList.add("btn-light");
        productType.classList.add("product-type");
        productType.textContent = ProductType.value;
        cardBody.appendChild(productType);
        let productDescription = document.createElement("p");
        productDescription.classList.add("product-description");
        productDescription.textContent = ProductDescription.value;
        cardBody.appendChild(productDescription);
        let EditProduct = document.createElement("span");
        EditProduct.classList.add("fa-solid");
        EditProduct.classList.add("fa-pen");
        EditProduct.classList.add("product-edit");
        EditProduct.setAttribute("data-bs-toggle", "modal");
        EditProduct.setAttribute("data-bs-target", "#editProduct");
        let DeleteProduct = document.createElement("span");
        DeleteProduct.classList.add("fa-solid");
        DeleteProduct.classList.add("fa-trash-can");
        DeleteProduct.classList.add("product-delete");
        DeleteProduct.setAttribute("data-bs-toggle", "modal");
        DeleteProduct.setAttribute("data-bs-target", "#deleteProduct");
        let disableButton = document.createElement("button");
        disableButton.innerHTML = "Disable";
        disableButton.classList.add("disable-button");
        disableButton.classList.add("btn");
        disableButton.classList.add("btn-lg");
        disableButton.classList.add("btn-danger");
        cardBody.appendChild(disableButton);
        cardBody.appendChild(DeleteProduct);
        EditProduct.addEventListener("click", (e) => {
          if (countMistake >= 0) {
            e.preventDefault();
            CheckInputs();
          } else
            editProduct(productName, productPrice, productType, productDescription);
        });
        DeleteBtn.addEventListener("click", (e) => {
          deleteProduct(card);
        });
        cardBody.appendChild(EditProduct);
        card.appendChild(cardBody);
        document.querySelector(".cards").appendChild(card);
        ProductName.value = "";
        ProductPrice.value = "";
        ProductDescription.value = "";
        document
          .querySelector(
            "#createProduct .modal-dialog .modal-content .modal-footer .btn_close"
          )
          .click();
      }

      function editProduct(name, price, type, description) {
        document.getElementById("EditProductName").value = name.textContent;
        document.getElementById("EditProductPrice").value = price.textContent.slice(
          0,
          -4
        );
        document.getElementById("EditProductType").value = type.textContent;
        document.getElementById("EditProductDescription").value =
          description.textContent;
        EditButton.addEventListener("click", () => {
          name.textContent = document.getElementById("EditProductName").value;
          price.textContent =
            document.getElementById("EditProductPrice").value + " s.p";
          type.textContent = document.getElementById("EditProductType").value;
          description.textContent = document.getElementById(
            "EditProductDescription"
          ).value;
  });}
}



function CheckInputsCreate() {
  if (ProductName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_ProductName,
        "لا يمكن أن يكون اسم العنصر فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_ProductName,
        "The Product Name Can't Be Empty",
        "block"
      );
    setErrorForWindow(ProductName);
  } else {
    CheckMessageSuccess(message_ProductName, "none");
    setSuccessForWindow(ProductName);
  }
  if (ProductPrice.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_ProductPrice,
        "لا يمكن أن يكون سعر العنصر فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_ProductPrice,
        "The Product Price Can't Be Empty",
        "block"
      );
    setErrorForWindow(ProductPrice);
  } else {
    CheckMessageSuccess(message_ProductPrice, "none");
    setSuccessForWindow(ProductPrice);
  }
  if (ProductDescription.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_ProductDescription,
        "لا يمكن أن يكون وصف العنصر فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_ProductDescription,
        "The Product Description Can't Be Empty",
        "block"
      );
    setErrorForWindow(ProductDescription);
  } else {
    CheckMessageSuccess(message_ProductDescription, "none");
    setSuccessForWindow(ProductDescription);
  }
}

function CheckInputs() {
  if (EditProductName.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_EditProductName,
        "لا يمكن أن يكون اسم العنصر فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_EditProductName,
        "The Product Name Can't Be Empty",
        "block"
      );
    setErrorFor(EditProductName);
  } else {
    CheckMessageSuccess(message_EditProductName, "none");
    setSuccessFor(EditProductName);
  }
  if (EditProductPrice.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_EditProductPrice,
        "لا يمكن أن يكون سعر العنصر فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_EditProductPrice,
        "The Product Price Can't Be Empty",
        "block"
      );
    setErrorFor(EditProductPrice);
  } else {
    CheckMessageSuccess(message_EditProductPrice, "none");
    setSuccessFor(EditProductPrice);
  }
  if (EditProductDescription.value.trim() === "") {
    if (document.querySelector("html").lang === "ar")
      CheckMessageError(
        message_EditProductDescription,
        "لا يمكن أن يكون وصف العنصر فارغ",
        "block"
      );
    else if (document.querySelector("html").lang === "en")
      CheckMessageError(
        message_EditProductDescription,
        "The Product Description Can't Be Empty",
        "block"
      );
    setErrorFor(EditProductDescription);
  } else {
    CheckMessageSuccess(message_EditProductDescription, "none");
    setSuccessFor(EditProductDescription);
  }
}

ProductName.addEventListener("keypress", function (e) {
  if (suppressNonArabic(e)) return suppressNonArabic(e);
  return (ProductName.value = "");
});
function suppressNonArabic(EventKey) {
  var key = EventKey.keyCode;
  if (key > 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_ProductName,
        "Please Enter Just In English Language",
        "block"
      );
      setErrorForWindow(ProductName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_ProductName,
        "من فضلك أدخل فقط باللغة الإنكليزية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_ProductName, "none");
    setSuccessForWindow(ProductName);
    return true;
  }
}

EditProductName.addEventListener("keypress", function (e) {
  if (suppressNonArabic(e)) return suppressNonArabic(e);
  return (EditProductName.value = "");
});
function suppressNonArabic(EventKey) {
  var key = EventKey.keyCode;
  if (key > 128) {
    if (document.querySelector("html").lang === "en") {
      CheckMessageError(
        message_EditProductName,
        "Please Enter Just In English Language",
        "block"
      );
      setErrorFor(EditProductName);
    } else if (document.querySelector("html").lang === "ar") {
      CheckMessageError(
        message_EditProductName,
        "من فضلك أدخل فقط باللغة الإنكليزية",
        "block"
      );
    }
    return false;
  } else {
    CheckMessageSuccess(message_EditProductName, "none");
    setSuccessFor(EditProductName);
    return true;
  }
}

function setErrorForWindow(input) {
  countMistakeCreate++;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("error");
  formcontrol.classList.remove("success");
}

function setErrorFor(input) {
  countMistake++;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("error");
  formcontrol.classList.remove("success");
}

function setSuccessForWindow(input) {
  countMistakeCreate = -1;
  let formcontrol = input.parentElement.parentElement;
  formcontrol.classList.add("success");
  formcontrol.classList.remove("error");
}

function setSuccessFor(input) {
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
let uploadImage = "../Images/Grey_full.png";
function addProduct() {
  let card = document.createElement("div");
  card.classList.add("card");
  let productImage = document.createElement("img");
  productImage.classList.add("card-img-top");
  productImage.classList.add("product-image");
  productImage.src = `${uploadImage}`;
  let inputFile = document.createElement("input");
  inputFile.type = "file";
  inputFile.setAttribute("id", "ProductImage");
  inputFile.addEventListener("change", function () {
    const reader = new FileReader();
    reader.addEventListener("load", () => {
      uploadImage = reader.result;
      document.querySelector("card-img-top").src = `${uploadImage}`;
    });
    reader.readAsDataURL(this.files[0]);
  });
  card.appendChild(inputFile);
  card.appendChild(productImage);
  let cardBody = document.createElement("div");
  cardBody.classList.add("card-body");
  card.appendChild(cardBody);
  let productName = document.createElement("h3");
  productName.classList.add("card-title");
  productName.classList.add("product-name");
  productName.textContent = ProductName.value;
  cardBody.appendChild(productName);
  let productPrice = document.createElement("p");
  productPrice.classList.add("card-text");
  productPrice.classList.add("product-price");
  productPrice.textContent = ProductPrice.value + " s.p";
  cardBody.appendChild(productPrice);
  let productType = document.createElement("h5");
  productType.classList.add("btn-light");
  productType.classList.add("product-type");
  productType.textContent = ProductType.value;
  cardBody.appendChild(productType);
  let productDescription = document.createElement("p");
  productDescription.classList.add("product-description");
  productDescription.textContent = ProductDescription.value;
  cardBody.appendChild(productDescription);
  let EditProduct = document.createElement("span");
  EditProduct.classList.add("fa-solid");
  EditProduct.classList.add("fa-pen");
  EditProduct.classList.add("product-edit");
  EditProduct.setAttribute("data-bs-toggle", "modal");
  EditProduct.setAttribute("data-bs-target", "#editProduct");
  let DeleteProduct = document.createElement("span");
  DeleteProduct.classList.add("fa-solid");
  DeleteProduct.classList.add("fa-trash-can");
  DeleteProduct.classList.add("product-delete");
  DeleteProduct.setAttribute("data-bs-toggle", "modal");
  DeleteProduct.setAttribute("data-bs-target", "#deleteProduct");
  let disableButton = document.createElement("button");
  disableButton.innerHTML = "Disable";
  disableButton.classList.add("disable-button");
  disableButton.classList.add("btn");
  disableButton.classList.add("btn-lg");
  disableButton.classList.add("btn-danger");
  cardBody.appendChild(disableButton);
  cardBody.appendChild(DeleteProduct);
  EditProduct.addEventListener("click", (e) => {
    if (countMistake >= 0) {
      e.preventDefault();
      CheckInputs();
    } else
      editProduct(productName, productPrice, productType, productDescription);
  });
  DeleteBtn.addEventListener("click", (e) => {
    deleteProduct(card);
  });
  cardBody.appendChild(EditProduct);
  card.appendChild(cardBody);
  document.querySelector(".cards").appendChild(card);
  ProductName.value = "";
  ProductPrice.value = "";
  ProductDescription.value = "";
  document
    .querySelector(
      "#createProduct .modal-dialog .modal-content .modal-footer .btn_close"
    )
    .click();
}

function editProduct(name, price, type, description) {
  document.getElementById("EditProductName").value = name.textContent;
  document.getElementById("EditProductPrice").value = price.textContent.slice(
    0,
    -4
  );
  document.getElementById("EditProductType").value = type.textContent;
  document.getElementById("EditProductDescription").value =
    description.textContent;
  EditButton.addEventListener("click", () => {
    name.textContent = document.getElementById("EditProductName").value;
    price.textContent =
      document.getElementById("EditProductPrice").value + " s.p";
    type.textContent = document.getElementById("EditProductType").value;
    description.textContent = document.getElementById(
      "EditProductDescription"
    ).value;
  });
}

function deleteProduct(card) {
  document.querySelector(".cards").removeChild(card);
  document
    .querySelector(
      "#deleteProduct .modal-dialog .modal-content .modal-footer .btn_close"
    )
    .click();
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
    document.querySelector("html").lang = "ar";
    document.querySelector("title").innerHTML = "صفحة قوائم المطعم ";
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
      "صفحة القوائم";
    document.querySelector(".source-welcome .welcome .text").innerHTML =
      "الأول & الأفضل";
    document.querySelector(".menu h2").innerHTML = "قوائم الطعام";
    document.querySelector(".create-product span").innerHTML = "إضافة منتج";
    document.querySelector("#logout .modal-header h5").innerHTML = "تسجيل خروج";
    document.querySelector("#logout .modal-body span").innerHTML =
      "هل أنت متأكد أنك تريد الخروج من الموقع";
    document.querySelector("#logout .modal-footer .btn_close").innerHTML =
      "إغلاق";
    document.querySelector("#logout .modal-footer .logout").innerHTML =
      "تسجيل خروج";
    document.querySelector("#deleteProduct .modal-header h5").innerHTML =
      "حذف منتج";
    document.querySelector("#deleteProduct .modal-body span").innerHTML =
      "هل أنت متأكد من حذف هذا المنتج";
    document.querySelector("#deleteProduct .modal-footer .btn_close").innerHTML =
      "خروج";
    document.querySelector("#deleteProduct .modal-footer #DeleteBtn").innerHTML =
      "حذف";
    // --------------------------------
  } else if (getLanguage === "english") {
    document.querySelector("html").lang = "en";
    document.querySelector("title").innerHTML = "Restaurant Menus Page";
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
    document.querySelector(".source-welcome .source a").innerHTML =
      "Menus Page";
    document.querySelector(".source-welcome .welcome .text").innerHTML =
      "First & Best";
    document.querySelector(".menu h2").innerHTML = "Food Menus";
    document.querySelector(".create-product span").innerHTML = "Add Product";
    document.querySelector("#logout .modal-header h5").innerHTML = "Log Out";
    document.querySelector("#logout .modal-body span").innerHTML =
      "Are you sure you want to log out of the website";
    document.querySelector("#logout .modal-footer .btn_close").innerHTML =
      "Close";
    document.querySelector("#logout .modal-footer .logout").innerHTML =
      "log out";
      document.querySelector("#deleteProduct .modal-header h5").innerHTML =
      "Delete Product";
    document.querySelector("#deleteProduct .modal-body span").innerHTML =
      "Are you sure to delete this product";
    document.querySelector("#deleteProduct .modal-footer .btn_close").innerHTML =
      "Close";
    document.querySelector("#deleteProduct .modal-footer #DeleteBtn").innerHTML =
      "Delete";
  }
}

// Change Language Website End
// ---------------------- //
