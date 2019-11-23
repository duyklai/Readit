document.addEventListener('DOMContentLoaded', function() {
  create_post_form = document.querySelector('.create-post-form');
  create_post_form.addEventListener('click', function(e) {
      location.href = "posts/new"
  })
});
  