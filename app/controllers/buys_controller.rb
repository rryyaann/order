class BuysController < ApplicationController
  before_action :set_buy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def sales
    @buys = Buy.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @buys = Buy.all.where(buyer: current_user).order("created_at DESC")
  end

  # GET /buys
  # GET /buys.json
  def index
    @buys = Buy.all
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
  end

  # GET /buys/new
  def new
    @buy = Buy.new
    @listing = Listing.find(params[:listing_id])
    
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user

    @buy.listing_id = @listing.id
    @buy.buyer_id = current_user.id
    @buy.seller_id = @seller.id


    respond_to do |format|
      if @buy.save
        format.html { redirect_to root_url, notice: 'Your Order has been placed.' }
        format.json { render action: 'show', status: :created, location: @buy }
      else
        format.html { render action: 'new' }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to @buy, notice: 'Buy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_params
      params.require(:buy).permit(:address, :city, :state)
    end
end
