class Public::ReceiversController < ApplicationController


  def index
    @receiver = Receiver.new
    @receivers = Receiver.all
  end
  
  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.customer_id = current_customer.id
    if @receiver.save
      redirect_to request.referrer || root_path, notice: "You have created receiver successfully."
    else
      @receivers = Receiver.all
      render 'index'
    end
  end
  
  def edit
    @receiver = Receiver.find(params[:id])
  end
  
  def update
    @receiver = Receiver.find(params[:id])
    if @receiver.update(receiver_params)
      redirect_to receivers_path, notice: "You have updated receiver successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @receiver = Receiver.find(params[:id])
    @receiver.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def receiver_params
    params.require(:receiver).permit(:customer_id, :name, :postal_code, :address)
  end

end
