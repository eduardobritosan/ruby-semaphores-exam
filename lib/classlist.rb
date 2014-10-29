require "exam/version"

Nodo = Struct.new(:value,:next)
class List
	attr_accessor :head
	def initialize
		@head = Nodo.new(nil,nil)
	end
	def shift
		aux = @head
		@head = aux.next
		aux.value
	end
	def push(newValue)
	    if @head.value == nil
	      @head.value = newValue
	    elsif
	      aux = Nodo.new(newValue,@head)
	      @head = aux
	    end
	end
end

