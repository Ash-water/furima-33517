FactoryBot.define do
  factory :purchase_form do
      postal_code    {'123-4567'}
      prefecture_id  {'2'}
      city           {'Tokyo'}
      street         {'street1'}
      building_name  {'building1'}
      phone_number   {"09011112222"}
      token          {"tok_abcdefghijk00000000000000000"}
  end
end