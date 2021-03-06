require 'spec_helper'

describe "patients/new" do
  before(:each) do
    assign(:patient, stub_model(Patient,
      :patient_id => "MyString",
      :clinic => "MyString",
      :clinic_type => "MyString"
    ).as_new_record)
  end

  it "renders new patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patients_path, "post" do
      assert_select "input#patient_patient_id[name=?]", "patient[patient_id]"
      assert_select "input#patient_clinic[name=?]", "patient[clinic]"
      assert_select "input#patient_clinic_type[name=?]", "patient[clinic_type]"
    end
  end
end
