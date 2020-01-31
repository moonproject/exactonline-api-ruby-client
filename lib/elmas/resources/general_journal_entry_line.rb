# frozen_string_literal: true

module Elmas
  class GeneralJournalEntryLine < Elmas::BaseEntryLine
    include Elmas::Resource

    def base_path
      "generaljournalentry/GeneralJournalEntryLines"
    end

    def mandatory_attributes
      %i[date g_l_account amount_f_c]
    end

    def other_attributes
      %i[account v_a_t_type]
    end
  end
end
