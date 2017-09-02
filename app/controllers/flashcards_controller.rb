class FlashcardsController < ApplicationController
  before_action :require_user_logged_in
  
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
    @flashcards = current_user.flashcards.where(bookmark: true).order(created_at: :DESC).includes(:deck)
  end
  
  private
  
  def flashcard_params
    params.require(:flashcard).permit(:bookmark)
  end
end
