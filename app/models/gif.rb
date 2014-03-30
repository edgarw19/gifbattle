class Gif < ActiveRecord::Base
  VALID_REGEX = /http:\/\/[\S]*\.gif$/
  attr_accessible :link, :votes
  acts_as_votable
  validates :link, presence: true, format: {with: VALID_REGEX}, uniqueness: {case_sensitive: false}
end
