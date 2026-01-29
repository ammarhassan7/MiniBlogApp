# 🚀 MiniBlogApp (Capstone Project)

A modern, full-stack blogging platform built with **Ruby on Rails 7** and **MongoDB**. This application allows users to write posts, comment on discussions, and manage their content with secure authentication and authorization.

## 🛠 Tech Stack
* **Framework:** Ruby on Rails 7
* **Database:** MongoDB (via Mongoid)
* **Authentication:** Devise
* **Authorization:** CanCanCan
* **UI/Styling:** Bootstrap 5 & FontAwesome
* **Pagination:** Kaminari

## ✨ Features
* **User Authentication:** Secure Sign-up, Login, and Logout.
* **Role-Based Access:** * Everyone can read posts.
    * Only logged-in users can create posts/comments.
    * Users can only edit/delete their *own* posts.
    * Post authors can moderate comments on their threads.
* **Responsive UI:** Fully responsive design with a sticky navbar and footer.
* **Pagination:** Smooth pagination for the posts feed.

## ⚙️ Setup Guide
1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/ammarhassan7/MiniBlogApp.git](https://github.com/ammarhassan7/MiniBlogApp.git)
    cd MiniBlogApp
    ```
2.  **Install Dependencies:**
    ```bash
    bundle install
    ```
3.  **Start MongoDB (if not running):**
    ```bash
    brew services start mongodb-community
    ```
4.  **Run the Server:**
    ```bash
    rails s
    ```