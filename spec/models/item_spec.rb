require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録できるとき' do
      it 'image、name、explanation、category_id、condition_id、shipping_charge_id、prefecture_id、shipping_day_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
