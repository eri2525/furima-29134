class PurchaseRecordsController < ApplicationController
  def index
  end

  def create
    @user_transaction = UserToransaction.new(transaction_params)
     if @user_transaction.valid?
       @user_transaction.save
       redirect_to action: :index
     else
       render action: :new
     end
  end

  private
  # 全てのストロングパラメーターを1つに統合
 def transaction_params
  params.require(:user_transaction).permit(:user, :item, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase_record)
 end

end