require 'spec_helper'

describe "medical_exams/edit" do
  before(:each) do
    @medical_exam = assign(:medical_exam, stub_model(MedicalExam,
      :emp_id => "MyString",
      :exam_type => "MyString"
    ))
  end

  it "renders the edit medical_exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", medical_exam_path(@medical_exam), "post" do
      assert_select "input#medical_exam_emp_id[name=?]", "medical_exam[emp_id]"
      assert_select "input#medical_exam_exam_type[name=?]", "medical_exam[exam_type]"
    end
  end
end
