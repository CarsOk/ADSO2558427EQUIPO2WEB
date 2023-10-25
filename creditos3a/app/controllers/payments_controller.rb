class PaymentsController < ApplicationController
    require 'mercadopago-sdk'

    def create_preference
        sdk = Mercadopago::SDK.new('TEST-2765199833842446-102501-a0396dc12948c455586ada303adea340-1431064370')
        


        payment_methods_response = sdk.payment_methods.get()
        payment_methods = payment_methods_response[:response]

        preference_data = {
          items: [{
            id: "item-ID-1234",
            title: "producto 1",
            currency_id: "BRL",
            picture_url: "https://www.mercadopago.com/org-img/MP3/home/logomp3.gif",
            description: "Descrição do Item",
            category_id: "mueble",
            quantity: 1,
            unit_price: 75.76
          }],
          payer: {
            name: "João",
            surname: "Silva",
            email: "user@email.com",
            phone: {
              area_code: "11",
              number: "4444-4444"
            },
            identification: {
              type: "CPF",
              number: "19119119100"
            },
            address: {
              street_name: "Street",
              street_number: 123,
              zip_code: "06233200"
            },
          },
          back_urls: {
            success: "https://www.success.com",
            failure: "http://www.failure.com",
            pending: "http://www.pending.com"
          },
          auto_return: "approved",
          payment_methods: {
            excluded_payment_methods: [response],
            excluded_payment_types: [],
            installments: 1
          },
          notification_url: "https://www.your-site.com/ipn",
          statement_descriptor: "MEUNEGOCIO",
          external_reference: "Reference_1234",
          expires: true,
          expiration_date_from: "2016-02-01T12:00:00.000-04:00",
          expiration_date_to: "2016-02-28T12:00:00.000-04:00"
        }
    
        preference_response = sdk.preference.create(preference_data)
        preference = preference_response[:response]
    
        # Este valor sustituirá la cadena "<%= @preference_id %>" en tu HTML
        @preference_id = preference['id']
    end
end
