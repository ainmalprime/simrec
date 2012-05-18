require 'spec_helper'

describe Patient do

  before { @patient = Patient.new(firstName: "Example Patient") }

  subject { @patient }

  it { should respond_to(:firstName) }

  it { should be_valid }

  describe "when firstName is not present" do
    before { @patient.firstName = " " }
    it { should_not be_valid }
  end
end