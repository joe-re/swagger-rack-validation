module SwaggerRackValidation
  module Validator
    module Parameters
      class FloatValidator < BaseValidator
        def valid?
          Float(@value)
          true
        rescue ArgumentError => e
          @error = e.message
          false
        end
      end
    end
  end
end
