module SwaggerRackValidation
  module Validator
    module Parameters
      class BooleanValidator < BaseValidator
        def valid?
          return true if @value.class == TrueClass || @value.class == FalseClass
          @value == 'true' || @value == 'false'
        end
      end
    end
  end
end
