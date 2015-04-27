class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_attachments
	accepts_nested_attributes_for :post_attachments
	validates :title, :description, :village, :unit_number, :floor, :barangay, :floor_area, presence: true
end
