require "exam/version"

class Examen
	attr_reader :question, :respuestas
	def initialize(question,respuestas)
		@question = question
		@respuestas = respuestas
	end
	def getquestion
		@question
	end
	def getanswers
		@question
	end
end
