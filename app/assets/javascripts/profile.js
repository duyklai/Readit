document.addEventListener("turbolinks:load", function() {
  if (document.querySelector(".profile")) {
    document.getElementById("default").click();
  }
});

function pageSelectView(e, viewName) {
  var i, viewcontent, tabs;
  // Hiding all of the content
  viewcontent = document.getElementsByClassName("view");
  for (i = 0; i < viewcontent.length; i++) {
    viewcontent[i].style.display = "none";
  }
  // Removing all of active
  tabs = document.getElementsByClassName("tabs");
  for (i = 0; i < tabs.length; i++) {
    tabs[i].className = tabs[i].className.replace(" active", "");
  }
  // Showing the clicked element; Add active to clicked tab
  document.getElementById(viewName).style.display = "block";
  e.currentTarget.className += " active";
}
