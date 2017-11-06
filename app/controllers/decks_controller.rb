class DecksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :select_data, only: [:new, :edit]
  
  def index
    @decks = Deck.where.not(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(10)
  end
  
  def show
    @deck = Deck.find(params[:id])
    @flashcards = @deck.flashcards.order('created_at ASC')
    
    @images = []
    
    @text = params[:text]
    flash_id = params[:flashcard]
    @flashcard = Flashcard.find_by(id: flash_id)
    # p @flashcard
    # p "#{flash_id}＠＠＠＠＠flashcardテスト＠＠＠＠＠"
    # p "#{@text}＠＠＠＠テスト＠＠＠＠"
    if @text
      results = flickr.photos.search(text: @text, sort: "relevance", per_page: 12)
      
      results.each do |result|
        image = getFlickrImageURL(result, "q")
        @images << image
      end
    end
    p "#{@images}＠＠＠＠テスト＠＠＠＠"
  end
  
  def new
    @deck = Form::Deck.new
  end
  
  def create
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
    @deck = Form::Deck.find(params[:id])
  end
  
  def update
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
    Deck.find(params[:id]).destroy
    flash[:success] = "Deck #{@deck.name} を削除しました。"
    redirect_to current_user
  end
  
  def copy
    @deck = Deck.find(params[:id])
#    new_deck = @deck.clone
    new_deck = Deck.new
    new_deck.name = @deck.name
    new_deck.text1_language = @deck.text1_language
    new_deck.text2_language = @deck.text2_language
    new_deck.user_id = current_user.id
    new_deck.save
    
    @deck.flashcards.each do |element|
       new_flash = new_deck.flashcards.build
       new_flash.text1 = element.text1
       new_flash.text2 = element.text2
       new_flash.image = element.image
       new_flash.deck_id = new_deck.id
       new_flash.save
    end
    
    flash[:success] = "Deck #{@deck.name} をコピーしました"
    redirect_to current_user
  end
  
  private 
  
  def deck_params
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
    @select_data = [ 
      # :English, :Japanese, :French, :Spanish, :Portuguese, :Italian, :German, :Chinese, :Korean,
      ["English(US)", :EnglishUS], 
      ["English(UK)", :EnglishUK], 
      ["Arabic", :Arabic], 
      ["Chinese", :Chinese], 
      ["Czech", :Czech], 
      ["Danish", :Danish], 
      ["Dutch", :Dutch], 
      ["Finnish", :Finnish], 
      ["French(FR)", :FrenchFR], 
      ["French(CA)", :FrenchCA], 
      ["German", :German], 
      ["Greek", :Greek], 
      ["Hindi", :Hindi], 
      ["Hungarian", :Hungarian], 
      ["Indonesian", :Indonesian], 
      ["Italian", :Italian], 
      ["Japanese", :Japanese], 
      ["Korean", :Korean], 
      ["Norwegian", :Norwegian], 
      ["Polish", :Polish], 
      ["Portuguese(PT)", :PortuguesePT], 
      ["Portuguese(BR)", :PortugueseBR], 
      ["Romanian", :Romanian], 
      ["Russian", :Russian], 
      ["Slovakian", :Slovakian], 
      ["Spanish(ES)", :SpanishES], 
      ["Spanish(US)", :SpanishUS], 
      ["Swedish", :Swedish], 
      ["Thai", :Thai], 
      ["Turkish", :Turkish], 
    ]
  end
  
  def getFlickrImageURL(photo, size) 
    # photoオブジェクトから画像のURLを作成して返す
    url = "https://farm" + photo.farm.to_s + ".staticflickr.com/" + photo.server.to_s + "/" + photo.id.to_s + "_" + photo.secret.to_s
    if (size)   # サイズ指定ありの場合
      url += "_" + size.to_s
    end
    url += ".jpg"
    return url
  end
  
end
