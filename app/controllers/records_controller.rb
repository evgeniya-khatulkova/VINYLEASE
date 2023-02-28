class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save!
      redirect_to records_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.permit(:record).require(%i[title genre price location artist])
  end
end
