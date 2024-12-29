def hour(t):return int((t/3600)%24)
def minute(t):return int((t%3600)/60)
def second(t):return int((t%3600)%60)

def calc(num):
	z="AM"
	h=hour(num)
	if h > 12:
		z="PM"
		h -= 12
	return "{}:{}:{} {}".format(h, minute(num), second(num), z)

print(calc(3750))
print(calc(51100))
print(calc(38000))