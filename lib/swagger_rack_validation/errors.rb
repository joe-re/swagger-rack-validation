module SwaggerRackValidation
  class Error < StandardError
  end

  class BadRequest < Error
  end

  class InvalidRequest < Error
  end

  class InvalidResponse < Error
  end

  class NotFound < Error
  end

  class ReferenceNotFound < Error
  end
end
