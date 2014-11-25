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
	def includeQuestionBeggining!(pregunta)
		@preguntas.push(pregunta)
	end
	def deleteQuestionBeggining!
		@preguntas.pop
	end
	def tail
		@preguntas.tail
	end
	def head
		@preguntas.head
	end
	def each
		@preguntas.each do |n|
			yield n
		end
	end
	def reverse
		@reversedExam = Examen.new
		@preguntas.each{|v| @reversedExam.includeQuestionBeggining!(v)}
		@reversedExam
	end
end

