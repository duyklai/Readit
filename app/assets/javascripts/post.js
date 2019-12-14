function submitCommentForm(post_id, user_id) {
  // Get input form from comments/new.html.erb form
  Rails.ajax({
    url: `/comments/new?post_id=${post_id}`,
    type: "GET",
    success: function(response) {
      document.body.append(response.documentElement);
      // Insert values into the fields
      let comment_form = document.querySelector(".comment_form");
      comment_form.childNodes.forEach(input => {
        if (input.id == "comment_user_id") {
          input.value = user_id;
        } else if (input.id == "comment_post_id") {
          input.value = post_id;
        }
      });
    },
    error: function() {
      alert("Error. Try again");
    }
  });
}
