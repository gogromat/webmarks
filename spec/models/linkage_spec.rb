# == Schema Information
#
# Table name: linkages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  link_id    :integer
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Linkage do


  let(:user) { FactoryGirl.create(:user) }

  let(:link) { FactoryGirl.create(:link) }

  let(:linkage) { user.linkages.build(link_id: link.id) }

  subject { linkage }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Linkage.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "linkage methods" do
    it { should respond_to(:user) }
    it { should respond_to(:link) }
    its(:user) { should == user   }
    its(:link) { should == link   }
  end

  describe "when user id is not present" do
    before { linkage.user_id = nil }
    it     { should_not be_valid }
  end

  describe "when link id is not present" do
    before { linkage.link_id = nil }
    it     { should_not be_valid }
  end

end
