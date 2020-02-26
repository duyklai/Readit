document.addEventListener("turbolinks:load", function() {
  if (document.querySelector(".tag-page")) {
    document.getElementById("default").click();
  }
});
