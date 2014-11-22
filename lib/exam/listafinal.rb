# -*- encoding : utf-8 -*-
require "exam/version"

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

class DoubleList
	attr_accessor :tail,:head
	def initialize
		@tail, @head = nil
	end
	def pop
		aux = @tail
		@tail = aux.next
		aux.value
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
		aux = @head
		@head =aux.prev
		aux.value
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
