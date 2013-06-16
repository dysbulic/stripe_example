class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    params[:payment][:user] = nil if params[:payment][:user] == ""

    charge_info = {
      amount:      (params[:payment][:amount].to_f * 100).to_i,
      description: 'Stripe Example Charge',
      currency:    'usd'
    }

    if current_user
      if current_user.stripe_customer_token
        customer = Stripe::Customer.retrieve(current_user.stripe_customer_token)
      else
        customer = Stripe::Customer.create(
            :email => current_user.email,
            :card  => params[:payment][:stripe_token]
        )
        current_user.update_attribute(:stripe_customer_token, customer.id)
      end
      
      charge = Stripe::Charge.create( charge_info.merge({ customer: customer.id }) )

      params[:payment][:user] = current_user
    else
      charge = Stripe::Charge.create( charge_info.merge({ card: params[:payment][:stripe_token] }) )
    end
    params[:payment][:stripe_token] = charge.id
    @payment = Payment.new(params[:payment])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end
end
