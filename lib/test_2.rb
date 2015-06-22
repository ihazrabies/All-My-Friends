class References
	attr_reader :power

	def initialize(args)
		@powers = powers(args)
	end 

	Power = Struct.new(:power, :cost)
	def powers(args)
		args.collect {|cell|
			Power.new(cell[0], cell[1])}
	end 

	def show_powers()
		powers.each {|power|
			puts power.power, power.cost}
	end 
end 

data = ["LAZER BURN", 5]
powers = References.new(data)

powers.show_powers()