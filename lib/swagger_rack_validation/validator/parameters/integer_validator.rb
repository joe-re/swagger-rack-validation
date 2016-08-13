module SwaggerRackValidation
  module Validator
    module Parameters
      class IntegerValidator < BaseValidator
        def valid?
          return false unless @value.to_s =~ /\A-?\d+\Z/
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
