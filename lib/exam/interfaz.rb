# -*- encoding : utf-8 -*-
require "exam/version"

class Interfaz 
	attr_accessor :exam,:opcion,:aprobado,:falsas,:correctas
	def initialize(examParam)
		@exam = examParam
		@opcion = 0
		@aprobado = false
		@falsas = 0
		@correctas = 0
	end
	def interface()
		@exam.each do |examenes|
			examenes.printpregunta
			#while (@opcion < 0 && @opcion >= examenes.answers.length) 
					#@opcion = gets.chomp.to_i
			if @opcion >= 0 && @opcion < examenes.answers.length
					if examenes.answers[@opcion].fidelity == true
						puts "Respuesta correcta\n"
						@correctas+=1;
					else
						puts "Respuesta incorrecta\n"
						@falsas+=1;
					end
			else
				puts "No se introdujo opcion válida, respuesta incorrecta"
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