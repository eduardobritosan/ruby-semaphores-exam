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
	describe "Pruebas de listas\n" do
		it "No existe un nodo" do
			@node.is_a?(Nodo)
		end
	end	
end
