class CompletionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit

  def create
    @completion = @habit.completions.find_or_initialize_by(completed_on: Date.today)
    if @completion.save
      redirect_to habits_path, notice: 'Habit marked as completed for today!'
    else
      redirect_to habits_path, alert: 'Already marked or error occurred.'
    end
  end

  def destroy
    @completion = @habit.completions.find_by(completed_on: Date.today)
    @completion&.destroy
    redirect_to habits_path, notice: 'Completion removed.'
  end

  private

  def set_habit
    @habit = current_user.habits.find(params[:habit_id])
  end
end