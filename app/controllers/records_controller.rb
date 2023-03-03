class RecordsController < ApplicationController
  before_action :find_record, only: %i[show edit update destroy]

  def index
    @records = Record.all
  end

  def show
    @genre =
    { "Rock" => "https://cdn.pixabay.com/download/audio/2022/08/23/audio_8d07c2f3af.mp3?filename=hip-hop-rock-beats-118000.mp3",
      "Jazz" => "https://cdn.pixabay.com/audio/2021/11/25/audio_91b32e02f9.mp3",
      "Electronic" => "https://cdn.pixabay.com/audio/2022/10/05/audio_686ddcce85.mp3",
      "Pop" => "https://cdn.pixabay.com/audio/2022/02/07/audio_6ccd59b11c.mp3",
      "Hip-hop" => "https://cdn.pixabay.com/download/audio/2022/05/23/audio_e341a2c57a.mp3?filename=the-podcast-intro-111863.mp3",
      "Funk" => "https://cdn.pixabay.com/download/audio/2022/03/15/audio_5b969a1b38.mp3?filename=funk-84237.mp3",
      "Soul" => "https://cdn.pixabay.com/audio/2021/02/03/audio_67e041df5a.mp3",
      "Disco" => "https://cdn.pixabay.com/download/audio/2022/03/28/audio_83ea8f61e5.mp3?filename=fun-disco-1-108497.mp3"
    }
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
    reviews = Review.where(reservation_id: params[:id])
    reviews.destroy_all
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
