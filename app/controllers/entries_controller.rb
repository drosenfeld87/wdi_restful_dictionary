class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
