require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::SchemaValidator do
  describe '#valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::SchemaValidator.new(value, params).valid? }
    let(:params) do
      {
        'type' => 'object',
        'required' => [
          'title'
        ],
        'properties' => {
          'title' => {
            'title' => 'title of travel',
            'type' => 'string'
          },
          'desctiption' => {
            'title' => 'description of travel',
            'type' => 'string'
          }
        }
      }
    end

    context 'requires value is missing' do
      let(:value) do
        {
          'description' => 'description'
        }
      end
      it { is_expected.to be_falsey }
    end

    context 'value is valid' do
      let(:value) do
        {
          'title' => 'title',
          'description' => 'description'
        }
      end
      it { is_expected.to be_truthy }
    end
  end
end
