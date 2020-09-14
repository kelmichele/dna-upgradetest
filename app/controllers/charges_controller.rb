class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = 17900

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'At Home DNA Test',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path

	else
	  redirect_to thanks_path
	end
end
