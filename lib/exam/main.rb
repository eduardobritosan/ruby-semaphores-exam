# -*- encoding : utf-8 -*-

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

class VerFal < SelSim
	attr_accessor :question, :answers
	def initialize(question,fidelityTrue,fidelityFalse)
		@question = question
		@a1 = Respuesta.new("Verdadero",fidelityTrue)
		@a2 = Respuesta.new("Falso",fidelityFalse)
		@answers = [@a1,@a2]
	end
end


class Respuesta
	attr_accessor :string, :fidelity
	def initialize(string,fidelity)
		@string = string
		@fidelity = fidelity
	end
end

Nodo = Struct.new(:value,:next)

class List #Clase lista
	include Enumerable
	attr_accessor :tail
	def initialize
		@tail = Nodo.new(nil,nil)
	end
	def pop
		aux = @tail
		@tail = aux.next
		aux.value
	end
	def push(newValue)
	    if @tail.value == nil
	      @tail.value = newValue
	    elsif
	      aux = Nodo.new(newValue,@tail)
	      @tail = aux
	    end
	end
	def each
		aux = @tail
		while aux != nil 
			yield aux.value
			aux = aux.next
		end
	end
end

Nodo2 = Struct.new(:prev,:value,:next)

class DoubleList < List
	attr_accessor :tail,:head
	def initialize
		@tail, @head = nil
	end
	def pop
		if @tail == nil
			return nil
		else
			aux = @tail
			@tail = aux.next
			aux.value
		end
	end
	def push(newValue)
		if @tail == nil
			@tail = Nodo2.new(nil,newValue,nil)
			@head = @tail
		elsif
			aux = Nodo2.new(nil,newValue,@tail)
			@tail = aux
		end
	end
	def shift
		if @head == nil
			return nil
		else
			aux = @head
			@head =aux.prev
			aux.value
		end
	end
	def unshift(newValue)
		if @head == nil
			@head = Nodo2.new(nil,newValue,nil)
			@tail = @head
		elsif
			aux = Nodo2.new(@head,newValue,nil)
			@head = aux
		end
	end
end


class Examen
	include Enumerable
	attr_accessor :preguntas
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
	def includeQuestionEnding!(pregunta)
		@preguntas.unshift(pregunta)
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

		@ans2 = Respuesta.new("Blanco",true)
		@ans3 = Respuesta.new("Negro",false)
		@ans4 = Respuesta.new("Verde",false)
		@ans5 = Respuesta.new("Marron",false)
		@ans6 = Respuesta.new("Naranja",false)
		@t3 = SelSim.new("Color del caballo blanco de Santiago?",[@ans2,@ans3,@ans4,@ans5,@ans6])
		@t1 = VerFal.new("El sol es azul",false,true)
		@t2 = VerFal.new("El caballo blanco de santiago es blanco",true,false)
		@examen = Examen.new
		@examen.includeQuestionBeggining!(@t1)
		@examen.includeQuestionBeggining!(@t2)
		@examen.includeQuestionBeggining!(@t3)
		@testInterfaz = Interfaz.new(@examen)
		@testInterfaz.opcion = 0

		@testInterfaz.interface

		@examenRev = @examen.reverse

		@testInterfaz2 = Interfaz.new(@examenRev)
		@testInterfaz.opcion = 0

		@testInterfaz2.interface
