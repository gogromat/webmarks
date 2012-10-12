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

class Link < ActiveRecord::Base
  attr_accessible :content, :uri

  has_many :linkages
  has_many :users, through: :linkages


  validates :content,
            presence: true,
            length: { minimum: 3, maximum: 50 }

  validates :uri,
            presence: true,
            length: { minimum: 4, maximum: 300 }


  def self.by_user_number(params)
    paginate(
         page: params[:page],
         select: "links.*, COUNT(link_id) AS linker",
         joins: :linkages,
         group: "links.id",
         order: "linker DESC",
         readonly: true
    )
  end


end
