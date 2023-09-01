FactoryBot.define do
  factory :item do
    name               { Faker::Name.initials(number: 2) }
    explanation        { Faker::Lorem.sentence }
    category           { Category.all.sample }
    condition          { Condition.all.sample }
    shipping_charge    { ShippingCharge.all.sample }
    prefecture         { Prefecture.all.sample }
    shipping_day       { ShippingDay.all.sample }
    price              { Faker::Number.within(range: 300..9999999) }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
