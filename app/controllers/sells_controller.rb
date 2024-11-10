class SellsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_authorized, only: [:index, :create]

  def index
    if current_user == @item.user
      redirect_to root_path
    end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @sell_address = SellAddress.new
  end

  def new
  end

  def create
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
  

  private
  def sell_params
    params.require(:sell_address).permit(:post_code, :shipping_source_id, :municipality, :block_number, :building_name, :telephone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sells_price,   # 商品の値段
      card: sell_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_not_authorized
    if current_user.id == @item.user_id || @item.sell
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end

end
