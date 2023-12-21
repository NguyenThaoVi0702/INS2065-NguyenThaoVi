class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  after_save :update_cart_subtotal
  after_destroy :update_cart_subtotal

  private

  def update_cart_subtotal
    self.cart.update(subtotal: self.cart.cart_items.sum { |item| item.product.price * item.quantity })
  end
end
