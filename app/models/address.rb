class Address < ApplicationRecord
  belongs_to:sell


  #with_options presence: true do
    #validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    #validates :shipping_source_id,  numericality: { other_than: 1 , message: "can't be blank" }
    #validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    #validates :block_number
    #validates :telephone_number,format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    #validates :sell
  #end
  #validates :building_name
end
