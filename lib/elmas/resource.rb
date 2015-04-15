require File.expand_path('../utils', __FILE__)
require File.expand_path('../exception', __FILE__)

module Elmas
  module Resource
    STANDARD_FILTERS = [:id]

    attr_accessor :attributes
    attr_accessor :id
    attr_accessor :url

    def initialize(attributes = {})
      @attributes = attributes
      @filters = STANDARD_FILTERS
    end

    def id
      (attributes[:id] ||= nil)
    end

    def id=(value)
      attributes[:id] = value
    end

    def base_path
      Utils.collection_path self.class.name
    end

    def url
      apply_filters(base_path)
    end

    def find_all
      find(base_path)
    end

    def find(url = self.url)
      puts url
      begin
        @response = Response.create(Elmas.get(url))
      rescue
        puts "I dunno what went wrong"
      end
    end

    def find_by(filters)
      @filters = filters
      find
    end

    def save
      attributes_to_submit = self.sanitize
      begin
        @response = Response.create(Elmas.post(url, attributes_to_submit))
      rescue
        #log error somehow
      end

      response
    end

    def sanitize
      to_submit = {}
      @attributes.each do |key, value|
        if value.is_a? Elmas::Resource #Turn relation into ID
          to_submit["#{key}_#{id}"] = value.id
        else
          to_submit[key] = value
        end
      end
      to_submit
    end

    def response
      @response
    end

    #?$filter=ID eq guid'#{id}'
    def id_filter(sign)
      "#{sign}$filter=ID eq guid'#{id}'"
    end

    def base_filter(sign, attribute)
      if attribute == :id
        id_filter(sign)
      else
        "#{sign}$filter=#{attribute.to_s} eq '#{@attributes[attribute]}'"
      end
    end

    def apply_filters(path)
      @filters.each_with_index do |filter, index|
       path += base_filter(sign(index), filter)
      end
      path
    end

    def sign(index)
      if index == 0
        "?"
      else
        "&"
      end
    end
  end
end
