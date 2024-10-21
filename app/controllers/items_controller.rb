class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.includes(:user)
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item, :image).permit(:item_title, :user, :explanation, :category_id, :condition_id,:shipping_fee_id,:shipping_source_id,:delivery_day_id, :sells_price).merge(user_id: current_user.id)
  end

end
