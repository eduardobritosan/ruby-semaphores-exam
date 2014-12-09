# -*- encoding : utf-8 -*-
require "exam/version"

#=Clase Pregunta de seleccion simple
#Contiene el atributo _question_ que se trata del string en donde se guarda la pregunta en si, y el atributo _answers_, que es un array de objetos de clase Respuesta,
#incluye el modulo _Comparable_, que permite que dos elementos de esta clase o sus hijas se puedan comparar. Tambien posee los metodos getters _getquestion_ y _getanswers_
#acompanado de un metodo para imprimir la pregunta entera llamada _printpregunta_. Por ultimo, esta definido el _<=> (Spaceship operator)_ para poder usar el modulo Comparable.
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

#=Clase Pregunta de verdadero o falso
#Contiene todos los atributos de su clase padre, Seleccion Simple, con la unica diferencia de un _initialize_ ligeramente cambiado.
class VerFal < SelSim
	attr_accessor :question, :answers
	def initialize(question,fidelityTrue,fidelityFalse)
		@question = question
		@a1 = Respuesta.new("Verdadero",fidelityTrue)
		@a2 = Respuesta.new("Falso",fidelityFalse)
		@answers = [@a1,@a2]
	end
end



