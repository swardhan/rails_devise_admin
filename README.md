# Rails GMail Dashboard

This project uses the Gmail Api to create an admin dashboard where the mail queries are loaded into the dashboard to be assigned to different employees. The employee can see the queries assigned to them and then reply from the app itself.

Note: There is a common interface for both Employees and Admin and the admin is bool value in user table which is made true using the rails console.

Requirements:

* Ruby version: 2.4
* Rails: 5.2

Gems Used:
* gmail_api_client
* Mail gem to create mails
* Devise

### DB Schema:

User Table:
1. email
2. password
3. admin : Boolean

Query Table:
1. body
2. from
3. subject
4. mail_id
5. subject_id
6. reply
7. replied: boolean
