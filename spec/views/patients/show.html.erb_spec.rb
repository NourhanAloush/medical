require 'spec_helper'

describe "patients/show" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :patient_id => "Patient",
      :clinic => "Clinic",
      :clinic_type => "Clinic Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Patient/)
    rendered.should match(/Clinic/)
    rendered.should match(/Clinic Type/)
  end
end
