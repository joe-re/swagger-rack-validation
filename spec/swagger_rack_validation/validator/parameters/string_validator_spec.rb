require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::StringValidator do
  describe '#valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::StringValidator.new(value, {}).valid? }

    context 'value is not Strong' do
      let(:value) { 1 }
      it { is_expected.to be_falsy }
    end

    context 'value is string' do
      let(:value) { 'a' }
      it { is_expected.to be_truthy }
    end
  end
end
