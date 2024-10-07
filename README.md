
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

To set up the project locally, you’ll need to clone the repository. Follow these steps to clone successfully:
- 1)Open your terminal(Git Bash or Windows command prompt)

- 2)Increase Git’s buffer size to handle large repositories
        
        git config --global http.postBuffer 524288000

- 3)clone the repository

        git clone https://github.com/MD-SAMEER25/online_Banking_Application.git

- 4)Navigate to the project directory

        cd online_Banking_Application

-5)Install dependencies and build the project(Bash or Cmd)

        ./mvnw install (or)  mvnw.cmd install


-6)Run the Application(Bash or Cmd)

        ./mvnw spring-boot:run (or) mvnw.cmd spring-boot:run

## USAGE

- Login: Access the application by logging in with registered email and password.

- Dashboard: View account details, transaction history, and apply for loans.
- Transactions: Use the “Transaction” button to open the transaction panel.
- Payment History: View payment records in the history section, ordered by date.
## TROUBLESHOOTING

 If you encounter issues while running the application, consider the following solutions:

- Database Connection Issues(Ensure that your MySQL server is running and accessible. Check your database connection settings in src/main/resources/application.properties)

- Batch File Execution (Windows) (If the mvnw.cmd file does not execute properly, try running the Command Prompt as an administrator or verify that the file is saved correctly with a .cmd extension)

- Long Build Times(If the build process takes longer than expected, check your internet connection, as dependencies may need to be downloaded)

- Token Authentication Failure (If you experience issues with token-based authentication, ensure that your email verification process is correctly implemented and that tokens are being generated and stored appropriately)
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
