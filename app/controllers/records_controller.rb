class RecordsController < ApplicationController
  before_action :find_record, only: %i[show edit update destroy]

  def index
    @records = Record.all
  end

  def show
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      redirect_to record_path(@record)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @record.update(record_params)
    redirect_to record_path(@record), status: :see_other
  end

  def destroy
    @record.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def find_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(%i[title genre price location artist photo])
  end
end
