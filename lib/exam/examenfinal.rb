# -*- encoding : utf-8 -*-
 require "exam/version"

#=Clase Examen
#Contiene el atributo _pregunta_, que contiene una lista doblemente enlazada con todas las preguntas de ese examen. 
#Posee los metodos _initialize_ sin ningun parametro pasado, _printexam_ que se encarga de imprimir el examen entero, _includeQuestionBeggining!_ es basicamente un push que provee 
#la clase examen para abstraer al usuario de los metodos de la lista, _deleteQuestionBeggining!_ es un pop, _tail_ y _head_ son accesos directos a la cabeza y cola de la lista, 
#_each_ esta definido para poder usar el modulo _Enumerable_ y _reverse_ devuelve un nuevo examen con las preguntas cambiadas de orden, siguiendo los metodos de programacion funcional.
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
	def reverse #funcion reverse
		@reversedExam = Examen.new
		@preguntas.each{|v| @reversedExam.includeQuestionBeggining!(v)}
		@reversedExam
	end
end

