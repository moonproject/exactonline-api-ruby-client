# frozen_string_literal: true

module Elmas
  class SalesEntryLine < Elmas::BaseEntryLine
    # A sales entry line belongs to a sales entry
    include Elmas::Resource

    def base_path
      "salesentry/SalesEntryLines"
    end

    def mandatory_attributes
      %i[date g_l_account amount_f_c]
    end
  end
end
