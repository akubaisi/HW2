require 'spec_helper'

describe "owners/show" do
  before(:each) do
    @owner = assign(:owner, stub_model(Owner,
      :first_name => "First Name",
      :last_name => "Last Name",
      :street => "Street",
      :city => "City",
      :country => "Country",
      :phone => "Phone",
      :email => "Email",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Street/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
    rendered.should match(/false/)
  end
end
