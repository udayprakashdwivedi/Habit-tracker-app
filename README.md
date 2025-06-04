# Habit Tracker - Consistently

A full-stack Ruby on Rails application to help users track personal habits and maintain consistency with a calendar view, streak calculations, and progress stats.

---

## Features

- User authentication with Devise (Sign Up, Login, Logout)
- Users can create, edit, delete personal habits
- Mark habits done for today or any previous day
- View habit progress with mini calendar UI (color-coded done/missed days)
- Track current streak, longest streak, and consistency percentage
- Responsive UI built with Tailwind CSS
- PostgreSQL database for reliable data storage

---

## Technologies Used

- Ruby 3.2.1
- Rails 8.0.2
- Node v20.18.1
- PostgreSQL (Database)
- Tailwind CSS (Styling)
- Devise (Authentication)
- Hotwire (Optional for live updates)
- Sidekiq + ActionMailer (Stretch goal for weekly email summaries)
  
---

## Prerequisites

- Ruby 3.2.1
- Rails 8.0.2
- PostgreSQL installed and running
- Node.js and Yarn installed for managing JavaScript and CSS assets
- After setup run bundle install , yarn   yarn build   yarn build:css

---

## Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/udayprakashdwivedi/Habit-tracker-app.git
   cd habit_tracker
