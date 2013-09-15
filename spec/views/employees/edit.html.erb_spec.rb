require 'spec_helper'

describe "employees/edit" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :name => "MyString",
      :employee_id => 1,
      :department => "MyString",
      :blood_group => "MyString",
      :Transfer => "MyString"
    ))
  end

  it "renders the edit employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do
      assert_select "input#employee_name[name=?]", "employee[name]"
      assert_select "input#employee_employee_id[name=?]", "employee[employee_id]"
      assert_select "input#employee_department[name=?]", "employee[department]"
      assert_select "input#employee_blood_group[name=?]", "employee[blood_group]"
      assert_select "input#employee_Transfer[name=?]", "employee[Transfer]"
    end
  end
end
