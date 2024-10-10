
# ONLINE BANKING APPLICATION

A Spring Boot-based online banking application that allows users to manage accounts, perform transactions, view payment history, and authenticate securely.


## FEATURES

 - User Authentication(Token-based authentication using email verification for secure access)
 - Account Management (View and manage user accounts)
 - Transaction Management (Perform and view transactions and payment history)
 - Payment History  (View payment records in descending order by date)
 - Chatbot Integration (Get quick assistance and answers to common banking questions via an integrated chatbot.)



## TECHNOLOGIES USED

- Back-end: Spring Boot, Spring Security, Java
- Front-end: JSP, HTML, CSS
- Database: MySQL
- Security: BCrypt for password hashing, token-based authentication for session management
- Libraries: Jakarta for web components, Spring Data JPA for database interaction


## INSTALLATION

### PREREQUISITES
- Java 17 or above
- Maven
- MySQL


## STEPS (To Run The Application)



### Step 1: Create a New Connection in MySQL Workbench
1. Open MySQL Workbench.
2. Create a new connection with the following settings:
   - **Hostname**: `localhost`
   - **Port**: `3306`
   - **Username**: `root`
   - **Password**: (your MySQL root password)

### Step 2: Create an Empty Database
 Run the following command to create a new database named `demo_bank`:

     CREATE DATABASE demo_bank;

Make sure your server is running 

### Step 3: open the terminal(Bash or CMD)

        mysql -u root -p demo_bank < path\to\demo_bank.sql

Enter your mysql root password:

### Step 4: 
 - open the project file in vs code or other code editors.
 - Make sure you have a dependencies like JDK(Java Development Kit),extension pack for maven in vs code.
 - Navigate to the application_properties (src>main>resources>application_properties)
 -  change Spring.datasource.password:[Your MySQL Root Password]

### Step 5
- Run the application(maven<plugins<springboot<run)
 




## Output Images

Home page
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20120826.png?raw=true)

Account registration page
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20120838.png?raw=true)

After account creation by User credentials
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121715.png?raw=true)

Account Verification in Email
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121748.png?raw=true)

Successful Account Verification
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121806.png?raw=true)

After the Correct User login
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121120.png?raw=true)

Add new account
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121150.png?raw=true)

make a transaction (Payment)
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121233.png?raw=true)

make a transaction (transfer)
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121244.png?raw=true)

make a transaction (deposit)
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121300.png?raw=true)

make a transaction (withdraw)
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121312.png?raw=true)

View payment history
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121330.png?raw=true)

View transaction history
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121342.png?raw=true)

Integrated chatbot
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121411.png?raw=true)

signout
![App Screenshot](https://github.com/MD-SAMEER25/newrepo/blob/main/Screenshot%202024-10-10%20121426.png?raw=true)


















## USAGE

- Login: Access the application by logging in with registered email and password.

- Dashboard: View account details, transaction history, and apply for loans.
- Transactions: Use the “Transaction” button to open the transaction panel.
- Payment History: View payment records in the history section, ordered by date.

## TROUBLESHOOTING

 If you encounter issues while running the application, consider the following solutions:

- Database Connection Issues(Ensure that your MySQL server is running and accessible. Check your database connection settings in src/main/resources/application.properties)

- If path\to\demo_bank.sql is not the correct path to your SQL file, the command will fail with an error indicating that the file cannot be found

- If the database demo_bank does not exist, MySQL will return an error. Ensure that you’ve created the demo_bank database first using:
        
        CREATE DATABASE demo_bank;

- Ensure all the dependencies are correctly installed

## FREQUENTLY ASKED QUESTIONS

- How do I register a new user?
To register a new user, navigate to the registration page, fill in the required details, and submit the form. You will receive a verification email to confirm your registration.


- How can I view my transaction history?
Your transaction history can be accessed from the dashboard under the "Transaction History" section. You can filter transactions by date or type.

- Is my data secure?
Yes, your data is secured using token-based authentication and password hashing with BCrypt. Regular security audits are performed to ensure data integrity.

- How can I get contact support?
You can get support through the integrated chatbot feature in the application. The chatbot can assist you with common inquiries and provide quick answers to your questions.
## Contact

For any inquiries or issues, please contact Mohamed Sameer(Administrator) at mohamedsameerazad8@gmail.com