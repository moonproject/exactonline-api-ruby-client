module Elmas
  class Address
    # An account needs a name
    include Elmas::Resource

    def base_path
      "crm/Addresses"
    end

    def mandatory_attributes
      [:type]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAddresses
    def other_attributes # rubocop:disable Metrics/MethodLength
      [
        :account, :account_is_supplier, :account_name,
        :address_line1, :address_line2, :address_line3, 
        :city, :contact, :contact_name, 
        :country, :country_name, :created, 
        :creator, :creator_full_name, :division, :fax,
        :mailbox, :main, :modified, :modifier, :modifier_full_name, 
        :nic_number, :notes, :phone, :phone_extension, :postcode,
        :state, :state_description, :type, 
        :warehouse, :warehouse_code, :warehouse_description
      ]
    end
  end
end
