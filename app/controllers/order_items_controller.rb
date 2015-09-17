class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    order_items
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    order_items
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_items
    @order ||= current_order
    @order_item ||= @order.order_items.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
