module SwaggerRackValidation
  class Schema
    def initialize(content_or_path)
      @hash = content_or_path.class == String ? JSON.read(content_or_path) : content_or_path
    end

    def get(path, method)
      return nil if @hash['paths'].nil?
      @hash['paths'][path] && @hash['paths'][path][method]
    end
  end
end
