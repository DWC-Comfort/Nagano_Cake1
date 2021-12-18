# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  before_action :reject_customer, only: [:create]
  
  protected
   def reject_customer
     # Customerテーブルからemailカラムがcustomerのemailマッチした最初のデータを取得する。
     @customer = Customer.find_by(email: params[:customer][:email].downcase)
     if @customer
      # if (@user.valid_password?(params[:user][:password])で、入力されたパスワードが正しいことを確認しています。
      # (@user.active_for_authentication? == false))で、@customerのactive_for_authentication?メソッドがfalseであるかどうかを確認しています。
       if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
         flash[:error] = "退会済みです。"
         redirect_to new_customer_session_path
       end
     else
       flash[:error] = "必須項目を入力してください。"
     end
   end
   
  # 会員がログイン後の遷移先(5ページ)
   def after_sign_in_path_for(resource)
     items_path
   end
   
  # 会員がログアウト後の遷移先（1ページ）
  def after_sign_out_path_for(resource)
    root_path
  end

end
