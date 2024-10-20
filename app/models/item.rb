class Item < ApplicationRecord
  belongs_to :user
  has_one :sell
  has_one_attached :image

  validates :item_title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_source_id, presence:true
  validates :delivery_day_id, presence: true
  validates :sells_price, presence: true
end
