extends Label


func _process(delta):
	self.text = "BLOOD GAUGE: " + str(Godstats.experience) + "mL"
