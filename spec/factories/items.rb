FactoryBot.define do
  factory :item do
    name                  {'sample'}
    item_description      {'this item has descriptions'}
    category_id           {2}
    quality_id            {2}
    prefecture_id         {2}
    shipping_date_id      {2}
    delivery_fee_id       {2}
    price                 {1500}
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end
  end
end