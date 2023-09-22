import khanhnguyen9872
import time
import random

color = ["\033[94m", "\033[96m", "\033[92m", "\033[93m", "\033[91m", "\033[95m", "\033[0m"]

stdout = khanhnguyen9872.stdout()
stdout_2 = khanhnguyen9872.stdout()

size = 35 # landscape
line = 9 # portrait

count = line
timeout = 0.2
boolvar = False
string = "O"
string_wall_portrait = color[-1] + "="
string_wall_landspace = color[-1] + "|"

#### Ball
portrait = 1
bool_ball_portrait = True

stdout_2.hide_cursor()
stdout_2.write(color[-1])
stdout_2.write("\n>> Hello World!\n>> Hey! What are you doing?\n\n")
stdout_2.write(string_wall_portrait*int(size+len(string)+2) + "\n")

try:
	while 1:
		stdout.write(
			str(f"{string_wall_landspace}" + " "*int(size+len(string)) + string_wall_landspace + "\n")*count
			+ ( 
				string_wall_landspace
				+ " "*portrait
			    + (random.choice(color) + string)
			    + " "*int(size-portrait)
			    + string_wall_landspace + "\n"
			) 
			+ str(f"{string_wall_landspace}" + " "*int(size+len(string)) + string_wall_landspace + "\n")*(line-count-0) # -1, -2, -3,... cho trấn động, -0 là tĩnh lặng =)) 
		)
		stdout.write(string_wall_portrait * int(size+len(string)+2))

		if count >= line or count <= 0:
			boolvar = not boolvar

		if boolvar:
			count -= 1
		else:
			count += 1

		# Ball
		if portrait >= size or portrait <= 0:
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