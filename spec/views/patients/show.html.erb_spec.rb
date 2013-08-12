require 'spec_helper'

describe "patients/show" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :id => 1,
      :clinic => "Clinic"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Clinic/)
  end
end
