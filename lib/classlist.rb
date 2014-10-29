require "exam/version"

Nodo = Struct.new(:value,:next)
class List
	attr_accessor :head
	def initialize
		@head = nil
	end
	def shift
		aux = @head
		@head = @head.next
		aux.value
	end
	def push(newValue)
	    if @head == nil
	      head = Nodo.new(newValue,nil)
	    elsif
	      aux = Nodo.new(newValue,@head)
	      @head = aux
	    end
	end
end

