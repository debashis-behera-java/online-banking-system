# Online Banking System

An Online Banking System built using Java Spring Boot that provides secure banking operations such as account management, transactions, loans, EMI reminders, and admin/customer dashboards.

---

## Features

* User Authentication & Authorization
* Customer Dashboard
* Admin Dashboard
* Money Transfer & Transactions
* Loan Management
* EMI Reminder Service
* Chatbot Support
* Responsive Frontend UI
* Secure Banking Operations

---

## Tech Stack

### Backend

* Java
* Spring Boot
* Spring MVC
* Maven

### Frontend

* HTML
* CSS
* JavaScript
* Bootstrap

### Database

* MySQL

---

## Project Structure

```bash
online-banking-system-main/
│
├── src/main/java/com/example/online_banking_system/
│   ├── AdminController.java
│   ├── AuthController.java
│   ├── ChatbotController.java
│   ├── CustomerController.java
│   ├── LoanController.java
│   ├── TransactionController.java
│   ├── EmiReminderService.java
│   └── OnlineBankingApplication.java
│
├── src/main/resources/
│   └── application.properties
│
├── src/main/webapp/
│   ├── css/
│   ├── js/
│   ├── images/
│   └── css2/
│
├── pom.xml
├── Dockerfile
└── README.md
```

---

## Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/online-banking-system.git
cd online-banking-system
```

### 2. Configure Database

Open:

```bash
src/main/resources/application.properties
```

Add your MySQL configuration:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/online_banking
spring.datasource.username=root
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```

---

### 3. Run the Project

Using Maven:

```bash
mvn spring-boot:run
```

Or using Wrapper:

```bash
./mvnw spring-boot:run
```

---

## Docker Support

Build Docker Image:

```bash
docker build -t online-banking-system .
```

Run Container:

```bash
docker run -p 8080:8080 online-banking-system
```

---

## Main Modules

### Authentication Module

* Login & Registration
* Secure User Access

### Customer Module

* View Account Details
* Transfer Money
* Transaction History

### Admin Module

* Manage Users
* Monitor Transactions
* Loan Approvals

### Loan & EMI Module

* Loan Requests
* EMI Notifications & Reminders

### Chatbot Module

* Banking Assistance
* User Query Support

---

## Screenshots

You can add project screenshots here.

```md
![Home Page](screenshots/home.png)
![Dashboard](screenshots/dashboard.png)
```

---

## Future Improvements

* OTP Verification
* Email Notifications
* AI-based Fraud Detection
* Mobile Application Support
* Advanced Analytics Dashboard

---

## Contributing

Contributions are welcome.

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

## License

This project is developed for educational purposes.

---

## Author

Developed by Debashis Behera.
