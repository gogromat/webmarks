require 'spec_helper'

describe "Static Pages" do

	subject { page }

	# shared example group (RSpec 2)
	shared_examples_for "all static pages" do
		it { should have_selector('title', 	text: page_title) }
		it { should have_selector('h1', 	text: heading   ) }	
	end


	describe "Home Page" do
		before { visit '/' }

		let(:page_title){ 'Ruby'}
		let(:heading)   { 'Welcome'}

		it_should_behave_like "all static pages"
		it { should_not have_selector('title', text: "| Home")}
	end

	describe "About Page" do
		before { visit about_path }

		let(:page_title){ 'About'}
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


end
