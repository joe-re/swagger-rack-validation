require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::FloatValidator do
  describe '#valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::FloatValidator.new(value, {}).valid? }

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
