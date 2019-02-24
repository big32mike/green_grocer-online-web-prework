require 'pry'

def consolidate_cart(cart_array)
	sorted_hash = {}
	cart_array.each do |item_hash|
		item_hash.each do |key, val_hash|
			if sorted_hash[key]
				sorted_hash[key][:count] += 1
			else
				sorted_hash[key] = val_hash
				sorted_hash[key][:count] = 1
			end
		end
	end
	sorted_hash
end

def apply_coupons(cart, coupon_arr)
	coupon_arr.each do |coupon|
		if cart[coupon[:item]]
			#binding.pry
			if coupon[:num] == cart[coupon[:item]][:count]
				cart["#{coupon[:item]} W/COUPON"] = {
 					price: coupon[:cost], 
					clearance: cart[coupon[:item]][:clearance],
					count: 1
				}
				cart[coupon[:item]][:count] = 0
				#binding.pry
			elsif coupon[:num] < cart[coupon[:item]][:count]
				cart["#{coupon[:item]} W/COUPON"] = {
 					price: coupon[:cost], 
					clearance: cart[coupon[:item]][:clearance],
					count: 1
				}
				#binding.pry
				cart[coupon[:item]][:count] -= coupon[:num]
			end
		end
	end
  cart
end

def apply_clearance(cart)
	cart.each do |item, hash|
		#binding.pry
		if hash[:clearance]
			hash[:price] = (0.8 * hash[:price]).round(2)
		end
	end
  cart
end

def checkout(cart, coupons)
  # code here
end
