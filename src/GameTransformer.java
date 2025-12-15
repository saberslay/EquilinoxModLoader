import java.lang.instrument.ClassFileTransformer;
import java.lang.instrument.IllegalClassFormatException;
import java.security.ProtectionDomain;

import javassist.ClassPool;
import javassist.CtClass;
import javassist.CtMethod;
import javassist.LoaderClassPath;
import javassist.expr.ExprEditor;
import javassist.expr.MethodCall;

public class GameTransformer implements ClassFileTransformer {

    @Override
	public byte[] transform(
			ClassLoader loader,
			String className,
			Class<?> classBeingRedefined,
			ProtectionDomain protectionDomain,
			byte[] classfileBuffer) {
			
		// TEST PRINT
        if (className != null) {
            System.out.println("[EquilinoxModLoader] injector loaded: " + className);
        }

		return null; // no modification yet
	}
}