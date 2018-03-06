class Resource < ApplicationRecord
	serialize :comment_ids
	has_and_belongs_to_many :subjects
	has_many :comments
end
