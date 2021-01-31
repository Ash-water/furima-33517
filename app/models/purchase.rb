class Purchase < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :user
    validates :item
  end

  
end
