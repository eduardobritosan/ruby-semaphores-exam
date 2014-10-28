require "exam/version"

class Examen
	attr_reader :question, :respuestas
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
end

Nodo = Struct.new(:value,:next) do
	attr_reader :value,:next
	attr_writer :value,:next
end

class List
	attr_reader :arr
	def initialize
		@arr = Array.new(1,Nodo.new(nil,nil))
	end
	def shift
		@arr.shift		
	end
	def push(newValue)
		@arr.last.next = newValue
		@arr.push(newNodo = Nodo.new(newValue,nil))
	end
	def multipush(nodeArray)
		@arr.last.next = nodeArray.first.value
		@arr.push(nodeArray)
	end
	def head
		@arr.first
	end
end

