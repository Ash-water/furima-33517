class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code
    velidates :prefecture_id
    validates :city
    validates :street
    validates :phone_number
    validates :purchase
  end
end
