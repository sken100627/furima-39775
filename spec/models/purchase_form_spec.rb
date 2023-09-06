require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @purchase_form.post_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが(-)なしだと保存できないこと' do
        @purchase_form.post_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchase_form.prefecture_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idに「---」が選択されている場合は保存できないこと' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_form.municipality = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @purchase_form.street_address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_form.telephone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberに(-)がある場合は保存できないこと' do
        @purchase_form.telephone_number = '090-1234-5678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Telephone number is invalid')
      end
    end
  end
end
