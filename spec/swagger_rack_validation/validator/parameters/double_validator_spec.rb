require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::DoubleValidator do
  describe '#type_valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::DoubleValidator.new(value, {}).type_valid? }

    context 'value has decimal point' do
      let(:value) { 1.2 }
      it { is_expected.to be_truthy }
    end

    context 'value is string' do
      let(:value) { 'a' }
      it { is_expected.to be_falsy }
    end
  end
end
