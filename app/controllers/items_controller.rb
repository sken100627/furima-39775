class ItemsController < ApplicationController
  before_action :move_to_user_session, except: :index

  def index
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

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:condition_id,:shipping_charge_id,:prefecture_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end

  def move_to_user_session
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
