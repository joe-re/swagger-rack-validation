module SwaggerRackValidation
  module Validator
    module Parameters
      class LongValidator < BaseValidator
        def valid?
          return false if @value.to_s =~ /\./
          v = Integer(@value)
          v >= - 2**63 && v <= 2**63 - 1
        rescue ArgumentError => e
          @error = e.message
          false
        end
      end
    end
  end
end
