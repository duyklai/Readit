document.addEventListener("turbolinks:load", function() {
  if (!document.querySelector(".create-post-form")) return;
  create_post_form = document.querySelector(".create-post-form");
  create_post_form.addEventListener("click", function(e) {
    location.href = "posts/new";
  });
});
