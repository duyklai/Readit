document.addEventListener("turbolinks:load", function() {
  create_post_form = document.querySelector(".create-post-form");
  create_post_form.addEventListener("click", function(e) {
    location.href = "posts/new";
  });
});
