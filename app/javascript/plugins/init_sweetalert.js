import swal from "sweetalert";
const sleep = (delay) => new Promise((resolve) => setTimeout(resolve, delay));

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  const description = document.getElementById("delete-profile");
  const file = document.getElementById("postulation_file");
  if (swalButton) {
    // protect other pages
    swalButton.addEventListener("click", () => {
      if (description.value.length > 49) {
        swal(options).then(callback); // <-- add the `.then(callback)`
      }
    });
  }
};

export { initSweetalert };
