$( function() {
    $('#card-number').payment('formatCardNumber')

    $(document).on('click', "#new_payment [name='commit']", function( event ) {
	event.preventDefault()
        var card = {
            number:   $("#card-number").val(),
            expMonth: $("#exp-month").val(),
            expYear:  $("#exp-year").val(),
            cvc:      $("#cvc").val()
        }

        Stripe.createToken(card, function( status, response ) {
            if (status === 200) {
                $("[name='payment[stripe_token]']").val(response.id)
                $("#new_payment").submit()
            } else {
                $("#stripe-error-message").text(response.error.message)
                $("#credit-card-errors").show()
                $("#user_submit").attr("disabled", false)
            }
        } )
    } )
} )
