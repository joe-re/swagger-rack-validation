module SwaggerRackValidation
  module Validator
    module Parameters
      class SchemaValidator < BaseValidator
        def type_valid?
          JSON::Validator.validate!(@params, @value)
        rescue JSON::Schema::ValidationError => e
          @error = e.message
          false
        end
      end
    end
  end
end
