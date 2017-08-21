class DecksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @deck = Deck.find(params[:id])
  end
  
  def new
    @deck = current_user.decks.build
  end
  
  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      flash[:success] = 'Deckを作成しました。'
      redirect_to root_url
    else
      @decks = current_user.decks.order('created_at DESC')
      flash.now[:danger] = 'Deckの作成に失敗しました。'
      render :new
    end
  end

  def destroy
    @deck.destroy
    flash[:success] = 'Deckを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private 
  
  def deck_params
    params.require(:deck).permit(:title, :text1_language, :text2_language)
  end
  
  def correct_user
    @deck = current_user.decks.find_by(id: params[:id])
    unless @deck
      redirect_to root_url
    end
  end
end
