class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_set, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def find_set
  @item = Item.find(params[:id])
end

def item_params
  params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                               :delivery_time_id, :price, :image).merge(user_id: current_user.id)
end
