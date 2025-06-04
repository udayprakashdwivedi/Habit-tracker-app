class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: %i[show edit update destroy checkin]

  def index
    @habits = current_user.habits.includes(:habit_checkins)
  end

  def show
    @habit = Habit.find(params[:id])
  end
  

  def new
    @habit = current_user.habits.build
  end

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      redirect_to habits_path, notice: 'Habit created.'
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    if @habit.update(habit_params)
      redirect_to habits_path, notice: 'Habit updated.'
    else
      render :edit
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.destroy
    redirect_to habits_path, notice: 'Habit was successfully deleted.'
  end

  def checkin
    @habit = current_user.habits.find(params[:id])
    if @habit.habit_checkins.exists?(date: Date.today)
      flash[:notice] = "Already marked today!"
    else
      @habit.habit_checkins.create(date: Date.today)
      flash[:success] = "Habit marked for today!"
    end
    redirect_to habits_path
  end

  
  private

  def set_habit
    @habit = current_user.habits.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :description)
  end
end