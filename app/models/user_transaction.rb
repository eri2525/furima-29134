class UserTransaction
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :municipality, :address, :user_id, :item_id, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, exclusion: { in: %w(-) },
                             format: { with: /\A[0-9]{11}\z/ },
                             length: { maximum: 11 }
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end