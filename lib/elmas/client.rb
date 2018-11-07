# frozen_string_literal: true

require "faraday"

module Elmas
  class Client < API
    def connection
      Faraday.new do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.proxy proxy if proxy
      end
    end
  end
end
