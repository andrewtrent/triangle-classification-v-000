require 'pry'
class Triangle



  def initialize(a,b,c)
    @sides = []
    @sides << a
    @sides << b
    @sides << c
  end

  def sum
    @sides.reduce(0, :+)
  end

  def valid?
    @val = nil
    @sides.each do |side|
      if side <= 0
        @val = false
      elsif (self.sum - side) <= side
        @val = false
      else
        true
      end
    end
    @val
  end

  class TriangleError < StandardError
    def message
      "That is not a triangle."
    end
  end

  def type
    @counts = []
    @sides.each do |side|
      @counter = 0
      @sides.each do |comp_side|
        if side == comp_side
          @counter += 1
        end
      end
      @counts << @counter
    end

    if @counts.include?(2)
      :isosceles
    elsif @counts.include?(3)
      :equilateral
    else
      :scalene
    end

  end

  def kind
    if self.valid? == false
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    else
      self.type
    end
  end

end
