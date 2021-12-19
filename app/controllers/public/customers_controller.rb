class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
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

end
