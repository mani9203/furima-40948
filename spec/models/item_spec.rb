require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it '必要な情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it '商品画像がだと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.item_title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item title can't be blank"
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品状態が空では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担が空では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it '発送元が空では出品できない' do
        @item.shipping_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping source can't be blank"
      end
      it '発送までの日数が空では出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it '価格が空では出品できない' do
        @item.sells_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Sells price can't be blank"
      end
      it '価格が半角数値以外では出品できない' do
        @item.sells_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Sells price can't be blank"
      end
      it '価格が300未満の値では保存できないこと' do
        @item.sells_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sells price must be greater than or equal to 300"
      end
      it '価格が10000000以上の値では保存できないこと' do
        @item.sells_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Sells price must be less than or equal to 9999999")
      end
    end
  end
end




