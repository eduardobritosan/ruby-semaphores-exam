require 'spec_helper'
require 'exam'

describe Examen do
	before :all do
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
		@list = DoubleList.new
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
								['a) Una instancia de la clase Class\n','b) Una constante\n','c) Un objeto\n','d) Ninguna de las anteriores'])					
		@pregunta2 = VerFal.new('Es apropiado que una clase Tablero herede de una clase Juego')
		@preguntas = DoubleList.new
		@preguntas.push(@pregunta1)
		@preguntas.push(@pregunta2)
	end
	it "Pregunta 1" do
		@preguntas.head.value.getquestion.should eq("¿Cual es el tipo del objeto en el siguiente codigo Ruby?\nclass Objeto\n end")
		@preguntas.head.value.getanswers.should eq(['a) Una instancia de la clase Class\n','b) Una constante\n','c) Un objeto\n','d) Ninguna de las anteriores'])
		@preguntas.pop
	end
	it "Pregunta 2" do
		@preguntas.head.value.getquestion.should eq("Es apropiado que una clase Tablero herede de una clase Juego")
		@preguntas.head.value.getanswers.should eq(['a) Cierto','b) Falso'])
		
	end
	
	
	
	
end
