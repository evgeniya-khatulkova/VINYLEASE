class PagesController < ApplicationController
  def home
    @records = Record.all
      if params[:genre].present?
        @records = Record.where(genre:[params[:genre]])
      elsif params[:query].present?
        sql_query = "artist ILIKE :query OR title ILIKE :query"
        @records = Record.where(sql_query, query: "%#{params[:query]}%")
      else
        @records = Record.all
      end
  end

  def rock
  end

  private

  def record_params
    params.require(:record).permit(%i[title genre price location artist])
  end
end
