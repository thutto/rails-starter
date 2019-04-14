class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    puts "In New"
    puts @note.inspect


  end

  def create
    @note = Note.new(note_params)
    puts "In create"
    puts @note.inspect

    if @note.save
      redirect_to @note
    else
      if @note != nil && @note.errors.any?
        print @note.errors.inspect
        show_errors(@note.errors.full_messages)
      end
      process_errors
      render "new"
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      process_errors
      render "edit"
    end
  end

  def destroy

  end

  private def process_errors
    if @note != nil && @note.errors.any?
      print @note.errors.inspect
      show_errors(@note.errors.full_messages)
    end
  end

  private def note_params
    params.require(:note).permit(:noteText)
  end
end
