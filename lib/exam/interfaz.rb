# -*- encoding : utf-8 -*-
require "exam/version"

#=Clase Interfaz
#Clase que provee al usuario la capacidad de interactuar con el examen. Posee el atributo _exam_, que guarda el examen al que se va a referir esta interfaz, _opcion_ que guarda la eleccion 
#del usuario en cada pregunta, _aprobado_, un booleano que guarda si el alumno ha aprobado o no, _falsas_ que guarda el numero de respuestas incorrectas y _correctas_,
#que almacena lo que su mismo nombre indica. Posee el metodo _initialize, al que se le pasa solo el parametro del examen, y el metodo _interface_ que recorre todos los elementos de _exam_, 
#imprimiendolos y cazando si el alumno esta aprobado o no.
# 
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