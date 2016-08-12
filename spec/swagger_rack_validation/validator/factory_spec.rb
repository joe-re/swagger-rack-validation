require 'spec_helper'

describe SwaggerRackValidation::Validator::Factory do
  describe '.get' do
    let(:params) do
      {
        'name' => 'size',
        'in' => 'query',
        'description' => 'description',
        'required' => true,
        'type' => type,
        'format' => format
      }
    end
    subject { described_class.get(params, nil) }
    [
      { type: 'integer', format: 'int32', validator: SwaggerRackValidation::Validator::Parameters::IntegerValidator },
      { type: 'integer', format: 'int64', validator: SwaggerRackValidation::Validator::Parameters::LongValidator },
      { type: 'number', format: 'float', validator: SwaggerRackValidation::Validator::Parameters::FloatValidator },
      { type: 'number', format: 'double', validator: SwaggerRackValidation::Validator::Parameters::DoubleValidator }
    ].each do |v|
      let(:type) { v[:type] }
      let(:format) { v[:format] }
      let(:expected_validator) { v[:validator] }
      it "In case of type: #{v[:type]} and format: #{v[:format]}, get #{v[:validator]}" do
        expect(subject.class).to eq expected_validator
      end
    end
  end
end
