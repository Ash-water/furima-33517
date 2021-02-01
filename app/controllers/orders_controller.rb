class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = PurchaseForm.new(purchase_form_params)
    if @purchase.valid?
      @purchase.save
    else
      render "orders#index"
    end

  end

  private

  def purchase_form_params
    params.require(:purchase_form).parmit()
  end
end
