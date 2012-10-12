require 'spec_helper'

describe "Static Pages" do

	subject { page }

	# shared example group (RSpec 2)
	shared_examples_for "all static pages" do
		it { should have_selector('title', 	text: full_title(page_title) ) }
		it { should have_selector('h1', 	  text: heading   ) }
	end

	describe "Home Page" do

    before { visit root_path }

		let(:page_title){ '' }
		let(:heading)   { 'Welcome' }

    it_should_behave_like "all static pages"

    it { should_not have_selector('title', text: "| Home") }

    let(:user)   { FactoryGirl.create(:user) }
    let(:number) { 5 }

    describe "for signed-in user", js: true do

      describe "should respond to links" do

        before do
          number.times { user.linkages.create(link_id: FactoryGirl.create(:link).id) }
          sign_in user
          visit root_path
        end

        it "should render the user's linkage" do
          user.linkages.each do |linkage|
            page.should have_link(linkage.link.content, href: linkage.link.uri)
          end
          page.should have_selector('img[src*=plus]')
        end

        let(:link_text) { "Alladin" }

        describe "should add new linkage" do

          before do
            fill_in 'Link',         with: link_text.downcase+'.com'
            fill_in 'Text of link', with: link_text
            click_button 'Add Link'
            sleep(3)
          end

          it "should contain new link" do
            current_path.should == root_path
            page.should have_content(link_text)
            #page.should have_selector('div.alert-success', text: link_text)
            page.should have_success_message(link_text)
          end

        end

        describe "should delete all linkages" do

          it "should delete linkages" do
            page.should have_selector("div.span3.ui-state-default", count: number+1)
            number.times do
              expect do
                click_link "delete"
                sleep(1.5)
              end.to change(user.linkages, :count).by(-1)
            end
            page.should have_selector("div.span3.ui-state-default", count: 1)
          end

        end

        after do
          user.linkages.delete_all
          user.destroy
        end
      end

      describe "should order the linkages" do

        let(:link1) { FactoryGirl.create(:link, content: 'First') }
        let(:link2) { FactoryGirl.create(:link, content: 'Second')}
        let(:link3) { FactoryGirl.create(:link, content: 'Third') }

        before do
          sign_in user
        end

        let(:linkage1) { user.linkages.build(link_id: link1.id, order: 1) }
        let(:linkage2) { user.linkages.build(link_id: link2.id, order: 2) }
        let(:linkage3) { user.linkages.build(link_id: link3.id, order: 3) }

        it "should be in proper order" do
          user.linkages.each_with_index do |linkage,index|
            puts linkage.order
            puts index
            linkage.order.should eq index+1
          end

          user.linkages.should eq [linkage1, linkage2, linkage3]
        end
      end

    end

	end

  describe "About Page" do
    before { visit about_path }
		let(:page_title){ 'More About Webmarks'}
		let(:heading)   { 'About'}
		it_should_behave_like "all static pages"
	end

	describe "Contact Page" do
		before { visit contact_path }
		let(:page_title){ 'Contact'}
		let(:heading)   { 'Contact'}
		it_should_behave_like "all static pages"
	end

	describe "Help Page" do
		before { visit help_path }
		let(:page_title){ 'Help'}
		let(:heading)   { 'Help'}
		it_should_behave_like "all static pages"
	end

  it "should have right links on the layout" do
    visit root_path
    page.should have_selector 'title', text: full_title('')
    click_link "About"
    page.should have_selector 'title', text: full_title('More About Webmarks')
    visit root_path
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    visit root_path
    click_link "Home"
    click_link "No, thanks!"
    page.should have_selector 'title', text: full_title('')
  end

end
