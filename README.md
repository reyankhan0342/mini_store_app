🛍️ Mini Store App – Flutter E-Commerce Application

A modern Flutter Mini Store Application built using MVVM architecture and Provider state management.
The app demonstrates clean architecture principles, scalable structure, and real-world features like authentication, onboarding, API integration, cart management, localization, and session persistence.

📱 Overview

Mini Store App is a fully responsive e-commerce demo application that includes:

Splash Screen
Onboarding Flow (One-time display)

Flexible Login (Email/Password or Phone + OTP)

Arabic RTL Support 🇸🇦

Persistent Language Selection

Session Management

Product Listing from API

Cart Management System

Clean MVVM Architecture

Modern UI with animations

✨ Features
🔐 Authentication System

Login using Email & Password

Login using Phone + Static OTP

Persistent login session using SharedPreferences

After first successful login:

User is redirected directly to Home Screen

Onboarding screen will never show again

🚀 Splash Screen

App initialization

Checks:

If user is logged in → Go to Home

If first time → Show Onboarding

Otherwise → Show Login

📖 Onboarding Screens

Displayed only once

Stored using SharedPreferences

Clean animated UI

Skip & Next navigation

🌐 Localization & RTL Support

Full Arabic RTL UI

Language switching

Permanent language storage

Translation handled using GetX

Layout automatically adjusts for RTL

🛍️ Product Listing

Products fetched from:

https://fakestoreapi.com/products

HTTP package used for API calls

Displayed in GridView

Fully responsive layout

Product images from assets and API

Clean reusable product card widget

📦 Product Details

Product image

Title

Description

Price

Add to Cart button

Smooth navigation using GetX

🛒 Cart System (Mock Implementation)

Add items to cart

Remove items from cart

Dynamic badge item count

Fully reactive using Provider

Real-time UI updates

Completely responsive layout

💾 Local Storage

Implemented using:

SharedPreferences

Stores:

Login session

Onboarding completion

Selected language

📱 Responsive Design

flutter_screenutil

MediaQuery

Adaptive layouts

Works across multiple screen sizes

🏗️ Architecture
MVVM (Model – View – ViewModel)
lib/
│
├── core/
│   ├── constants/
│   ├── services/
│   ├── widgets/
│
├── features/
│   ├── auth/
│   ├── splash/
│   ├── onboarding/
│   ├── home/
│   ├── cart/
│
└── main.dart
✔ Separation of Concerns

UI separated from business logic

ViewModels handle state

Models handle data

Services handle API & storage

🧠 State Management

Provider

ChangeNotifier

Clean reactive updates

No unnecessary rebuilds

🔌 Packages Used
Package	Purpose
provider	State management
get	Navigation & Translation
http	API integration
shared_preferences	Local storage
flutter_screenutil	Responsive design
country_code_picker	Country code selection
badges	Cart badge count
🎨 UI Highlights

Modern clean design

Smooth animations

Custom reusable widgets

Consistent color theme

RTL-friendly layouts

Grid-based product layout

Cart badge indicator

🔄 Navigation

Handled using:

GetX Navigation

No back navigation after login

Controlled route flow

Clean routing structure

🔐 Session Flow Logic
Condition	Screen
First Launch	Onboarding
Not Logged In	Login
Logged In	Home
Logout	Login