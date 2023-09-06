class PurchaseForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building, :telephone_number, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
   
    ShippingInformation.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end