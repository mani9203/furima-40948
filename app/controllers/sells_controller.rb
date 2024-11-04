class SellsController < ApplicationController
  def index
    @item = Item.find(params[:item_id]) 
    @sell_address = SellAddress.new
  end

  def create
    @item = Item.find(params[:item_id]) 
    @sell_address = SellAddress.new(sell_params)
    if @sell_address.valid?
      @sell_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  

  def sell_params
    params.require(:sell_address).permit(:post_code, :shipping_source_id, :municipality, :block_number, :building_name, :telephone_number ).merge(user_id: current_user.id)
  end

end
