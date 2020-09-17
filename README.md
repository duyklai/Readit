# Readit: Recreation of Reddit

This project was a showcase of my web-development abilities to recreate some of the simple features of the popular forum website Reddit. Since I have been a long time user of Reddit, I have experienced both the original UI as well as the new modernized UI. I decided that I would take some features from both and form my own mix. I want to keep the essence of the website being a simple forum that everyone can easily come in and chat. This project was built with Ruby on Rails with some JS scripts and minimal Rspec testing.

[Readit](https://fast-oasis-86941.herokuapp.com/)

## Current features

### Creation

- Can create users, posts, comments, tags
- Users can be created with email, username, and password (no email confirmation)
- To create posts/comments/tags, user must be logged in
- Tags can be selected or created new on post creation or edit page

### Editing

- Admin can edit posts or tag names
- Owner of content (posts or comments) can only edit their own stuff
- Tags **do not** have an owner, therefore can only be edited by admin

### Deletion

- Admin can delete posts or tags
- Admin **cannot** delete other user accounts
- User can delete their own content
- Deleting posts **will** delete comments/votes within post
- Deleting commets **will** delete votes on it
- Deleting tag **will not** delete the post; post will be marked unlisted
- Deleting user **will** delete associated posts/comments
- Deleting user **will not** delete their votes on posts/comments

### Admin

- Only admin can make other non-admin users admin
- Admin cannot delete their account if they are the only admin
- Admin are the only people to edit tags or delete tags

### Sorting

- Each post page features a sorting for comment section
- User can select to sort comments by _Relevance_ (newest) or by _Top_ (most points)
- Clicking on sort will add the sort by type to url

### Profile

- Profile page of user features all of their content (posts and comments)
- Profile page of user have three different view (overview, posts only, comments only)
- User can also edit their account information in with a link on their profile page
- Profile page of tags features all posts tagged with said tag
- Admin can edit tag names on the tag profile page

### Back

- Only some pages on website have a back button
- Top left logo / title act as a reset button (just like Reddit) to redirect to home page

## Future todos:

- Obvious indication for user with admin privileges
- Create more human-friendly url for posts, user profile, tag profile
- Create a limit on nested comment chains and link to new page to view all comments (current build will eventually break due to margin)
- Sanitizing all user inputs to protect against attacks

# How to build: Local instructions

This project was built with Ruby 2.6.5 and Rails 5.2.4.2; To build locally:

Clone the repository:

`$ git clone https://github.com/duyklai/Readit.git`

Install the necessary gems:

`$ bundle install`

Migrate the database and setup (seeding):

`$ rails db:migrate`

`$ rails db:setup`

Run the rspec spec to make sure everything is running smoothly

`$ bundle exec rspec spec`

Then, you can start the server:

`$ rails server`

connect to localhost:3000 on your browser. Check the .../db/seed.rb to check the login information for the admin account or create your own account.
