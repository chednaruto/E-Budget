/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rd.ebudget.tools;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author Mr.Tue
 */
public class AES128 {

    private static String algorithm = "AES";
    private static byte[] keyValue = new byte[]{'e', 'o', 'f', 'f', 'i', 'c', 'e', 'A', 'u', 't', 'h', 'e', 'n', 'K', 'e', 'y'};

    // Performs decryption
    public String decrypt(String encryptedText,String SecurityKey) throws Exception {
        // generate key
        Key key = generateKey();
        //System.out.println(key);
        Cipher chiper = Cipher.getInstance(algorithm);
        chiper.init(Cipher.DECRYPT_MODE, key);
        byte[] decordedValue = decode(encryptedText);
        byte[] decValue = chiper.doFinal(decordedValue);
        String decryptedValue = new String(decValue);
        return decryptedValue;
    }
    
    // generateKey() is used to generate a secret key for AES algorithm
    private static Key generateKey() throws Exception {
        Key key = new SecretKeySpec(keyValue, algorithm);
        return key;
    }

    private static String encode(byte[] byteArray) {
        StringBuilder buf = new StringBuilder();
        int intVal = 0;
        String frag = "";
        for (byte b : byteArray) {
            intVal = (int) (0xff & b);
            frag = Integer.toHexString(intVal);
            if (1 == frag.length()) {
                frag = "0" + frag;
            }
            buf.append(frag);
        }
        //System.out.println("test enKey" + buf.toString());
        return buf.toString();
    }

    private static byte[] decode(String textString) {
        byte[] byteArray = new byte[(textString.length() / 2)];
        int intVal = 0;
        String frag = "";
        int c1 = 0;
        for (int i = 0; i < byteArray.length; i++) {
            c1 = (i * 2);
            frag = textString.substring(c1, (c1 + 2));
            intVal = Integer.parseInt(frag, 16);
            byteArray[i] = (byte) (0xff & intVal);
        }
        return byteArray;
    }
}
