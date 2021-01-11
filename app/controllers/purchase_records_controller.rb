class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_transaction = UserTransaction.new
  end

  def new
    @user_transaction = UserTransaction.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_transaction = UserTransaction.new(transaction_params)
     if @user_transaction.valid?
      pay_item
       @user_transaction.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  def show
    @item = Item.find(params[:item_id])
  end

  private
  # 全てのストロングパラメーターを1つに統合
 def transaction_params
  params.require(:user_transaction).permit(:postal_code, :prefecture_id, :municipality, :address, :building,
                 :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end
 
 def pay_item
  Payjp.api_key ="sk_test_cc067c3cccdaa1abd1c57169"
  Payjp::Charge.create(
    amount: @item.price,
    card: transaction_params[:token],
    currency: 'jpy'
  )
end
end