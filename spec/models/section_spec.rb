require 'spec_helper'

describe Section, focus: true do
  it "has valid factory" do
  	section = FactoryGirl.build :section
  	section.should be_valid
  end
end
