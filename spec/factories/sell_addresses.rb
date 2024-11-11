FactoryBot.define do
  factory :sell_address do
    post_code {'123-4567'}
    shipping_source_id {3}
    municipality {'富山市'}
    block_number {'大山1-1'}
    building_name { '青山ビル' }
    telephone_number {'09088889999'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
