function submitCommentForm(
  post_id,
  user_id,
  parent_id = null,
  ancestry_id = null
) {
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
        } else if (input.id == "comment_ancestry") {
          // When reached the field of ancestry
          if (ancestry_id != null && ancestry_id != "") {
            // Check to see if the current comment is root or reply/nested reply
            input.value = ancestry_id + "/" + parent_id;
          } else if (parent_id != null) {
            // If replying to a root comment, fill in field with parent_id
            input.value = parent_id;
          } else {
            // If this is a brand new comment in the post, leave blank
            input.value = null;
          }
        }
      });
    },
    error: function() {
      alert("Error. Try again");
    }
  });
}
