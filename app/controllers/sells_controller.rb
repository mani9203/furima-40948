class SellsController < ApplicationController
  def index
    @item = Item.find(params[:item_id]) 
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @sell_address = SellAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sell_address = SellAddress.new(sell_params)
    if @sell_address.valid?
      pay_item
      @sell_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
  

  def sell_params
    params.require(:sell_address).permit(:post_code, :shipping_source_id, :municipality, :block_number, :building_name, :telephone_number).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sells_price,   # 商品の値段
      card: sell_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
