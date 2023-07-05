
public class Language {
    private static String lang_path = null;
    private static String[] all_language = new String[100];
    private static String[] all_path_lang = new String[100];
    private static int count = 0;
    protected static String current_lang = null;
    protected static String current_path_lang = null;
    
    public static void Language() {
        load_language();
        set_language();
    }
    
    private static void set_language() {
        int count;
        int choose;
        while(true) {
            count = 1;
            Lib.clear_console();
            System.out.println(">> SET LANGUAGE <<");
            for(String s : Language.all_language) {
                if(s == null) {
                    continue;
                }
                System.out.println(
                        String.valueOf(count) 
                        + ". " 
                        + String.valueOf(s) 
                        + " (" 
                        + String.valueOf(Language.all_path_lang[count-1].replace(Language.lang_path, "")) 
                        + ")"
                );
                count++;
            }
            System.out.println();
            choose = (int)Lib.int_input(" - Choose", null, false, true, false)-1;
            try {
                if(Language.all_language[choose] != null) {
                    Language.current_lang = Language.all_language[choose];
                    Language.current_path_lang = Language.all_path_lang[choose];
                    break;
                }
            } catch (Exception e) {
                continue;
            }
        }
    }
    
    private static void load_language() {
        Language.lang_path = Lib.read_config("lang_path");
        for(String s : Lib.lsdir(Language.lang_path)) {
            if(s.contains(".lang")) {
                Language.all_language[Language.count] = Lib.read_data(Language.lang_path + s, "name", true, false)[0];
                Language.all_path_lang[Language.count] = Language.lang_path + s;
                Language.count++;
            }
        }
    }
    
}
