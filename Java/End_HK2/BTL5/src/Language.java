
public class Language {
    private final String lang_path = "./data/lang/";
    private String[] all_language = new String[100];
    private String[] all_path_lang = new String[100];
    private int count = 0;
    public String current_lang = "";
    public String current_path_lang = "";
    
    public Language() {
        load_language();
        set_language();
    }

    public String Lang() {
        return current_lang;
    }
    
    public String Path() {
        return current_path_lang;
    }
    
    public void set_language() {
        int count;
        int choose;
        while(true) {
            count = 1;
            Lib.clear_console();
            System.out.println(">> SET LANGUAGE <<");
            for(String s : this.all_language) {
                if(s == null) {
                    continue;
                }
                System.out.println(
                        String.valueOf(count) 
                        + ". " 
                        + String.valueOf(s) 
                        + " (" 
                        + String.valueOf(this.all_path_lang[count-1].replace(this.lang_path, "")) 
                        + ")"
                );
                count++;
            }
            System.out.println();
            choose = (int)Lib.int_input(" - Choose", null, false, true, false)-1;
            try {
                if(this.all_language[choose] != null) {
                    this.current_lang = this.all_language[choose];
                    this.current_path_lang = this.all_path_lang[choose];
                    break;
                }
            } catch (Exception e) {
                continue;
            }
        }
    }
    
    public void load_language() {
        for(String s : Lib.lsdir(this.lang_path)) {
            if(s.contains(".lang")) {
                this.all_language[this.count] = Lib.read_data(this.lang_path + s, "name")[0];
                this.all_path_lang[this.count] = this.lang_path + s;
                this.count++;
            }
        }
    }
    
}
