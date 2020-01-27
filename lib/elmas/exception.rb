# frozen_string_literal: true

module Elmas
  class BadRequestException < StandardError
    attr_accessor :response, :parsed

    def initialize(response, parsed)
      @response = response
      @parsed = parsed
      super(message)
    end

    def message
      "code #{@response.status}: #{@parsed.error_message}"
    end
  end

  class UnauthorizedException < StandardError; end
end
