# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'exam'

describe Respuesta do
	before :all do
		@answerTest = Respuesta.new("Hola",true)
	end
	describe "Pruebas: " do
		it "Constructor" do
			@answerTest.is_a?(Respuesta)
		end
	end
end
describe Examen do
	before :all do
		@ex= Examen.new("\nQue hora es?",['11:30','2:20','3:55','4:58'])
	end
	describe "Pruebas de inicializacion" do
		it "Se crea la pregunta? y funcionan los gets" do
			@ex.getquestion.should eq("\nQue hora es?")
		end
		it "Se crean las respuestas? y funcionan los get" do
			@ex.getanswers.should eq(['11:30','2:20','3:55','4:58'])
		end
	end
end
describe List do
	before :each do
		@node = Nodo.new(1,2)
		@list = DoubleList.new
		@list.push(1)
	end
	it "No existe un nodo" do
		@node.is_a?(Nodo)
	end
	it "Se inserta un elemento" do
		@list.push(4)
	end
	it "Se extrae el primer elemento" do
		@list.pop
	end
end	
describe "Preguntas simples practica 6" do
	before :all do
		@pregunta1 = Examen.new("¿Cual es el tipo del objeto en el siguiente codigo Ruby?\nclass Objeto\n end",
								["a) Una instancia de la clase Class\n","b) Una constante\n","c) Un objeto\n","d) Ninguna de las anteriores"])					
		@pregunta2 = VerFal.new("Es apropiado que una clase Tablero herede de una clase Juego",true,false)
		@preguntas = DoubleList.new
		@preguntas.push(@pregunta1)
		@preguntas.push(@pregunta2)
	end
	it "Comprobacion pop Examen" do
		@preguntas.pop.is_a?(Examen)
	end
	it "Comprobacion pop VerFal" do
		@preguntas.pop.is_a?(VerFal)
	end
end
describe "Instancia Examen" do
	before :all do
		@testexamen = Examen.new("","")
	end
	it "Existe una instancia examen?" do
		@testexamen.class.is_a?(Examen)
	end
end
describe "Instancia VerFal" do
	before :all do
		@testexamen = VerFal.new("",false,true)
	end
	it "Existe una instancia de preguntas verdadero falso?" do
		@testexamen.class.is_a?(VerFal)
	end
end
describe "Pruebas Preguntas Comparable Practica 8" do
	before :all do
		@t1 = VerFal.new("El sol es azul",false,true)
		@t2 = VerFal.new("El caballo blanco de santiago es blanco",true,false)
	end
	it "Existe el comparador? <" do
		(@t1 < @t2).should be false
	end
	it "Existe el comparador? >" do
		(@t1 > @t2).should be true
	end
	it "Existe el comparador? ==" do
		(@t1 == @t2).should be false
	end
	it "Existe el comparador? <=" do
		(@t1 <= @t2).should be false
	end
	it "Existe el comparador? >=" do
		(@t1 >= @t2).should be true
	end
end

describe "Pruebas Enumerable lista Practica 8" do
	before :all do
		@lista = List.new
		@lista.push(@t1)
		@lista.push(@t2)
	end
	it "Prueba de existencia each" do
		@lista.max.should eq(@t1)
#		@lista.min.should eq(@t2)
#		@lista.collect.should
#		@lista.find.should
#		@lista.all.should eq(@t1)
	end
end

describe Interfaz do
	before :all do
		@ans2 = Respuesta.new("Blanco",true)
		@ans3 = Respuesta.new("Negro",false)
		@ans4 = Respuesta.new("Verde",false)
		@ans5 = Respuesta.new("Marron",false)
		@ans6 = Respuesta.new("Naranja",false)
		@t3 = Examen.new("Color del caballo blanco de Santiago?",[@ans2,@ans3,@ans4,@ans5,@ans6])
		@t1 = VerFal.new("El sol es azul",false,true)
		@t2 = VerFal.new("El caballo blanco de santiago es blanco",true,false)
		@lista = List.new
		@lista.push(@t1)
		@lista.push(@t2)
		@lista.push(@t3)
		@testInterfaz = Interfaz.new(@lista)
		@testInterfaz.opcion = 0

	end
	it "Constructor" do
		@testInterfaz.is_a?(Interfaz)
	end
	it "Interfaz de usuario" do
		expect(@testInterfaz.interface).to be true
	end
end
