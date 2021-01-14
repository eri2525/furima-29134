require 'rails_helper'
RSpec.describe UserTransaction, type: :model do
  before do
    @user_transaction = FactoryBot.build(:user_transaction)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it 'postal_codeとprefecture_idとmunicipalityとaddressとphone_numberとuser_idとitem_idとtokenがあれば商品の購入ができる' do
        expect(@user_transaction).to be_valid
      end
      it 'postal_codeにハイフンがあれば商品の購入ができる' do
        @user_transaction.postal_code = '123-4567'
        expect(@user_transaction).to be_valid
      end
      it 'phone_numberが11桁以内であれば商品の購入ができる' do
        @user_transaction.phone_number = 11_122_223_333
        expect(@user_transaction).to be_valid
      end
      it 'phone_numberにハイフンがなければ商品の購入ができる' do
        @user_transaction.phone_number = 11_122_223_333
        expect(@user_transaction).to be_valid
      end
    end
    context '商品の購入ができない場合' do
      it 'postal_codeがなければ商品の出品ができない' do
        @user_transaction.postal_code = ''
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idがなければ商品の購入ができない' do
        @user_transaction.prefecture_id = ''
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityがなければ商品の購入ができない' do
        @user_transaction.municipality = ''
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressがなければ商品の購入ができない' do
        @user_transaction.address = ''
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberがなければ商品の購入ができない' do
        @user_transaction.phone_number = ''
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenがなければ商品の購入ができない' do
        @user_transaction.token = ''
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeにハイフンがない時は商品の購入ができない' do
        @user_transaction.postal_code = 1_112_222
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが11桁以上であれば商品の購入ができない' do
        @user_transaction.phone_number = '111222233334'
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberにハイフンがある時は商品の購入ができない' do
        @user_transaction.phone_number = 111 - 2222 - 3333
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include('Phone number is invalid')
      end
      it 'prefecture_idのidが1の時は商品の購入ができない' do
        @user_transaction.prefecture_id = 1
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include('Prefecture Select')
      end
      it 'ユーザーが紐付いていないと商品の出品ができない' do
        @user_transaction.user_id = nil
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐付いていないと商品の出品ができない' do
        @user_transaction.item_id = nil
        @user_transaction.valid?
        expect(@user_transaction.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
