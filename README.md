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
