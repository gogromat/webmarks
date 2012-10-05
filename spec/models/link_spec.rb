# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uri        :string(255)
#

require 'spec_helper'

describe Link do

  before do
    @link =  Link.new(content: 'google.com', uri: 'google.com')
  end

  subject { @link }

  it { should respond_to(:content) }
  it { should respond_to(:uri)     }

  it { should be_valid }


  describe "when content is not present" do
    before { @link.content = ""       }
    it     { should_not be_valid      }
  end

  describe "when content is too short" do
    before { @link.content = "a" * 2  }
    it     { should_not be_valid      }
  end

  describe "when content is too long" do
    before { @link.content = "a" * 51 }
    it     { should_not be_valid      }
  end

  describe "when uri is not present" do
    before { @link.uri = ""           }
    it     { should_not be_valid      }
  end

  describe "when uri is too short" do
    before { @link.uri = "a"          }
    it     { should_not be_valid      }
  end

  describe "when uri is too long" do
    before { @link.uri = "a" * 301    }
    it     { should_not be_valid      }
  end



end
