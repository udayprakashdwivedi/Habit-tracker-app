class HabitMailer < ApplicationMailer
    default from: 'no-reply@habittracker.com'
  
    def weekly_summary(user)
      @user = user
      @habits = user.habits.includes(:completions)
      mail(to: @user.email, subject: 'Your Weekly Habit Summary')
    end
  end