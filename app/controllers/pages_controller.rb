class PagesController < ApplicationController
  def home
    @records = Record.all
    if params[:genre].present?
      @records = Record.where(genre: [params[:genre]])
    end
  end

  def rock
  end

private

def record_params
  params.require(:record).permit(%i[title genre price location artist])
end
end
