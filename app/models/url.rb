class Url < ActiveRecord::Base
	def shorten
		
	end

	validates :long_url, presence: true
	validates :long_url, uniqueness: {case_sensitive: false, message: "Was shortened before"}

	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "Format is not good"}
end
