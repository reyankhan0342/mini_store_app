🛍️ Mini Store App – Flutter E-Commerce Application

A modern and scalable Flutter e-commerce demo application built using MVVM architecture and Provider for state management.
This project demonstrates clean architecture principles, proper state handling, API integration, localization, and persistent session management.

📌 Key Features
🔐 Authentication System

Login using Email & Password

Login using Phone + OTP (Mock Implementation)

Persistent user session using SharedPreferences

Automatic redirection after successful login

Onboarding screens displayed only on first launch

🚀 App Flow Management

Splash Screen with initialization logic

Smart navigation based on user state:

First launch → Onboarding

Not logged in → Login

Logged in → Home

Logout → Back to Login

🌐 Localization & RTL Support

Full Arabic RTL layout support 🇸🇦

Dynamic language switching

Permanent language storage

Implemented using GetX for translations and navigation

🛍️ Product Module

Products fetched from FakeStore API

API integration using HTTP package

Responsive GridView layout

Reusable product card components

Supports smooth navigation to product details

📦 Product Details

Displays product image, title, description, and price

Add to Cart functionality

Smooth navigation using GetX

Clean and responsive UI

🛒 Cart System

Add and remove products dynamically

Dynamic cart badge counter

Real-time reactive updates using Provider

Fully responsive and user-friendly UI

Prevents duplicate items in cart

💾 Local Storage

SharedPreferences for persistent storage

Stores:

Login session

Onboarding completion

Selected language

🏗️ Architecture & Structure

MVVM (Model – View – ViewModel) architecture

Feature-based folder structure for scalability

Clear separation of concerns

Services layer for API and local storage

Scalable and maintainable codebase

🧠 State Management

Provider + ChangeNotifier

Optimized rebuilds to prevent unnecessary UI updates

Fully reactive and responsive UI

🔌 Tech Stack

Flutter – Frontend framework

Provider – State management

GetX – Navigation and localization

HTTP – API integration

SharedPreferences – Persistent storage

ScreenUtil – Responsive design

Country Code Picker – Phone login support

Badges – Dynamic cart badge indicator

🎯 Project Highlights

Production-ready folder structure

Clean and scalable architecture implementation

Session persistence and onboarding logic

Localization & RTL support

Fully responsive design across devices

Modern UI with smooth animations

Reusable custom widgets

Feature-first approach for maintainability