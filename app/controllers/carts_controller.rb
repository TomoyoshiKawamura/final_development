class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  # before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
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

  def add_item
    # if @cart_item.blank?
    #   @cart_item = current_cart.cart_items.build(product_id: params[:product_id])
    # end
  
    # @cart_item.quantity += params[:quantity].to_i
    # @cart_item.save
    # redirect_to current_cart
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
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    
    # def set_cart
    #   @cart = Cart.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def cart_params
    #   params.require(:cart).permit(:user_id)
    # end
    
    # def setup_cart_item!
    #   @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    # end

end
