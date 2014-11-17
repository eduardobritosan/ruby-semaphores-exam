# -*- encoding : utf-8 -*-
require "exam/version"



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
	attr_accessor :question
	def initialize(question)
		@question = question
		@answers = ["a) Verdadero\n","b) Falso\n"]
	end
end


