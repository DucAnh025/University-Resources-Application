# Smart University Resource and Attendance System (SURAS)

## 📱 Project Overview
**Smart University Resource and Attendance System (SURAS)** is a comprehensive mobile application designed to enhance the student experience in universities. It integrates multiple services, including academic resource management, smart attendance tracking, and canteen operations, into a single, user-friendly platform.

With a focus on **efficiency and automation**, **SURAS** integrates:
- **Seamless access** to lecture slides, homework, solutions, project materials, and exam questions.
- **Biometric-based attendance system** using **Face ID & Touch ID**.
- **Smart canteen ordering** to reduce congestion during peak hours.
- **AI-powered Chatbot (GPT-4o)** for academic assistance and resource recommendations.

---

## ✨ Features
### **1. Authentication & User Management**
- User **registration, login, logout** with Firebase authentication.
- Multi-Factor Authentication (**MFA**) for enhanced security.
- Profile management with editable user information.

### **2. Academic Resource Access**
- **Lecture slides, assignments, solutions, project documents, and exam archives.**
- **Real-time updates** through Firebase Firestore.
- **Structured search system** for quick access to materials.

### **3. Attendance Management System**
- **Face ID & Touch ID** authentication for attendance tracking.
- **GPS-based verification** ensuring student presence in class.
- **Automated attendance logs** for professors and administrators.

### **4. Smart Canteen System**
- **Daily menu & special offers** available for browsing.
- **Pre-order system** to reduce queue times.
- **Real-time order tracking** and notifications.
- **Mobile payment integration** (MOMO, credit card, etc.).

### **5. AI-powered Chatbot (GPT-4o)**
- **Academic assistance** for students via AI-driven responses.
- **Sign recognition for uploaded notes/images**.
- **Resource recommendations** based on learning patterns.

---

## 🏗 System Architecture
### **Tech Stack**
- **Frontend:** Flutter (Dart)
- **Backend:** Firebase, Firestore
- **Authentication:** Firebase Authentication (MFA, Biometric Login)
- **Database:** Firestore (NoSQL for real-time access)
- **AI Integration:** OpenAI API (GPT-4o for chatbot, image recognition)
- **Payment Gateway:** MOMO API

---

## 🚀 Installation & Setup

### **System Requirements**
- **Android 8.0+** (for the mobile app)
- **Flutter SDK** (for development)
- **Firebase Account** (for backend services)

### **📱 Android App Installation**
```bash
git clone https://github.com/DucAnh025/SURAS-Application
cd SURAS-Application
flutter pub get
flutter run
```

---

# 📖 Usage Guide

## Step 1: User Registration & Login
- Users can **sign up** with email, phone number, or social accounts.
- **Multi-Factor Authentication (MFA)** ensures security.
- Biometric authentication (Face ID, Touch ID) available.

## Step 2: Accessing Learning Resources
- Navigate to the **Resources section** for academic materials.
- Filter materials by **semester, subject, and type (slides, assignments, exams, etc.)**.

## Step 3: Using Attendance System
- Open the **Attendance module** and authenticate via Face ID or Touch ID.
- Attendance status is recorded **instantly** and shared with professors.

## Step 4: Managing Canteen Orders
- Browse the **daily menu and promotions**.
- **Pre-order meals** and receive notifications when ready.
- Make secure payments via **MOMO or linked payment methods**.

## Step 5: AI Chatbot Assistance
- Ask GPT-4o for **academic support, explanations, or study tips**.
- Upload handwritten notes or images for **text recognition**.
- **Track learning progress** via AI-generated study recommendations.

📌 *App interface preview*

---

## ❓ Troubleshooting & FAQ

### Q1: Face ID/Touch ID is not working.
✔ Ensure that your device supports biometric authentication and has the feature enabled.

### Q2: How can I update the database with new academic materials?
✔ Admins can upload materials via the Firestore backend panel or directly from the app (with admin access).

### Q3: Why is my canteen order delayed?
✔ Orders depend on processing times. Check real-time updates in the **Order Status** section.

📌 **More FAQs**: [FAQ.md](https://github.com/DucAnh025)

---

## ☎️ Contact & Support

For any questions or support, feel free to reach out:

- 📧 **Email**: [buileducanh25@gmail.com](mailto:buileducanh25@gmail.com)  
- 💬 **Facebook**: [Duc Anh](https://www.facebook.com/ducanh.buile.56/)  
- 🐦 **LinkedIn**: [Bui Le Duc Anh](www.linkedin.com/in/buileducanh2505)  

---

## 📌 Future Development
- **Expanded AI capabilities** for personalized learning recommendations.
- **Integration with university timetables** for automated event reminders.
- **Offline mode** for accessing previously downloaded resources.
- **Expanded payment options** including university meal plans and e-wallets.

🚀 *SURAS aims to revolutionize the university experience by seamlessly integrating technology into everyday student life.*
