require 'rails_helper'

RSpec.describe SellAddress, type: :model do
  before do
    @sell_address = FactoryBot.build(:sell_address)
  end

  describe '商品購入'

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@sell_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須であること' do
        @sell_address.post_code = ''
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include "Post code can't be blank"
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @sell_address.post_code = '123-123４'
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が必須であること' do
        @sell_address.shipping_source_id = 1
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include "Shipping source select"
      end

      it '市町村区が必須であること' do
        @sell_address.municipality = ''
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include "Municipality can't be blank"
      end

      it '番地が必須であること' do
        @sell_address.block_number = ''
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include("Block number can't be blank")
      end

      it '建物名が空でも保存できること' do
        @sell_address.building_name = ''
        expect(@sell_address).to be_valid
      end

      it '建物名は任意であること' do
        @sell_address.building_name = 'ビル名'
        expect(@sell_address).to be_valid
      end

      it '電話番号が必須であること' do
        @sell_address.telephone_number = ''
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が9桁以下では保存できないこと' do
        @sell_address.telephone_number = '012345678'
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include("Telephone number Input only number.is invalid")
      end

      it '電話番号が12桁以上では保存できないこと' do
        @sell_address.telephone_number = '012345678901'
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include("Telephone number Input only number.is invalid")
      end
      it '電話番号に数字以外が含まれている場合は保存できないこと' do
        @sell_address.telephone_number = '01234abc890'
        @sell_address.valid?
        expect(@sell_address.errors.full_messages).to include("Telephone number Input only number.is invalid")
      end
    end
end
