class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :purchase_regulations
  before_action :sold_myself
  before_action :set_order

  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(order_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:purchase_form).permit(:post_code, :prefecture_id, :municipality, :street_address, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_regulations
    @item = Item.find(params[:item_id])
    return unless @item.order.present?

    redirect_to root_path
  end

  def sold_myself
    return unless current_user.id == @item.user.id

    redirect_to root_path
  end

  def set_order
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

end
