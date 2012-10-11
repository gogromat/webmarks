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

class Linkage < ActiveRecord::Base
  attr_accessible :link_id, :order#, :user_id

  belongs_to :user
  belongs_to :link

  validates :link_id,
            presence: true

  validates :user_id,
            presence: true

  validates :order,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0,
                message: 'Invalid order'
            }

end
