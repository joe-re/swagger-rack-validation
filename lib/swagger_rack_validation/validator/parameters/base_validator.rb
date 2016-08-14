module SwaggerRackValidation
  module Validator
    module Parameters
      class BaseValidator
        attr_reader :error
        def initialize(value, params)
          @value = value
          @params = params
          @error = nil
        end

        def valid?
          raise 'need implementation'
        end
      end
    end
  end
end
