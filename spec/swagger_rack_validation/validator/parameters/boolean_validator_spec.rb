require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::BooleanValidator do
  describe '#valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::BooleanValidator.new(value, {}).valid? }

    context 'value is number' do
      let(:value) { 1 }
      it { is_expected.to be_falsy }
    end

    context 'value is string' do
      let(:value) { 'a' }
      it { is_expected.to be_falsy }
    end

    context "value is 'true'" do
      let(:value) { 'true' }
      it { is_expected.to be_truthy }
    end

    context "value is 'false'" do
      let(:value) { 'true' }
      it { is_expected.to be_truthy }
    end

    context 'value is TrueClass' do
      let(:value) { true }
      it { is_expected.to be_truthy }
    end

    context 'value is FalseClass' do
      let(:value) { false }
      it { is_expected.to be_truthy }
    end
  end
end
