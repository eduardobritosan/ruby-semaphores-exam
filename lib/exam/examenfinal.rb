# -*- encoding : utf-8 -*-
require "exam/version"

class Respuesta
	attr_accessor :string, :fidelity
	def initialize(string,fidelity)
		@string = string
		@fidelity = fidelity
	end
end


class Examen
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
	def printex
		puts "#{@question}\n"
		answers.each do |resp|
			puts resp
		end
	end
	def <=>(other)
		return nil unless other.is_a? Examen
		(self.question <=> other.question) == 0 ? self.answers <=> other.answers : self.question <=> other.question
	end
end

class VerFal < Examen
	attr_accessor :question, :answers
	def initialize(question,fidelityTrue,fidelityFalse)
		@question = question
		@a1 = Respuesta.new("Verdadero",fidelityTrue)
		@a2 = Respuesta.new("Falso",fidelityFalse)
		@answers = [@a1,@a2]
	end
end

class Interfaz 
	attr_accessor :listExam
	def initialize(listParam)
		@listExam = listParam
	end
end

