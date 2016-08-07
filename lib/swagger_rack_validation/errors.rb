module SwaggerRackValidation
  class Error < StandardError
    # @return [Array] Rack response
    def to_rack_response
      [status, headers, [body]]
    end

    private

    def status
      500
    end

    def id
      'internal_server_error'
    end

    def headers
      { 'Content-Type' => 'application/json; charset=utf-8' }
    end

    def body
      JSON.pretty_generate(id: id, message: message) + "\n"
    end
  end

  class BadRequest < Error
    def status
      400
    end

    def id
      'bad_request'
    end
  end

  class InvalidRequest < Error
    def status
      400
    end

    def id
      'invalid_request'
    end
  end

  class InvalidParameter < Error
    def status
      400
    end

    def id
      'invalid_parameter'
    end
  end

  class InvalidResponse < Error
    def status
      500
    end

    def id
      'invalid_response'
    end
  end

  class NotFound < Error
    def status
      404
    end

    def id
      'not_found'
    end
  end

  class ReferenceNotFound < Error
    def status
      500
    end

    def id
      'reference_not_found'
    end
  end
end
