require 'spec_helper'

describe "medical_exams/index" do
  before(:each) do
    assign(:medical_exams, [
      stub_model(MedicalExam,
        :emp_id => "Emp",
        :exam_type => "Exam Type"
      ),
      stub_model(MedicalExam,
        :emp_id => "Emp",
        :exam_type => "Exam Type"
      )
    ])
  end

  it "renders a list of medical_exams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Emp".to_s, :count => 2
    assert_select "tr>td", :text => "Exam Type".to_s, :count => 2
  end
end
