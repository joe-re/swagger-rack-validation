require 'spec_helper'

describe SwaggerRackValidation::Middleware::RequestValidation do
  include Rack::Test::Methods

  let(:app) do
    options = {
      schema: JSON.parse(File.read('./spec/swagger_rack_validation/fixtures/swagger.json'))
    }
    Rack::Builder.new do
      use SwaggerRackValidation::Middleware::RequestValidation, options
      run lambda { |_|
        [200, {}, []]
      }
    end
  end

  it 'passes through a valid request' do
    params = { 'size' => 1 }
    header 'Content-Type', 'application/json'
    get '/persons', params
    expect(last_response.status).to eq 200
  end

  describe 'Validator' do
    describe '#validate_parameters' do
      context 'GET' do
        let(:params) {}
        before do
          header 'Content-Type', 'application/json'
          get '/persons', params
        end

        context 'integer type paremeter' do
          context 'receive string value' do
            let(:params) { { 'size' => 'string' } }
            it 'receive 400' do
              expect(last_response.status).to eq 400
              expect(JSON.parse(last_response.body)['id']).to eq 'invalid_parameter'
            end
          end
        end
      end

      context 'POST' do
        let(:params) do
          {
            'name' => 'string value',
            'age' => 28,
            'single' => false
          }
        end

        before do
          header 'Content-Type', 'application/json'
          post '/persons', JSON.generate(params)
        end

        it 'receive 200' do
          expect(last_response.status).to eq 200
        end
        context 'integer type paremeter' do
          context 'receive string value' do
            let(:params) do
              {
                'name' => 'string value',
                'age' => 'string value',
                'single' => false
              }
            end
            it 'receive 400' do
              expect(last_response.status).to eq 400
              expect(JSON.parse(last_response.body)['id']).to eq 'invalid_parameter'
            end
          end
        end
      end
    end
  end
end
