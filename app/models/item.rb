class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image, unless: :was_attached?
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              allow_blank: true }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end

  def was_attached?
    image.attached?
  end
end
