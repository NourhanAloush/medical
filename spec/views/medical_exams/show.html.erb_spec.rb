require 'spec_helper'

describe "medical_exams/show" do
  before(:each) do
    @medical_exam = assign(:medical_exam, stub_model(MedicalExam,
      :emp_id => "Emp",
      :exam_type => "Exam Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Emp/)
    rendered.should match(/Exam Type/)
  end
end
