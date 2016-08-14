module SwaggerRackValidation
  module Validator
    module Parameters
      class IntegerValidator < BaseValidator
        def type_valid?
          return false if @value.to_s =~ /\./
          v = Integer(@value)
          v >= - 2**31 && v <= 2**31 - 1
        rescue ArgumentError => e
          @error = e.message
          false
        end
      end
    end
  end
end
