class Book < ApplicationRecord
  belongs_to :author

  validates :name, presence: true, length: { maximum: 30 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**4) },
                    format: { with: /\A\d{1,4}(\.\d{1,2})?\z/ }
end
