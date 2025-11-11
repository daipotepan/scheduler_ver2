class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを登録に成功しました。"
      redirect_to schedules_path

    else
      flash[:notice] = "スケジュールを登録に失敗しました。"
      render "new", status: :unprocessable_entity
    end
  
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :done, :memo, :introduction))
      flash[:notice] = "予定ID「#{@schedule.id}」の情報を更新しました"
      flash[:notice] = "スケジュールの編集に成功しました。"
      redirect_to schedules_path
    else
      flash[:notice] = "スケジュールの編集に失敗しました。"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "予定を削除しました"
    
    redirect_to schedules_path
  end
end
