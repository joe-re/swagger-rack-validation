require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::DateValidator do
  describe '#type_valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::DateValidator.new(value, {}).type_valid? }

    context 'value is numeric' do
      let(:value) { 1 }
      it { is_expected.to be_falsy }
    end

    context "value's format is rfc2822" do
      let(:value) { 'Sat, 3 Feb 2001 04:05:06 +0700' }
      it { is_expected.to be_falsy }
    end

    context "value's format is rfc3339" do
      let(:value) { '2001-02-03T04:05:06+07:00' }
      it { is_expected.to be_truthy }
    end
  end
end
