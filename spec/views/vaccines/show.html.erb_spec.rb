require 'spec_helper'

describe "vaccines/show" do
  before(:each) do
    @vaccine = assign(:vaccine, stub_model(Vaccine,
      :id => 1,
      :name => "Name",
      :animal_id => 2,
      :duration => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
