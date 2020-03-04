document.addEventListener("turbolinks:load", function() {
  if (document.querySelector(".notice_div")) {
    setTimeout(function() {
      document.querySelector(".notice_div").classList.add("hide");
    }, 1500);

    setTimeout(function() {
      document.querySelector(".notice_div").classList.add("remove");
    }, 2000);
  }

  if (!document.querySelector(".create-post-form")) return;
  create_post_form = document.querySelector(".create-post-form");
  create_post_form.addEventListener("click", function(e) {
    location.href = "posts/new";
  });
});
