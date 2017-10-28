class FlashcardsController < ApplicationController
  before_action :require_user_logged_in
  require 'open-uri'
  # require "FileUtils"
  
  def create
  end

  def update
    @flashcard = Flashcard.find(params[:id])
    if @flashcard.update(flashcard_params)
      if @flashcard.bookmark
        flash[:success] = 'ブックマークに追加しました'
        redirect_back(fallback_location: root_path) 
      else
        flash[:success] = 'ブックマークを削除しました'
        redirect_back(fallback_location: root_path) 
      end
    end
  end

  def destroy
  end
  
  def bookmarks
    # @flashcards = current_user.flashcards.where(bookmark: true).order(created_at: :DESC).includes(:deck)
    @decks = current_user.decks.joins(:flashcards).where("flashcards.bookmark = true").distinct
  end
  
  def get_image
    @flashcard = Flashcard.find(params[:id])
    image_url = @flashcard.photo
    
    # ready filepath
    file_name = File.basename(image_url)
    dir_name = Rails.root.join('public', "img")
    file_path = dir_name + file_name
    
    # write image data
    open(file_path, 'wb') do |output|
      open(image_url) do |data|
        output.write(data.read)
      end
    end
    
    @flashcard.image = image_url
    # p  "#{@flashcard} ＠＠＠出力テスト＠＠＠"
    @flashcard.save
    redirect_back(fallback_location: root_path)
  end
  
  def delete_image
    @flashcard = Flashcard.find(params[:id])
    file_name = File.basename(@flashcard.image)
    dir_name = Rails.root.join('public', "img")
    file_path = dir_name + file_name
    File.delete file_path
    @flashcard.image = nil
    @flashcard.save
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def flashcard_params
    params.require(:flashcard).permit(:bookmark)
  end
end
