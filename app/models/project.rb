class Project < ActiveRecord::Base
  has_and_belongs_to_many :technologies
  has_attached_file :image, default_url: "/default.png"

  accepts_nested_attributes_for :technologies

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :name, :description, :repo_url, :live_site
  validates_uniqueness_of :name, :order

  def technologies_left
    Technology.all - self.technologies
  end
end
