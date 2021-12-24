class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_path
      flash[:notice] = "変更内容を保存しました。"
    else
      flash.now[:alert] = "全ての項目が必須入力です。"
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueにupdateする
    @customer.update(is_deleted: true)
    # ログアウトする
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
