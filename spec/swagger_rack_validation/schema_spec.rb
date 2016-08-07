require 'spec_helper'

describe SwaggerRackValidation::Schema do
  describe '#get' do
    let(:content) do
      {
        'paths' => {
          '/persons' => {
            'get' => {
              'description' => 'Gets Person Object',
              'parameters' => {
                'name' => 'size',
                'in' => 'query',
                'description' => 'description',
                'required' => true,
                'type' => 'number',
                'format' => 'double'
              }
            }
          }
        }
      }
    end
    let(:path) { '/persons' }
    let(:method) { 'get' }
    subject { described_class.new(content).get(path, method) }
    it { expect(subject['description']).to eq 'Gets Person Object' }
    it { expect(subject['parameters']['required']).to be_truthy }
    it { expect(subject['parameters']['type']).to eq 'number' }
    it { expect(subject['parameters']['format']).to eq 'double' }
  end
end
