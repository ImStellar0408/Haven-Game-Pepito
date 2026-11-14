extends Control


func _input(event) -> void:
	if event.is_action("map"):
		if Global.atril_selected == 1:
			$Mapa1.show()
		elif Global.atril_selected == 2:
			$Mapa2.show()
		elif Global.atril_selected == 3:
			$Mapa3.show()
		elif Global.atril_selected == 4:
			$Mapa4.show()
		elif Global.atril_selected == 5:
			$Mapa5.show()
	elif !event.is_action("map"):
		$Mapa1.visible = false;
		$Mapa2.visible = false;
		$Mapa3.visible = false;
		$Mapa4.visible = false;
		$Mapa5.visible = false;
