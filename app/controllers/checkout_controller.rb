class CheckoutController < ApplicationController
  def create

    # Support checking out a single cat (params[:item_id]) or multiple cats stored in session[:cart]
    items = []
    puts params

    for thing in current_user.carted_cats do
      items << thing
    end

    if items.blank?
      redirect_to root_path, alert: 'No items to checkout' and return
    end

    line_items = items.map do |item|
      {
        price_data: {
          currency: 'eur',
          product_data: { name: item.name },
          unit_amount: (item.price_cents || 0)
        },
        quantity: 1
      }
    end

    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      mode: 'payment',
      success_url: success_url + "?success=true",
      cancel_url: root_url + "?canceled=true"
    )

    redirect_to stripe_session.url, allow_other_host: true
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: 'Item not found'
    rescue Stripe::StripeError => e
      Rails.logger.error("Stripe error: #{e.message}")
      redirect_to root_path, alert: "Payment error: #{e.message}"
      return
    end

end