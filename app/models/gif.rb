class Gif < ActiveRecord::Base
	before_save :default_agree_count

	def default_agree_count
		self.agree = 1
		self.votes = 1
	end
	VALID_REGEX = /http:\/\/[\S]*\.gif$/
	attr_accessible :link, :votes, :agree
	acts_as_votable
	validates :link, presence: true, format: {with: VALID_REGEX}, uniqueness: {case_sensitive: false}
end
