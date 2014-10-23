require 'spec_helper'
require 'exam'

describe Examen do
	before :each do
		@examen = Examen.new("Que hora es?")
	end
	describe "Pruebas de inicializacion" do
		it "Se crea la pregunta?" do
			@examen.question.should eq("Que hora es?")
		end
		it "Se crean las respuestas?"
			@arrayprueba = ['1','2','3','4']
			@examen.respuestas.to_a == @hashprueba;
	end
end
