module SwaggerRackValidation
  module Validator
    module Parameters
      class BaseValidator
        attr_reader :error
        def initialize(value, params)
          @value = value
          @params = params
          @error = nil
        end

        def valid?
          return false if required? && @value.blank?
          return true if @value.nil?
          type_valid?
        end

        # need implementation on specific type validator
        def type_valid?
          true
        end

        def required?
          !!@params['required']
        end
      end
    end
  end
end
