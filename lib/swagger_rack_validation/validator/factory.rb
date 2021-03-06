module SwaggerRackValidation
  module Validator
    module CommonTypes
      INTEGER = 'integer'.freeze
      LONG = 'long'.freeze
      FLOAT = 'float'.freeze
      DOUBLE = 'double'.freeze
      STRING = 'string'.freeze
      BYTE = 'byte'.freeze
      BINARY = 'binary'.freeze
      BOOLEAN = 'boolean'.freeze
      DATE = 'date'.freeze
      DATE_TIME = 'date_time'.freeze
      PASSWORD = 'password'.freeze
      SCHEMA = 'schema'.freeze
    end

    class Factory
      def self.get(value, params)
        type = common_type(params)
        raise 'Invalid type' unless type
        (class_eval "Parameters::#{type.to_s.split('::').last.capitalize}Validator").new(value, params)
      end

      def self.common_type(params)
        return CommonTypes::SCHEMA if params['schema']
        case params['type'].downcase
        when 'integer'
          case params['format'].downcase
          when 'int32' then CommonTypes::INTEGER
          when 'int64' then CommonTypes::LONG
          end
        when 'number'
          case params['format'].downcase
          when 'float' then CommonTypes::FLOAT
          when 'double' then CommonTypes::DOUBLE
          end
        when 'string'
          return CommonTypes::STRING unless params['format']
          case params['format'].downcase
          when 'datetime' then CommonTypes::DATE_TIME
          when 'date' then CommonTypes::DATE
          else CommonTypes::STRING
          end
        when 'boolean' then CommonTypes::BOOLEAN
        end
      end
    end
  end
end
