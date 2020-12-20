class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_one :purchase_record
  has_one_attached :image
  belongs_to :user

  validates :name, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, :price, presence: true

  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 1 }
end
