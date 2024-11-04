class SellAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_source_id, :municipality, :block_number, :building_name, :telephone_number, :sell

  with_options presence: true do
    validates :shipping_source_id,  numericality: { other_than: 1 , message: "can't be blank" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
    validates :block_number
    validates :telephone_number,format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :sell
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :item_id
    validates :user_id
    validates :building_name
  end

  def save
    sell = Sell.create( user_id: user_id, item_id: item_id)
    Address.create(sell_id: sell.id , postal_code: postal_code, shipping_source_id: shipping_source_id, municipality: municipality, block_number: block_number, building_name: building_name,telephone_number: telephone_number, sell_id: sell.id)
  end
end