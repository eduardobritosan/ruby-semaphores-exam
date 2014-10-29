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
		@list = List.new
	end
	it "No existe un nodo" do
		@node.is_a?(Nodo)
	end
	it "Se extrae el primer elemento" do
		@list.shift
	end
	it "Se inserta un elemento" do
		@list.push(4)
	end
end	
describe "Preguntas simples practica 6" do
	before :all do
		@pregunta1 = Examen.new("\tclass Xyz\n\t\tdef pots\n\t\t\t@nice\n\t\tend\n\tend\n\txyz = Xyz.new\n\tp xyz.pots\n",
								['a) #<Xyz:0xa000208>\n','b) nil\n','c) 0\n','d) Ninguna de las anteriores'])
		@pregunta2 = Examen.new("hash_raro = {\n\t[1, 2, 3] => Object.new(),\n\tHash.new => :toto\n}",
								['a) Cierto','b) Falso'])
		@pregunta3 = Examen.new('\tclass Array\n\t\tdef say_hi\n\t\t\t"HEY!"\n\t\tend\n\tend\n\t\np [1, "bob".say_hi]\n',
								['a) 1','b) bob','c) HEY','d) Ninguna de las anteriores'])
		@pregunta4 = Examen.new('\tclass Objeto\n\tend\n',
								['a) Una instancia de la clase Class','b) Una constante','c) Un objeto','d) Ninguna de las anteriores'])						
		@pregunta5 = Examen.new('Es apropiado que una clase Tablero herede de una clase Juego',
								['a) Cierto','b) Falso'])
		@preguntas = List.new
		@preguntas.push(@pregunta1)
		@preguntas.push(@pregunta2)
		@preguntas.push(@pregunta3)
		@preguntas.push(@pregunta4)
		@preguntas.push(@pregunta5)
	end
	it "Pregunta 1" do
		@preguntas.head.value.getquestion.should eq("Es apropiado que una clase Tablero herede de una clase Juego")
		@preguntas.head.value.getanswers.should eq(['a) Cierto','b) Falso'])
		@preguntas.shift
	end
	it "Pregunta 2" do
		@preguntas.head.value.getquestion.should eq("\tclass Objeto\n\tend\n")
		@preguntas.head.value.getanswers.should eq(['a) Una instancia de la clase Class','b) Una constante','c) Un objeto','d) Ninguna de las anteriores'])
		@preguntas.shift
	end
	it "Pregunta 3" do
		@preguntas.head.value.getquestion.should eq("\tclass Array\n\t\tdef say_hi\n\t\t\t'HEY!'\n\t\tend\n\tend\n\t\np [1, 'bob'.say_hi]\n")
		@preguntas.head.value.getanswers.should eq(['a) 1','b) bob','c) HEY','d) Ninguna de las anteriores'])
		@preguntas.shift
	end
	it "Pregunta 4" do
		@preguntas.head.value.getquestion.should eq("hash_raro = {\n\t[1, 2, 3] => Object.new(),\n\tHash.new => :toto\n}")
		@preguntas.head.value.getanswers.should eq(['a) Cierto','b) Falso'])
		@preguntas.shift
	end
	it "Pregunta 5" do
		@preguntas.head.value.getquestion.should eq("\tclass Xyz\n\t\tdef pots\n\t\t\t@nice\n\t\tend\n\tend\n\txyz = Xyz.new\n\tp xyz.pots\n")
		@preguntas.head.value.getanswers.should eq(['a) #<Xyz:0xa000208>\n','b) nil\n','c) 0\n','d) Ninguna de las anteriores'])
		@preguntas.shift
	end
	
	
	
	
end