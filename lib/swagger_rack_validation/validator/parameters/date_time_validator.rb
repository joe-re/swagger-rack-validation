module SwaggerRackValidation
  module Validator
    module Parameters
      class DateTimeValidator < BaseValidator
        def type_valid?
          DateTime.rfc3339 @value
          true
        rescue TypeError, ArgumentError => e
          @error = e.message
          false
        end
      end
    end
  end
end
