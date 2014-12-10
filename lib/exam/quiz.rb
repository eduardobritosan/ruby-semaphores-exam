# -*- encoding : utf-8 -*-
 require "exam/version"

class Quiz
  RIGHT = :right
  WRONG = :wrong

  attr_accessor :name, :questions
  
  def initialize(name = "", &block)
    self.name = name
    self.questions = []

    @counter = 0
    instance_eval &block
  end

  def question(text, preguntas)
    q = SelSim.new(text, preguntas)
    questions << q 
    puts q if $DEBUG
    @counter = 0
  end

  def to_s
    out = <<"EOQUIZ"
#{self.name}

#{self.questions.join("\n")}
EOQUIZ
  end

  def wrong
    @counter += 1
    [@counter, WRONG]
  end

  def right
    @counter+= 1
    [@counter, RIGHT]
  end

  def title(title)
    @name = title
  end

  def run
    counter=0
    puts self.name+"\n\n"
    self.questions.each { |q| counter += 1 if q.question }
    puts "#{counter} respuestas correctas de un total de #{@questions.size}."
  end
end