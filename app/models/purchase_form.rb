class PurchaseForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building, :telephone_number, :user_id, :item_id,
                :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true }
    validates :user_id
    validates :item_id
    validates :token, presence: true
  end

  def save
    order = Order.create(user_id:, item_id:)

    ShippingInformation.create(post_code:, prefecture_id:, municipality:,
                               street_address:, building:, telephone_number:, order_id: order.id)
  end
end
