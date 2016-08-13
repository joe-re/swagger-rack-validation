require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::DoubleValidator do
  describe '#valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::DoubleValidator.new(value).valid? }

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
