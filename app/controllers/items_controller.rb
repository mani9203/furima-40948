class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:item_title, :explanation, :category_id, :condition_id,:shipping_fee_id,:shipping_source_id,:delivery_day_id, :sells_price,:image).merge(user_id: current_user.id)
  end

end
