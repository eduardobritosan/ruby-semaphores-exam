require "exam/version"

class Examen
	attr_reader :question
	def initialize(question)
		@question = question
	end
end
