document.addEventListener("turbolinks:load", function() {
  if (document.querySelector(".tag-page")) {
    document.getElementById("default").click();
  }

  // Removing spaces and special characters from tag creation
  if (document.querySelector("#post_tag")) {
    document.querySelector("#post_tag").onkeypress = function(e) {
      if (
        !((e.which >= 65 && e.which <= 90) || (e.which >= 97 && e.which <= 122))
      )
        return false;
    };
  }
});
