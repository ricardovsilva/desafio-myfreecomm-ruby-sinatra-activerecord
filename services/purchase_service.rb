require_relative '../models/customer'
require_relative '../models/product'
require_relative '../models/merchant'
require_relative '../models/purchase'

class PurchaseService
  def add_from_file(file)
    file.each_with_index do |line, index|
      next if index.zero? or line.nil? or line.strip.empty?

      customer = Customer.find_or_create_by(name: get_from(line, :customer_name))
      merchant = Merchant.find_or_create_by(name: get_from(line, :merchant_name)) do |new_merchant|
        new_merchant.address = get_from(line, :merchant_address)
      end

      product = Product.find_or_create_by(description: get_from(line, :product_description)) do |new_product|
        new_product.price = get_from(line, :product_price)
      end

      purchase = Purchase.new(
        customer_id: customer.id,
        product_id: product.id,
        merchant_id: merchant.id,
        quantity: get_from(line, :quantity)
      )

      purchase.save
    end
  end

  def get_consolidated_data
    purchases = Purchase.includes(:product).all.to_a
    data = {
      total: purchases.map {|p| p.product.price * p.quantity}.sum.to_f,
      first_purchase_date: purchases.first.created_at,
      last_purchase_date: purchases.last.created_at
    }
  end

  private
  def get_from(line, index_name)
    line_indexes = {
      customer_name: 0,
      product_description: 1,
      product_price: 2,
      quantity: 3,
      merchant_address: 4,
      merchant_name: 5 
    }

    line.force_encoding(Encoding::UTF_8)
    line.split("\t").map(&:strip)[line_indexes[index_name]]
  end
end