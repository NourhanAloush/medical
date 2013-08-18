require 'spec_helper'

describe "exams/index" do
  before(:each) do
    assign(:exams, [
      stub_model(Exam,
        :name => "Name",
        :max => 1,
        :min => 2
      ),
      stub_model(Exam,
        :name => "Name",
        :max => 1,
        :min => 2
      )
    ])
  end

  it "renders a list of exams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
