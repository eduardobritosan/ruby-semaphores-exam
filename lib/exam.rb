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
		@respuestas
	end
	def printex
		puts "#{@question}\n"
		respuestas.each do |resp|
			puts resp
		end
	end
end
