# -*- encoding : utf-8 -*-
 require "exam/version"

#=Clase respuesta
#Contiene el atributo _string_, en donde se guarda la cadena que forma la respuesta, y el atributo _fidelity_ donde se guarda la veracidad de la respuesta, es decir
#una respuesta correcta tendria true en su campo _fidelity_.
class Respuesta
	attr_accessor :string, :fidelity
	def initialize(string,fidelity)
		@string = string
		@fidelity = fidelity
	end
end
