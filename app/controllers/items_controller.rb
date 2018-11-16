class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_login_screen, only: [:add_item]
  before_action :secret_word, only: [:search]

  # GET /items
  # GET /items.json
  def index
    @items1 = Item.find(Item.pluck(:id).shuffle[0..2])
    @items2 = Item.find(Item.pluck(:id).shuffle[0..2])
    @items3 = Item.find(Item.pluck(:id).shuffle[0..2])
    @items4 = Item.find(Item.pluck(:id).shuffle[0..2])
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @item_images = @item.item_images.includes(:item)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    return redirect_to root_path if params[:keyword] == "" # キーワードが入力されていないとトップページに飛ぶ

    keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
    negative_keywords, positive_keywords = 
    keywords.partition {|keyword| keyword.start_with?("-") }

    #AND検索
    @items = Item.where("name LIKE ?", "%#{positive_keywords.first}%")

    positive_keywords.each do |keyword|
      @items = @items.where("name LIKE ?", "%#{keyword}%")
    end

    return @items = Item.none.page(params[:page]).per(25) if positive_keywords.empty? # -だけで検索すると結果を表示しないように
    #AND検索ここまで

    #OR検索
    # @items = Item.none 
    
    # positive_keywords.each do |keyword|
    #   @items = @items.or(Item.where("name LIKE ?", "%#{keyword}%"))
    # end
    #OR検索ここまで

    negative_keywords.each {|word| word.slice!(/^-/) }

    negative_keywords.each do |keyword|
      next if keyword.blank?
      @items = @items.where.not("name LIKE ?", "%#{keyword}%")
    end

    @items = @items.page(params[:page]).per(25) #kaminariによるページネーションを指定
  end

  def add_item
    CartItem.create(cart_id: current_user.cart.id, item_id: params[:id])
    @recommend_items = Item.order("RAND()").limit(4)
    @items = current_user.cart.items.includes(:cart_items)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :company, :explanation)
    end

    def move_to_login_screen
      redirect_to new_user_session_path unless user_signed_in?
    end

    def secret_word # 隠しコマンド
      word = params[:keyword]
      redirect_to 'https://di-v.co.jp/' if word == 'div'
      redirect_to 'http://www.kochike.pref.kochi.lg.jp/~top/' if word == '高知家'
      redirect_to 'https://gurutabi.gnavi.co.jp/a/a_2534/' if word == '柏島'
      redirect_to 'https://hirome.co.jp/' if word == 'ひろめ市場'
    end

end
