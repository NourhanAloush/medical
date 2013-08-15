require 'spec_helper'

describe "patients/index" do
  before(:each) do
    assign(:patients, [
      stub_model(Patient,
        :patient_id => "Patient",
        :clinic => "Clinic",
        :clinic_type => "Clinic Type"
      ),
      stub_model(Patient,
        :patient_id => "Patient",
        :clinic => "Clinic",
        :clinic_type => "Clinic Type"
      )
    ])
  end

  it "renders a list of patients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Patient".to_s, :count => 2
    assert_select "tr>td", :text => "Clinic".to_s, :count => 2
    assert_select "tr>td", :text => "Clinic Type".to_s, :count => 2
  end
end
