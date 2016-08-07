module SwaggerRackValidation
  class Schema
    def initialize(hash)
      @hash = hash
    end

    def get(path, method)
      return nil if @hash['paths'].nil?
      @hash['paths'][path.downcase] && @hash['paths'][path.downcase][method.downcase]
    end
  end
end
