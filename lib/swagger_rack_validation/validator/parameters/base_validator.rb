module SwaggerRackValidation
  module Validator
    module Parameters
      class BaseValidator
        def initialize(value)
          @value = value
        end

        def valid?
          raise 'need implementation'
        end
      end
    end
  end
end
