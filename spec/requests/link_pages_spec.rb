require 'spec_helper'

describe 'Link Pages' do

  subject { page }

  describe 'index' do

    let(:user)  { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    before { visit links_path }

    it { should have_selector('title', text: 'Links') }
    it { should have_selector('h1',    text: 'Public links') }

    describe 'pagination' do

      before(:all) do
        31.times do
          #user.linkages.build(link_id: FactoryGirl.create(:link).id).save
          user.linkages.create(link_id: FactoryGirl.create(:link).id)
        end
      end

      before do
        visit links_path
      end

      after(:all) do
        Link.delete_all
        user.linkages.delete_all
      end

      it { should have_selector('div.pagination') }

      let(:params) { {page:1} }

      it 'should list each link' do
        Link.by_user_number(params).each do |link|
          link.uri.should =~ /http(s)?:\/\//
          page.should have_link(link.content, href: link.uri)
        end
      end
    end

    describe 'should have count of users' do

      let(:link)  { FactoryGirl.create(:link) }

      before do
         #user.linkages.build(link_id: link.id).save
         user.linkages.create(link_id: link.id)
        user2.linkages.create(link_id: link.id)
        visit links_path
      end

      after do
         user.linkages.delete_all
        user2.linkages.delete_all
      end

      let(:count) { link.linkages.count.to_s }

      it { should have_selector('li', text:  count + " user".pluralize(count) ) }
    end

  end

  describe 'link creation' do

    before { visit root_path }

    describe 'with invalid information' do
      it 'should not create link' do

      end
    end

  end

end
