class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :move_to_login_screen, only: [:index, :buy, :submit_order]

  # GET /carts
  # GET /carts.json
  def index
    @items = current_user.cart.items.includes(:cart_items).order("cart_items.id ASC")
    @recommend_items = Item.order("RAND()").limit(4)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart_items = current_cart.cart_items
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update_item
  #   @cart_item.update(quantity: params[:quantity].to_i)
  #   redirect_to current_cart
  # end

  # def delete_item
  #   @cart_item.destroy
  #   redirect_to current_cart
  # end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  
  def destroy
    # 次やるならせめて商品をカートから削除できる機能をつけたかったなぁ・・・ 2018/11/16 安岡
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def buy
    # ここのヘッダーとフッターを消す処理はjsで display:none を読み込ませると良いと思う　2018/11/16 安岡
    @items = current_user.cart.items.includes(:cart_items).order("cart_items.id ASC")
  end

  def submit_order
    @order_item = current_user.cart.items.includes(:cart_items).first

    #購入完了画面でリロードするとエラーになるのでトップページに飛ばす
    redirect_to root_path if @order_item == nil

    current_user.cart.cart_items.destroy_all

    @recommend_items = Item.order("RAND()").limit(4)
    @another_user_items = Item.order("RAND()").limit(5)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    
    # def set_cart
    #   @cart = Cart.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.

    def cart_params
      params.require(:cart).permit(:user_id)
    end

    def move_to_login_screen
      redirect_to new_user_session_path unless user_signed_in?
    end

end
