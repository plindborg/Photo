class Image < ActiveRecord::Base
	belongs_to :directory
	has_attached_file :picture, :styles => {:medium => "300x300>", :thumb => "100x100>" }


end
