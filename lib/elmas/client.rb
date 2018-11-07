# frozen_string_literal: true

require "faraday"

module Elmas
  class Client < API
    def connection
      Faraday.new(proxy: proxy) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
