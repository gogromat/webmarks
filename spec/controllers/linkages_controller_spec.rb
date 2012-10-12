require 'spec_helper'

describe LinkagesController do

  let(:user) { FactoryGirl.create(:user) }
  let(:link) { FactoryGirl.create(:link) }

  before { sign_in user }

  describe "creating a linkage with Ajax" do

    it "should increment the Linkage count" do
      expect do
        xhr :post, :create, link: {content: link.content, uri: link.uri}
      end.to change(Linkage, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, link: {content: link.content, uri: link.uri}
      response.should be_success
    end
  end

  describe "destroying a linkage with Ajax" do

      before do
        user.linkages.create!(link_id: link.id)
      end

      let(:linkage) { user.linkages.find_by_link_id(link.id)}

      it "should decrement the Linkage count" do
        expect do
          xhr :delete, :destroy, id: linkage.id
        end.to change(Linkage, :count).by(-1)
      end

      it "should respond with success" do
        xhr :delete, :destroy, id: linkage.id
        response.should be_success
      end
  end

  #TODO order

end
