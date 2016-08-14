require 'spec_helper'

describe SwaggerRackValidation::Validator::Parameters::BaseValidator do
  describe '#valid?' do
    subject { SwaggerRackValidation::Validator::Parameters::BaseValidator.new(value, params).valid? }

    context 'required value is' do
      let(:value) { 1 }
      let(:params) { { 'required' => true } }
      it { is_expected.to be_truthy }
    end

    context "required value isn't" do
      let(:value) { nil }
      let(:params) { { 'required' => true } }
      it { is_expected.to be_falsy }
    end
  end
end
