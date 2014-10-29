require "exam/version"

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

