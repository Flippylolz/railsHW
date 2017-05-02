##Installing

Don`t forget to install mySQL2 or mariaDB and  ImageMagick
```
sudo apt-get update
sudo apt-get install mysql-server mysql-client libmysqlclient-dev imagemagick
```
Then go for
```
bundle install
rake db:create db:migrate db:seed
rails s
```

Task 5

### Learn

1. Validations - <http://guides.rubyonrails.org/v3.2/active_record_validations_callbacks.html#validation-helpers>
2. Polymorphic association - <http://guides.rubyonrails.org/v3.2/association_basics.html#polymorphic-associations>
3. \*If you have free time: STI association - <https://rubydev.ru/2011/07/rdr3t-single-table-inheritance-rails/>

### Prepare

Create models (tables) to cover next architecture:
```
User:
=> first_name
=> last_name
=> username
=> password
=> email
=> birthday

Post:
=> title
=> body
=> published_at

Image:
=> url
```
### Tasks

1. Associations:
 * user has many posts
 * image can be associated with User and Post (polymorphic)
2. Validations:
 * username and email should be unique
 * password should be min 8-chars long
 * username, email and password are required fields
3. Scopes:
 * all published posts
 * all users older than 18 years
4. Add User instance method: `full_name`

Task 6

### Overview

Implement user.rake with namespace `user` and two tasks: `import` and `export`

* `Import` task should have path argument and import users from giving CSV file
* `Export` task should export all Users from database to CSV file

Task 7

### Overview
Add bootstrap

Task 8
### Overview

After login user should be redirected to page with newsfeed (something like vk or facebook have) form in the top and posts (latest posts first). Use bootstrap components for better look.

##### Requirements

Form should have only Title and Body fields. Please ignore published_at for now.
Posts should be added via AJAX
Each post entry should show Title, Body, Author full name and created_at date in next format (April 14, 2017)
If you are the author of post you should see Delete button near it. (Hint use current_user object to detect this)
Delete also should work with AJAX
NOTE: also please attach some screenshots with your code changes (slack attachments will be ok)

Task 9

### Overview

Implement AJAX edit for posts

##### Requirements

If you are the author of post you should also see Edit button near it.
When you press Edit form should appear instead of appropriate fields (Title should be replaced with text field, Body - with text area, Edit - with Save )
After changes it should return to original post design but with new data
Extra task Use WYSIWYG html editor
Gems

CKEditor https://github.com/galetahub/ckeditor
Best In Place https://github.com/bernat/best_in_place
HINTS

RailsCast http://railscasts.com/episodes/302-in-place-editing?view=asciicast
If you want text inside post to use HTML formatting then use html_safe method. (e.g.post.body.html_safe)

Task 10

### Overview

Implement infinite scroll for your newsfeed (like vk.com newsfeed)

##### Gems

Kaminari https://github.com/kaminari/kaminari
Will Paginate https://github.com/mislav/will_paginate
JS plugins https://www.sitepoint.com/jquery-infinite-scrolling-demos/

Task 11

### Overview

Implement sharing to 3 social networks (on your choice) using native dialogs.

##### Gems

Social Share Button https://github.com/huacnlee/social-share-button
