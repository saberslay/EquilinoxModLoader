import java.lang.instrument.Instrumentation;

public class ModAgent {

    public static void premain(String agentArgs, Instrumentation inst) {
        System.out.println("[EquilinoxModLoader] Agent loaded!");

        // Add transformer (non-retransformable, safe)
        inst.addTransformer(new GameTransformer());
    }
}
