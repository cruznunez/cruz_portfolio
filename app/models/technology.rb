class Technology < ActiveRecord::Base
  has_and_belongs_to_many :projects
  validates_presence_of :name, :link
  validates_uniqueness_of :name, :link
end
