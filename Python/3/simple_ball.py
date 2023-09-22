import khanhnguyen9872
import time
import random
import threading

is_exit = False
color = ["\033[94m", "\033[96m", "\033[92m", "\033[93m", "\033[91m", "\033[95m", "\033[0m"]

stdout = khanhnguyen9872.stdout()
stdout_2 = khanhnguyen9872.stdout()

wall_portrait = random.randint(4, 31)
wall_landscape = random.randint(2, 13)

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
def __auto_resize__():
    threading.Thread(target=__wall_portrait__).start()
    threading.Thread(target=__wall_landscape__).start()

def __wall_portrait__():
    global wall_portrait, is_exit, timeout
    orig = wall_portrait
    try:
        time.sleep(5)
        while 1:
            if is_exit:
                return
            if random.randint(0, 1):
                orig = random.randint(4, 35)
                while orig != wall_portrait:
                    if orig > wall_portrait:
                        wall_portrait += 1
                    elif orig < wall_portrait:
                        wall_portrait -= 1
                    time.sleep(timeout + 0.03)
            time.sleep(5)
    except KeyboardInterrupt:
        return

def __wall_landscape__():
    global wall_landscape, is_exit, timeout
    orig = wall_landscape
    try:
        time.sleep(5)
        while 1:
            if is_exit:
                return
            if random.randint(0, 1):
                orig = random.randint(2, 15)
                while orig != wall_landscape:
                    if orig > wall_landscape:
                        wall_landscape += 1
                    elif orig < wall_landscape:
                        wall_landscape -= 1
                    time.sleep(timeout + 0.03)
            time.sleep(5)
    except KeyboardInterrupt:
        return

#### MAIN
stdout_2.hide_cursor()
stdout_2.write(color[-1])
stdout_2.write("\n>> Hello World!\n>> Hey! What are you doing?\n\n[Ctrl + C] -> EXIT\n\n")

try:
    threading.Thread(target=__auto_resize__).start()
    while 1:
        __string_wall_portrait__ = string_wall_portrait * (wall_portrait + len(string_ball) + 2)
        __string_wall_landscape__ = string_wall_landspace + " " * (wall_portrait+len(string_ball)) + string_wall_landspace + "\n"
        
        stdout.write(__string_wall_portrait__ + "\n")
        stdout.write(
            __string_wall_landscape__ * landscape
            + ( 
                string_wall_landspace
                + " " * portrait
                + random.choice(color) 
                + string_ball
                + " " * (wall_portrait - portrait)
                + (string_wall_landspace if wall_portrait + 1 > portrait else f"{string_wall_landspace}<<==") 
                + "\n"
            ) 
            + __string_wall_landscape__ * (wall_landscape - landscape)
        )
        stdout.write(__string_wall_portrait__)

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
exit()