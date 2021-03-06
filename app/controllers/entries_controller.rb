class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
      @entry.word = params[:entry][:word]
      @entry.definition = params[:entry][:definition]
      @entry.language = params[:entry][:language]
    if @entry.save
        redirect_to entries_path
      else
        render :new
      end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.new
      @entry.word = params[:entry][:word]
      @entry.definition = params[:entry][:definition]
      @entry.language = params[:entry][:language]
        if @entry.save
            redirect_to entry_path(@entry)
          else
            render :show
          end
  end

  def destroy
    @entry = Entry.find(params[:id])
      if @entry.destroy
        redirect_to entries_path
      else
        render :show
      end
  end

# !---this is how we can filter out unwanted info from browser--!
  def entry_params
    params.require(:entry).permit(:word, :definition, :language)
  end

end
