class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end

  end


  private
  def item_params
    params.require(:item).permit(:item_title, :explanation, :category_id, :condition_id,:shipping_fee_id,:shipping_source_id,:delivery_day_id, :sells_price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @item.user_id
  end


end
