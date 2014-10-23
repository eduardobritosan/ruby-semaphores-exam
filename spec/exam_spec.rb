require 'spec_helper'
require 'exam'

describe Examen do
	before :each do
		@ex= Examen.new("Que hora es?",[1,2,3,4])
	end
	describe "Pruebas de inicializacion" do
		it "Se crea la pregunta?" do
			@ex.question.should eq("Que hora es?")
		end
		it "Se crean las respuestas?" do
			@ex.respuestas.should eq([1,2,3,4])
		end
	end
	describe "Pruebas de metodos get" do
		it "Metodo para obter la pregunta" do
			@ex.get
		end
	end
end
