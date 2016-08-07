module SwaggerRackValidation
  module Middleware
    class RequestValidation < Base
      def call(env)
        request = Rack::Request.new(env)
        Validator.call(@schema, request)
        @app.call(request.env)
      rescue SwaggerRackValidation::Error => e
        e.to_rack_response
      end
    end

    class Validator
      def self.call(schema, request)
        new(schema, request).validate
      end

      def initialize(schema, request)
        @schema = schema
        @request = request
      end

      def end_point_definition
        @_end_point_definition ||= @schema.get(@request.path_info, @request.request_method)
      end

      def validate
        return [] unless end_point_definition
        errors = validate_parameters
        raise InvalidParameter.new errors unless errors.empty?
      end

      def body
        return @_body if @_body
        @_body = JSON.parse(@request.body.read)
        @request.body.rewind
        @_body
      end

      def query_params
        @request.params
      end

      def validate_parameters
        end_point_definition['parameters'].each_with_object [] do |v, errors|
          name = v['name']
          params = (@request.get? ? query_params : body)
          value = params[name]
          if v['type'] == 'integer' || v['type'] == 'number'
            if @request.get?
              errors.push "Invalid request. #{v['name']} isn't #{v['type']}." unless /\A\d+\Z/ =~ value
            else
              errors.push "Invalid request. #{v['name']} isn't #{v['type']}." unless value.class == Fixnum
            end
          end
        end
      end
    end
  end
end
