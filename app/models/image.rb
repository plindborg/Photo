class Image < ActiveRecord::Base
	has_attached_file :picture, :styles => {:medium => "300x300>", :thumb => "100x100>" }


end
