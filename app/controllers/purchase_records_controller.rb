class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_transaction = UserTransaction.new
  end

  def new
    @user_transaction = UserTransaction.new
  end

  def create
    @user_transaction = UserTransaction.new(transaction_params)
     if @user_transaction.valid?
       @user_transaction.save
       redirect_to action: :index
     else
       render action: :new
     end
  end

  def show
    @item = Item.find(params[:item_id])
  end

  private
  # 全てのストロングパラメーターを1つに統合
 def transaction_params
  params.require(:user_transaction).permit(:postal_code, :prefecture_id, :municipality, :address, :building,
                 :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_record_id: params[:purchase_record_id] )
 end

end