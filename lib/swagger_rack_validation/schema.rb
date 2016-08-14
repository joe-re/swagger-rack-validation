module SwaggerRackValidation
  class Schema
    def initialize(hash)
      @hash = hash
    end

    def get(path, method)
      return nil if @hash['paths'].nil?
      schema = @hash['paths'][path.downcase] && @hash['paths'][path.downcase][method.downcase]
      JSONRef.new(schema).expand
    end
  end
end
