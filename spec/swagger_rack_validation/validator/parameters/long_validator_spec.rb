require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::LongValidator do
  describe '#type_valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::LongValidator.new(value, {}).type_valid? }
    context 'value is too small' do
      let(:value) { - 2**63 - 1 }
      it { is_expected.to be_falsy }
    end

    context 'value is too big' do
      let(:value) { 2**63 }
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

    context 'value is int64' do
      [- 2**63, 0, 2**63 - 1].each do |v|
        let(:value) { v }
        context v do
          let(:value) { v }
          it { is_expected.to be_truthy }
        end
      end
    end
  end
end
