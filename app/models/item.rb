class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :delivery_time

  validates :name, :description, :category_id, :conditon_id, :delivery_fee_id, :prefecture_id, :delivery_fee_id, :price, presence: true

  validates :category_id, :conditon_id, :delivery_fee_id, :prefecture_id, :delivery_fee_id, numericality: { other_than: 1 }
end
