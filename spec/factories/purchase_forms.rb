FactoryBot.define do
  factory :purchase_form do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '川崎市' }
    street_address { '川崎区 1-1' }
    building { 'サニーハイツ' }
    telephone_number { '0120333906' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
