class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    @cart_item = current_user.cart.cart_items.find_by(product_id: params[:id])
    if @cart_item
      @cart_item.quantity += 1
    else
      @cart_item = current_user.cart.cart_items.new(product_id: params[:id], quantity: 1)
    end
  
    if @cart_item.save
      # If the cart item is saved successfully, redirect the user to their cart page
      redirect_to cart_path(current_user.cart), notice: 'Product added to cart successfully!'
    else
      # If there is an error saving the cart item, redirect the user back to the product page
      redirect_to product_path(params[:id]), alert: 'There was an error adding the product to the cart.'
    end
  end
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:brand_id, :name, :image, :price, :discount, :description, :available)
    end

    def show
      @product = Product.find(params[:id])
      @comment = Comment.new(user: current_user, product: @product)
    end


end
