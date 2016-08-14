require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::IntegerValidator do
  describe '#valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::IntegerValidator.new(value, {}).valid? }
    context 'value is too small' do
      let(:value) { - 2**31 - 1 }
      it { is_expected.to be_falsy }
    end

    context 'value is too big' do
      let(:value) { 2**31 }
      it { is_expected.to be_falsy }
    end

    context 'value has decimal point' do
      let(:value) { 1.2 }
      it { is_expected.to be_falsy }
    end

    context 'value is srring' do
      let(:value) { 'a' }
      it { is_expected.to be_falsy }
    end

    context 'value is int32' do
      [- 2**31, 0, 2**31 - 1].each do |v|
        let(:value) { v }
        context v do
          let(:value) { v }
          it { is_expected.to be_truthy }
        end
      end
    end
  end
end
