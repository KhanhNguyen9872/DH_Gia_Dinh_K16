import khanhnguyen9872
import time
import random
import threading

is_exit = False

color = ["\033[94m", "\033[96m", "\033[92m", "\033[93m", "\033[91m", "\033[95m", "\033[0m"]

stdout = khanhnguyen9872.stdout()
stdout_2 = khanhnguyen9872.stdout()

wall_portrait = 13
wall_landscape = 4

landscape = wall_landscape
timeout = 0.05
boolvar = False
string_ball = "O"
string_wall_portrait = color[-1] + "="
string_wall_landspace = color[-1] + "|"

#### Ball
portrait = 1
bool_ball_portrait = True

### AUTO RESIZE
def resize():
	try:
		time.sleep(3)
		global wall_portrait, wall_landscape, is_exit
		while 1:
			if is_exit:
				return
			if random.randint(0, 1):
				wall_portrait = 5 + random.randint(1, 20)
			if random.randint(0, 1):
				wall_landscape = 2 + random.randint(1, 9)
			time.sleep(3)
	except KeyboardInterrupt:
		return

threading.Thread(target=resize).start()

#### MAIN
stdout_2.hide_cursor()
stdout_2.write(color[-1])
stdout_2.write("\n>> Hello World!\n>> Hey! What are you doing?\n[Ctrl + C] -> EXIT\n\n")

try:
	while 1:
		# stdout.write(string_wall_portrait*int(wall_portrait+len(string_ball)+2) + "\n")
		stdout.write(string_wall_portrait*int(wall_portrait+len(string_ball)+2) + "\n")
		stdout.write(
			str(f"{string_wall_landspace}" + " "*int(wall_portrait+len(string_ball)) + string_wall_landspace + "\n")*landscape
			+ ( 
				string_wall_landspace
				+ " "*portrait
			    + (random.choice(color) + string_ball)
			    + " "*int(wall_portrait-portrait)
			    + string_wall_landspace + "\n"
			) 
			+ str(f"{string_wall_landspace}" + " "*int(wall_portrait+len(string_ball)) + string_wall_landspace + "\n")*(wall_landscape-landscape-0) # -1, -2, -3,... cho trấn động, -0 là tĩnh lặng =)) 
		)
		stdout.write(string_wall_portrait * int(wall_portrait+len(string_ball)+2))

		if landscape > wall_landscape:
			landscape -= 1
		elif landscape < 0:
			landscape += 1
		else:
			if landscape == wall_landscape or landscape == 0:
				boolvar = not boolvar

			if boolvar:
				landscape -= 1
			else:
				landscape += 1

		# Ball
		if portrait > wall_portrait:
			portrait -= 1
		elif portrait < 0:
			portrait += 1
		else:
			if portrait == wall_portrait or portrait == 0:
				bool_ball_portrait = not bool_ball_portrait

			if bool_ball_portrait:
				portrait += 1
			else:
				portrait -= 1

		time.sleep(timeout)
		stdout.clear()
except KeyboardInterrupt:
	stdout.clear()
	stdout_2.clear()
	stdout_2.show_cursor()
	print("Created by KhanhNguyen9872!")
is_exit = True