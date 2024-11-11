class SellAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :shipping_source_id, :municipality, :block_number, :building_name, :telephone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_source_id,  numericality: { other_than: 1 , message: "select" }
    validates :municipality 
    validates :block_number
    validates :telephone_number,format: { with: /\A\d{10,11}\z/,message: "Input only number.is invalid"}
    validates :token
  end

  def save
    sell = Sell.create(user_id: user_id, item_id: item_id)
  
      Address.create(
        post_code: post_code,
        shipping_source_id: shipping_source_id,
        municipality: municipality,
        block_number: block_number,
        building_name: building_name,
        telephone_number: telephone_number,
        sell_id: sell.id
      )
  end
end