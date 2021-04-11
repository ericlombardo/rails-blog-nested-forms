class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  # checks if name attribute for new tag is empty? rejects if it is
  accepts_nested_attributes_for :tags, reject_if: proc {|attribute| attribute[:name].blank?}
end
