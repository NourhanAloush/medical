require 'spec_helper'

describe "employees/index" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :name => "Name",
        :employee_id => 1,
        :department => "Department",
        :blood_group => "Blood Group",
        :Transfer => "Transfer"
      ),
      stub_model(Employee,
        :name => "Name",
        :employee_id => 1,
        :department => "Department",
        :blood_group => "Blood Group",
        :Transfer => "Transfer"
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Department".to_s, :count => 2
    assert_select "tr>td", :text => "Blood Group".to_s, :count => 2
    assert_select "tr>td", :text => "Transfer".to_s, :count => 2
  end
end
