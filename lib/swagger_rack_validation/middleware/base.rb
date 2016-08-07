module SwaggerRackValidation
  module Middleware
    class Base
      def initialize(app, options = {})
        @app = app
        schema = options[:schema] || raise('need option `schema`')
        @schema = SwaggerRackValidation::Schema.new(schema)
      end

      def call(_env)
        raise 'need implementation'
      end
    end
  end
end
