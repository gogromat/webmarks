require 'spec_helper'

describe 'Linkage Pages' do

  subject { page }

  describe "linkage creation" do

    let(:user) { FactoryGirl.create(:user) }

    describe "for signed-in user" do

      before do
        sign_in user
        visit new_linkage_path
        fill_in 'Link', with: 'gmail.com'
        fill_in 'Text', with: 'GMail'
      end

      it { should have_selector('title', text: full_title("Add Link")) }
      it { should have_selector('h1',    text: 'Add Link') }


      it "should create a linke" do
        expect do
          click_button 'Add Link'
        end.to change(Link, :count).by(1)
      end

      it "should create a linkage" do
        expect do
          click_button 'Add Link'
        end.to change(user.linkages, :count).by(1)
      end
    end

  end

end
