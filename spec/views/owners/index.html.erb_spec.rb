require 'spec_helper'

describe "owners/index" do
  before(:each) do
    assign(:owners, [
      stub_model(Owner,
        :first_name => "First Name",
        :last_name => "Last Name",
        :street => "Street",
        :city => "City",
        :country => "Country",
        :phone => "Phone",
        :email => "Email",
        :active => false
      ),
      stub_model(Owner,
        :first_name => "First Name",
        :last_name => "Last Name",
        :street => "Street",
        :city => "City",
        :country => "Country",
        :phone => "Phone",
        :email => "Email",
        :active => false
      )
    ])
  end

  it "renders a list of owners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
