require "test_helper"

class OrderStatusTest < ActiveSupport::TestCase
  def order_status
    @order_status ||= OrderStatus.new
  end

  def test_valid
    assert order_status.valid?
  end
end
