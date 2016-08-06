module SwaggerRackValidation
  class Validaror
    def initialize(schema, path, request_params)
      @schema = schema
      @path = path
      @request_params = request_params
    end

    def valid?
    end

    private

    def valid_type?
    end

    def valid_format?
    end
  end
end
