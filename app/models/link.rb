# == Schema Information
#
# Table name: links
#
#  id                   :integer          not null, primary key
#  content              :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  uri                  :string(255)
#  favicon_file_name    :string(255)
#  favicon_content_type :string(255)
#  favicon_file_size    :integer
#  favicon_updated_at   :datetime
#

class Link < ActiveRecord::Base
  attr_accessible :content, :uri

  has_many :linkages
  has_many :users, through: :linkages

  has_attached_file :favicon,
                    #styles: { thumb: "16x16>", small: "32x32>" },
                    #default_style: :thumb,
                    url:  "/assets/images/:class/favicons/:id/:style/favicon.ico",
                    path: ":rails_root/public:url"

  before_save :create_favicon

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

  private

    def create_favicon
      url = self.uri
      url = 'http://' << url unless url =~ /http(s)?:\/\//
      self.favicon = URI.parse('http://g.etfv.co/'+ url)
      validates_attachment_presence     :favicon
      validates_attachment_size         :favicon, less_than: 5.megabytes
      validates_attachment_content_type :favicon, content_type: %w[image/x-icon]
    end



end
