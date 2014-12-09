# -*- encoding : utf-8 -*-
 require "exam/version"

#=Nodo de lista simplemente enlazada
#Contiene dos valores, _value_, que tiene el elemento que contiene el nodo, y _next_, que tiene dentro el siguiente elemento de la lista.
Nodo = Struct.new(:value,:next)

#=Clase lista
#Contiene el atributo _tail_, que es el primer elemento por la izquierda, el modulo _Enumerable_, el metodo _initialize_ para construir el objeto, 
#_pop_ para extraer por la izquierda, _push_ para insertar por la izquierda y la definicion de _each_ para poder usar _Enumerable_.
class List 
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

#=Nodo de la lista doblemente enlazada
#Contiende el simbolo _:prev_, que contiene el elemento previo, _value_ que contiene el elemento del nodo, y _next_, que tiene dentro el siguiente elemento de la lista.
Nodo2 = Struct.new(:prev,:value,:next)

#=Clase lista doblemente enlazada
#Contiene el atributo _tail_, que es el primer elemento por la izquierda, el _head_ que es el primer elemento por la derecha, hereda el modulo _Enumerable_,
# el metodo _initialize_ para construir el objeto, _pop_ para extraer por la izquierda, _push_ para insertar por la izquierda, _shift_ para extraer por la derecha y 
# _unshift_ para insertar por la derecha.
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
