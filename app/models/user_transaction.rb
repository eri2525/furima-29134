class UserTransaction
  include ActiveModel::Model
  attr_acccessor :user, :item, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase_record

  with_options presence: true do
    validates :user, :item, :municipality, :address
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, exclusion: { in: %w(-) },
                             format: {with: /\A[0-9０-９]+\z/ }
                             length: { maximum: 11 }
    validates :prefecture_id { other_than: 1 }
  end

  def save
    user = PurchaseRecord.create(user: user, item: item)
    Address.create(postal_code: postal_code, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_record: purchase_record)
  end
end