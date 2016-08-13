module SwaggerRackValidation
  module Validator
    module Parameters
      class StringValidator < BaseValidator
        def valid?
          @value.class == String
        end
      end
    end
  end
end
