class Blog < ActiveRecord::Base
	validates_presence_of :title, :published_date, :author, :content
	has_many :reviews, :dependent => :destroy
end
