class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
    render 'new'
    end
  end

  private
  
  def item_params
    params.require(:item).permit(
      :image, :name, :item_description, :category_id, :prefecture_id, :quality_id, :shipping_date_id, :delivery_fee_id, :price
    ).merge(user_id: current_user.id)
  end
end
