require 'spec_helper'

describe "animals/show" do
  before(:each) do
    @animal = assign(:animal, stub_model(Animal,
      :id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
  end
end
