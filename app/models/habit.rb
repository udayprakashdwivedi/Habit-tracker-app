class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_checkins, dependent: :destroy

  validates :name, presence: true

  def checked_in_dates
    habit_checkins.pluck(:date)
  end

  def current_streak
    streak = 0
    today = Date.today
    while habit_checkins.exists?(date: today - streak)
      streak += 1
    end
    streak
  end

  def longest_streak
    days = habit_checkins.order(:date).pluck(:date)
    return 0 if days.empty?

    streaks = []
    current = 1

    days.each_cons(2) do |a, b|
      if b == a + 1.day
        current += 1
      else
        streaks << current
        current = 1
      end
    end
    streaks << current
    streaks.max
  end

  def checked_in_today?
    habit_checkins.where(created_at: Time.zone.today.all_day).exists?
  end
  
  

  def consistency
    return 0 if habit_checkins.empty?
    ((habit_checkins.count.to_f / (Date.today - created_at.to_date + 1).to_f) * 100).round(2)
  end
end