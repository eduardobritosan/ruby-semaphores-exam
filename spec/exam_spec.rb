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
	describe "Print final" do
		it "La pregunta es:" do
			@ex.printex.should eq (["11:30","2:20","3:55","4:58"])
		end
	end

	describe "Pruebas de preguntas de practica 6" do
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
		@pregunta2 = VerFal.new("Es apropiado que una clase Tablero herede de una clase Juego")
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
		@testexamen = VerFal.new("")
	end
	it "Existe una instancia de preguntas verdadero falso?" do
		@testexamen.class.is_a?(VerFal)
	end
end
describe "Pruebas Preguntas Comparable Practica 8" do
	before :all do
		@t1 = VerFal.new("Hola",true,false)
		@t2 = VerFal.new("Que tal",true,false)
	end
	it "Existe el comparador? <" do
		(@t1 < @t2).should be true
	end
	it "Existe el comparador? >" do
		(@t1 > @t2).should be false
	end
	it "Existe el comparador? ==" do
		(@t1 == @t2).should be false
	end
	it "Existe el comparador? <=" do
		(@t1 <= @t2).should be true
	end
	it "Existe el comparador? >=" do
		(@t1 >= @t2).should be false
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
		@testInterfaz = Interfaz.new
	end
	it "Constructor" do
		@testInterfaz.is_a?(Interfaz)
	end
end
