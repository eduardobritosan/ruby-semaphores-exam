# -*- encoding : utf-8 -*-
require "exam/version"
#Lo que habia hecho antes
#class Examen
#	attr_reader :question, :answers
#	include Comparable
#	def initialize(question,answers)
#		@question = question
#		@answers = answers
#	end
#	def getquestion
#		@question
#	end
#	def getanswers
#		@answers
#	end
#	def printex
#		puts "\n#{@question}\n"
#		@answers.each_with_index do |resp,i|
#			puts "#{i}.- #{resp.string}\n"
#		end
#	end
#	def <=>(other)
#		return nil unless other.is_a? Examen
#		(self.question <=> other.question) == 0 ? self.answers <=> other.answers : self.question <=> other.question
#	end
#end

class Examen
	include Enumerable
	attr_reader 
	def initialize
		@preguntas = List.new
	end
	def printexam
		@preguntas.each do |n|
			n.printpregunta
		end
	end
	def includeQuestion!(pregunta)
		@preguntas.push(pregunta)
	end
	def each
		@preguntas.each do |n|
			yield n
		end
	end
end

