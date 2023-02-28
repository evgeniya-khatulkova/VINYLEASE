class PagesController < ApplicationController
  def home
    @records = Record.all
  end
end
