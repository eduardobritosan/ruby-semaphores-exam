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
		puts "\n#{@question}\n"
		@answers.each_with_index do |resp,i|
			puts "#{i}.- #{resp.string}\n"
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
	attr_accessor :listExam,:opcion,:aprobado,:falsas,:correctas
	def initialize(listParam)
		@listExam = listParam
		@opcion = -1
		@aprobado = false
		@falsas = 0
		@correctas = 0
	end
	def interface()
		@listExam.each do |examenes|
			examenes.printex
			#while (@opcion < 0 && @opcion >= examenes.answers.length) 
					#@opcion = gets.chomp.to_i
			if @opcion <= 0 && @opcion > examenes.answers.length
					if examenes.answers[@opcion].fidelity == true
						puts "Respuesta correcta\n"
						@correctas+=1;
					else
						puts "Respuesta incorrecta\n"
						@falsas+=1;
					end
			else
				puts "No se introdujo opcion valida, respuesta incorrecta"
				@falsas += 1
			end
		end
		if @correctas >= @falsas
			@aprobado = true
		else
			@aprobado = false
		end
		return aprobado
	end
end