class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :sell


  validates :item_title, presence: true ,length: { maximum: 140 }
  validates :image, presence: true
  validates :explanation, presence: true,length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_source_id, presence:true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :sells_price, presence: true, numericality: { only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :shipping_fee
  belongs_to :shipping_source

  def sold_out?
    self.sold == 0
  end
end

