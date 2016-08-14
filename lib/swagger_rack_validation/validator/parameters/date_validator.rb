module SwaggerRackValidation
  module Validator
    module Parameters
      class DateValidator < BaseValidator
        def type_valid?
          Date.rfc3339 @value
          true
        rescue TypeError, ArgumentError => e
          @error = e.message
          false
        end
      end
    end
  end
end
