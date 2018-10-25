# frozen_string_literal: true

module Elmas
  class DirectDebitMandate
    # An account needs a name
    include Elmas::Resource

    def base_path
      "cashflow/DirectDebitMandates"
    end

    def mandatory_attributes
      %i[account bank_account]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowDirectDebitMandates
    def other_attributes
      %i[description main payment_type reference signature_date type first_send]
    end
  end
end
