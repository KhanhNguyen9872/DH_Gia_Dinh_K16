# KhanhNguyen9872

try:
    __import__('colorama')
except (ImportError, ModuleNotFoundError):
    __import__('os').system("{} -m pip install colorama".format(__import__('sys').executable))

class stdout:
    def __init__(self) -> None:
        try:
            __import__('colorama').just_fix_windows_console()
        except:
            raise OSError("Something went wrong! Cannot fix STDOUT CMD!")

        self.stdout = __import__('sys').stdout
        self.full_str = ""

    def hide_cursor(self) -> None:
        self.stdout.write('\033[?25l')

    def show_cursor(self) -> None:
        self.stdout.write('\033[?25h')

    def flush(self) -> None:
        self.stdout.flush()

    def print(self, string, end = "\n") -> None:
        if str(type(string)) == "<class 'bytes'>":
            raise TypeError("print() argument must be str, not bytes")

        return self.write(string + end)

    def write(self, string : str) -> None:
        if str(type(string)) == "<class 'bytes'>":
            raise TypeError("write() argument must be str, not bytes")

        self.stdout.write(string)
        self.flush()
        self.full_str += string

    def clear(self) -> None:
        
        if not self.full_str:
            return None

        if self.full_str[-1] != "\n":
            self.stdout.write("\n")

        for _ in range(len(self.full_str[:-1].split("\n"))):
            self.stdout.write("\x1b[1A\x1b[2K")
            self.flush()
        self.reset()

    def reset(self) -> None:
        self.full_str = ""

    def out(self) -> str:
        return self.full_str