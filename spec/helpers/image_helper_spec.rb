require "spec_helper"

describe ImageHelper do

  before do
    @link =  Link.new(content: 'Twitter', uri: 'twitter.com')
    @link.save!
  end

  subject { @link }

  describe "adding image of website" do

    before do
      add_website_image(@link)
    end

    it "should save new output.png image" do
      path  = "app/assets/images/links/#{@link.id}/"
      image = "output.png"
      get_website_path_and_image(@link, true, true).should = {path:  path,
                                                              image: image}
      File.exists?("#{path}/#{image}").should be_true
    end

    it "should not have cropped image" do
      path  = "app/assets/images/links/#{@link.id}/"
      image = "resized.png"
      get_website_path_and_image(@link, true, false).should = {path:  path,
                                                               image: image}
      File.exists?("#{path}/#{image}").should_not be_true
    end

    it "should have cropped image" do

      resize_website_image(get_website_path_and_image(@link))

      get_website_path_and_image(@link)

      File.exists?("#{path}/#{image}").should_not be_true
    end

  end

end
