class DecksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :select_data, only: [:new, :edit]
  
  def show
    @deck = Deck.find(params[:id])
    @flashcard = @deck.flashcards.build   # form_for 用
    @flashcards = @deck.flashcards.order('created_at DESC')
  end
  
  def new
    # @deck = current_user.decks.build
    @deck = Form::Deck.new
  end
  
  def create
    # @deck = current_user.decks.build(deck_params)
    @deck = Form::Deck.new(deck_params)
    if @deck.save
      flash[:success] = "Deck #{@deck.name} を作成しました。"
      redirect_to root_url
    else
      @decks = current_user.decks.order('created_at DESC')
      flash.now[:danger] = "Deck #{@deck.name} の作成に失敗しました。"
      render :new
    end
  end
  
  def edit
    # @deck = current_user.decks.find(params[:id])
    @deck = Form::Deck.find(params[:id])
    # @flashcard = @deck.flashcards.build   # form_for 用
  end
  
  def update
    # @deck = current_user.decks.find(params[:id])
    @deck = Form::Deck.find(params[:id])
    
    if @deck.update_attributes(deck_params)
      flash[:success] = "Deck #{@deck.name} は更新されました。"
      redirect_to current_user
    else
      flash.now[:danger] = "Deck #{@deck.name} の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    # @deck.destroy
    Deck.find(params[:id]).destroy
    flash[:success] = "Deck #{@deck.name} を削除しました。"
    # redirect_back(fallback_location: root_path)
    redirect_to decks_url
  end
  
  private 
  
  def deck_params
    # params.require(:deck).permit(:name, :text1_language, :text2_language)
    params
      .require(:form_deck)
      .permit(
        Form::Deck::REGISTRABLE_ATTRIBUTES + 
        [flashcards_attributes: Form::Flashcard::REGISTRABLE_ATTRIBUTES]
      )
  end
  
  def correct_user
    @deck = current_user.decks.find_by(id: params[:id])
    unless @deck
      redirect_to root_url
    end
  end
  
  def select_data
    @select_data = [["日本語", "Japanese"], ["英語", "English"], ["フランス語", "French"], ["スペイン語", "Spanish"]]
  end
  
end
