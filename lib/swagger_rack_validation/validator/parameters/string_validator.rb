module SwaggerRackValidation
  module Validator
    module Parameters
      class StringValidator < BaseValidator
        def type_valid?
          @value.class == String
        end
      end
    end
  end
end
