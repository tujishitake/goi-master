class FlashcardsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
  #   deck = current_user.decks.find(params[:id])
  #   @flashcard = deck.flashcards.build(flashcard_params)
  #   if @flashcard.save
  #     flash[:success] = 'フラッシュカードを作成しました。'
  #     redirect_to @deck
  #   else
  #     flash.now[:danger] = 'フラッシュカードの作成に失敗しました。'
  #     redner edit_deck_path
  #   end
  # end

  def update
  end

  def destroy
  end
  
  private
  
  def flashcard_params
    params.require(:flashcard).permit(:text1, :text2)
  end
end
