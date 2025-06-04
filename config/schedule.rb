set :output, "log/cron.log"
every :monday, at: '8am' do
  runner "User.find_each { |user| HabitMailer.weekly_summary(user).deliver_later }"
end