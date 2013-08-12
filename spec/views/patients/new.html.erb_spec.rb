require 'spec_helper'

describe "patients/new" do
  before(:each) do
    assign(:patient, stub_model(Patient,
      :id => 1,
      :clinic => "MyString"
    ).as_new_record)
  end

  it "renders new patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patients_path, "post" do
      assert_select "input#patient_id[name=?]", "patient[id]"
      assert_select "input#patient_clinic[name=?]", "patient[clinic]"
    end
  end
end
