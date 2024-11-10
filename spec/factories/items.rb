FactoryBot.define do
  factory :item do
    association :user
    item_title {Faker::Lorem.sentence}
    explanation{Faker::Lorem.sentence}
    category_id {2}
    condition_id{2}
    shipping_fee_id{2}
    shipping_source_id{2}
    delivery_day_id{2}
    sells_price{1000}  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
