# -*- encoding : utf-8 -*-
require "exam/version"
class Examen
	include Enumerable
	attr_reader :preguntas
	def initialize
		@preguntas = DoubleList.new
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

