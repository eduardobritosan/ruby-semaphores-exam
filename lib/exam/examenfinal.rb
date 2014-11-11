# -*- encoding : utf-8 -*-
require "exam/version"

class Examen
	attr_reader :question, :respuestas
	include Comparable
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
	def <=>(other)
	  (self.question <=> other.question) == 0 ? self.respuestas <=> other.respuestas : self.question <=> other.question
	end
end

class VerFal < Examen
	attr_accessor :question
	def initialize(question)
		@question = question
		@respuestas = ["a) Verdadero\n","b) Falso\n"]
	end
end


