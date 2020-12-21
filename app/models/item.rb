class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :purchase_record
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 1 }
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
end
