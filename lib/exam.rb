require "exam/version"

class Examen
	attr_reader :question, :respuestas
	def initialize(question,respuestas)
		@question = question
		@respuestas = respuestas
	end
end
