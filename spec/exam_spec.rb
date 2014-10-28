require 'spec_helper'
require 'exam'

describe Examen do
	before :each do
		@ex= Examen.new("\nQue hora es?",['11:30','2:20','3:55','4:58'])
	end
	describe "Pruebas de inicializacion" do
		it "Se crea la pregunta?" do
			@ex.question.should eq("\nQue hora es?")
		end
		it "Se crean las respuestas?" do
			@ex.respuestas.should eq(['11:30','2:20','3:55','4:58'])
		end
	end
	describe "Pruebas de metodos get" do
		it "Metodo para obter la pregunta" do
			@ex.getquestion
		end
		it "Metodo para obtener las respuestas" do
			@ex.getanswers
		end
	end
	describe "Print final" do
		it "La pregunta es:" do
			@ex.printex
		end
	end

	describe "Pruebas de preguntas de practica 6" do
	end
end

describe List do
	before :each do
		@node = Nodo.new(1,2)
		@list = List.new
	end
	it "No existe un nodo" do
		@node.is_a?(Nodo)
	end
	it "Se extrae el primer elemento" do
		@list.shift
	end
	it "Se inserta un elemento" do
		@list.push(@node)
	end
	it "Se pueden insertar varios elementos" do
		newArray = [Nodo.new(1,3),Nodo.new(3,7)]
		@list.multipush(newArray)
	end
	it "Debe existir una lista con su cabeza" do
		@list.head.is_a?(Nodo)
	end
end	
