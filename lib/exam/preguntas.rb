# -*- encoding : utf-8 -*-
require "exam/version"

class SelSim
	attr_reader :question, :answers
	include Comparable
	def initialize(question,answers)
		@question = question
		@answers = answers
	end
	def getquestion
		@question
	end
	def getanswers
		@answers
	end
	def printpregunta
		puts "\n#{question}\n"
		answers.each_with_index do |resp,i|
			puts "#{i}.- #{resp.string}\n"
		end
	end
	def <=>(other)
		return nil unless other.is_a? self.class
		(self.question <=> other.question) == 0 ? self.answers <=> other.answers : self.question <=> other.question
	end
end

class VerFal < SelSim
	attr_accessor :question, :answers
	def initialize(question,fidelityTrue,fidelityFalse)
		@question = question
		@a1 = Respuesta.new("Verdadero",fidelityTrue)
		@a2 = Respuesta.new("Falso",fidelityFalse)
		@answers = [@a1,@a2]
	end
end

