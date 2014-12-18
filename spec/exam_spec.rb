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

describe SelSim do
	before :all do
		@answerTest= SelSim.new("\nQue hora es?",['11:30','2:20','3:55','4:58'])
	end
	describe "Pruebas de inicializacion" do
		it "Se crea la pregunta? y funcionan los gets" do
			@answerTest.getquestion.is_a?(String)
		end
		it "Se crean las respuestas? y funcionan los get" do
			@answerTest.getanswers.is_a?(Respuesta)
		end
	end
end
describe DoubleList do
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
		@pregunta1 = SelSim.new("¿Cual es el tipo del objeto en el siguiente codigo Ruby?\nclass Objeto\n end",
								["a) Una instancia de la clase Class\n","b) Una constante\n","c) Un objeto\n","d) Ninguna de las anteriores"])					
		@pregunta2 = VerFal.new("Es apropiado que una clase Tablero herede de una clase Juego",true,false)
		@preguntas = DoubleList.new
		@preguntas.push(@pregunta1)
		@preguntas.push(@pregunta2)
	end
	it "Comprobacion pop Examen" do
		@preguntas.pop.is_a?(SelSim)
	end
	it "Comprobacion pop VerFal" do
		@preguntas.pop.is_a?(VerFal)
	end
end

describe Examen do
	before :all do
		@testexamen = Examen.new
		@testexamen.includeQuestionBeggining!(@pregunta1)
		@testexamen.includeQuestionBeggining!(@pregunta1)
	end
	it "Existe una instancia examen?" do
		@testexamen.class.is_a?(Examen)
	end
end

describe VerFal do
	before :all do
		@testVerFal = VerFal.new("",false,true)
	end
	it "Existe una instancia de preguntas verdadero falso?" do
		@testVerFal.class.is_a?(VerFal)
	end
end

describe "Pruebas Preguntas Comparable Practica 8" do
	before :all do
		@t1 = VerFal.new("El sol es azul",false,true)
		@t2 = VerFal.new("El caballo blanco de santiago es blanco",true,false)
	end
	it "Existe el comparador? <" do
		expect(@t1 < @t2).to be false
	end
	it "Existe el comparador? >" do
		expect(@t1 > @t2).to be true
	end
	it "Existe el comparador? ==" do
		expect(@t1 == @t2).to be false
	end
	it "Existe el comparador? <=" do
		expect(@t1 <= @t2).to be false
	end
	it "Existe el comparador? >=" do
		expect(@t1 >= @t2).to be true
	end
end

describe "Pruebas Enumerable lista Practica 8" do
	before :all do
		@lista = List.new
		@lista.push(@t1)
		@lista.push(@t2)
	end
	it "Prueba de existencia each" do
		expect(@lista.max).to eq(@t1)
	end
end

describe Interfaz do
	before :all do
		@ans2 = Respuesta.new("Blanco",true)
		@ans3 = Respuesta.new("Negro",false)
		@ans4 = Respuesta.new("Verde",false)
		@ans5 = Respuesta.new("Marron",false)
		@ans6 = Respuesta.new("Naranja",false)
		@t3 = SelSim.new("Color del caballo blanco de Santiago?",[@ans2,@ans3,@ans4,@ans5,@ans6])
		@t1 = VerFal.new("El sol es azul",false,true)
		@t2 = VerFal.new("El caballo blanco de santiago es blanco",true,false)
		@examen = Examen.new
		@examen.includeQuestionBeggining!(@t3)
		@examen.includeQuestionBeggining!(@t2)
		@examen.includeQuestionBeggining!(@t1)
		@testInterfaz = Interfaz.new(@examen)
		@testInterfaz.opcion = 0
	end
	it "Constructor" do
		@testInterfaz.is_a?(Interfaz)
	end
	it "Interfaz de usuario" do
		expect(@testInterfaz.interface).to be true
	end
end


describe Quiz do
  
	before :all do  
		@quiz = Quiz.new("Cuestionario de LPP 05/12/2014") {
		question '¿Cuántos argumentos de tipo bloque puede recibir un método?',
		right =>'1',
		wrong =>'2',
		wrong =>'muchos',
		wrong =>'los que defina el usuario'
		question "En Ruby los bloques son objetos que contienen código",
		wrong =>'Cierto',
		right =>'Falso'
		}
	end
	it "Constructor" do
	@quiz.is_a?(Quiz)
	end	
	
	
	it "to_s" do
		expect(@quiz.to_s).to eq("Hola"); 
	end
	
	
end


describe "Reversible" do
	before :all do
		@ans2 = Respuesta.new("Blanco",true)
		@ans3 = Respuesta.new("Negro",false)
		@ans4 = Respuesta.new("Verde",false)
		@t3 = SelSim.new("Color del caballo blanco de Santiago?",[@ans2,@ans3,@ans4])
		@t1 = VerFal.new("El sol es azul",false,true)
		@t2 = VerFal.new("El caballo blanco de santiago es blanco",true,false)
		@examen = Examen.new
		@examen.includeQuestionBeggining!(@t3)
		@examen.includeQuestionBeggining!(@t2)
		@examen.includeQuestionBeggining!(@t1)
		@examenRev = @examen.reverse
		@testInterfazReversa = Interfaz.new(@examenRev)
		@testInterfazReversa.opcion = 0
	end
	it "Constructor" do
		@testInterfazReversa.is_a?(Interfaz)
	end
	it "Prueba reversa 1" do
		@examenRev.is_a?(Examen)
		expect(@examenRev.head) == @t1
		expect(@testInterfazReversa.interface).to be true
	end
end

describe "OrangeTree pruebas de inicializacion" do
	before :all do
		@arbol1 = OrangeTree.new
	end
	it "Comprobacion de inicializacion del naranjero" do
		@arbol1.is_a?(OrangeTree)
	end
	it "Comprobacion del metodo height del naranjero" do
		expect(@arbol1.height).to eq(0)
	end
	it "Comprobacion del metodo que cuenta las naranjas" do
		expect(@arbol1.count_the_oranges).to eq(0)
	end
	it "Existencia de las variables de instancia" do
		expect(@arbol1.instance_variable_defined?(:@height)).to be true
		expect(@arbol1.instance_variable_defined?(:@orange_count)).to be true
		expect(@arbol1.instance_variable_defined?(:@alive)).to be true
	end
end

describe "OrangeTree pruebas de funcionamiento" do
	before :all do
		@arbol2 = OrangeTree.new
		for i in 0..5
   			@arbol2.one_year_passes
		end
	end
	it "Comprobacion del metodo que coge una naranja" do
		expect(@arbol2.pick_an_orange).to eq("You pick a juicy, delicious orange!")
	end
end

describe "OrangeTree pruebas crecimiento" do
	before :all do
		@arbol3 = OrangeTree.new
	end
	it "Comprobacion del metodo que cuenta las naranjas" do
		expect(@arbol3.one_year_passes).to eq("This year your tree grew to 0.4m tall," +
											  " but is still too young to bear fruit.")
	end
end

