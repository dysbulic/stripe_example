Rails.configuration.stripe = {
        :publishable_key => "pk_test_lx08ICojucE57BHxppeWEBV0",
        :secret_key      => ENV['STRIPE_SECRET_KEY']
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]