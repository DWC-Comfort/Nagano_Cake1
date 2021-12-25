class Public::ReceiversController < ApplicationController


  def index
    @receiver = Receiver.new
    @receivers = Receiver.all.page(params[:page]).per(5)
  end

  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.customer_id = current_customer.id
    if @receiver.save
      redirect_to request.referer, notice: "配送先の登録に成功しました"
    else
      @receivers = Receiver.all.page(params[:page]).per(8)
      flash.now[:alert] = "配送先の登録に失敗しました"
      render 'index'
    end
  end

  def edit
    @receiver = Receiver.find(params[:id])
  end

  def update
    @receiver = Receiver.find(params[:id])
    if @receiver.update(receiver_params)
      redirect_to receivers_path, notice: "配送先の更新に成功しました"
    else
      flash.now[:alert] = "配送先の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @receiver = Receiver.find(params[:id])
    if @receiver.destroy
      redirect_to request.referer, notice: "配送先を削除しました"
    end
  end

  private

  def receiver_params
    params.require(:receiver).permit(:customer_id, :name, :postal_code, :address)
  end

end
