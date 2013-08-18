require 'spec_helper'

describe "medical_exams/new" do
  before(:each) do
    assign(:medical_exam, stub_model(MedicalExam,
      :emp_id => "MyString",
      :exam_type => "MyString"
    ).as_new_record)
  end

  it "renders new medical_exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", medical_exams_path, "post" do
      assert_select "input#medical_exam_emp_id[name=?]", "medical_exam[emp_id]"
      assert_select "input#medical_exam_exam_type[name=?]", "medical_exam[exam_type]"
    end
  end
end
