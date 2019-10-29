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

### Flow
-The app would require a domain to be authorised by OAuth, so I used ngrock for tunneling.
-The generated domain has to be authorised using the Google Developer Console.

#### Admin Flow
1. Open terminal and start the tunneling service using the command
 ```
 ngrok https 3000
 ```
2. The generated domain has to be authorised using the Google Developer Console.

3. Now start the rails server and using the link Authenticate the API.
4. Login with admin credentials.
5. Click on *load* link. last 20 email queries will be extracted and then the required info will be saved to the db.
6. After the page has loaded the admin can assign the query to the user and can see the status of the query.

#### Employee Flow
1. Employee's view sees the queries assigned to him/her and also the status of the query.
2. Using the link authenticate the API. 
3. If the query is not replied the employee can reply to it from the dashboard itself.

** API access token expires every hour. **
