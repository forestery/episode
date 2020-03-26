 public static byte[] charArray2ByteArray(char[] chars){
        int length = chars.length;
        byte[] result = new byte[length*2+2];
        int i = 0;
        for(int j = 0 ;j<chars.length;j++){
            //result[i++] = (byte)( (chars[j] & 0xFF00) >> 8 );
            //result[i++] = (byte)((chars[j] & 0x00FF)) ;
            result[i++] = (byte)( chars[j]  >> 8 );
            result[i++] = (byte)(chars[j] ) ;
        }
        char test22 = 0xFFFE;
        result[i++] = (byte)((test22 & 0x00FF)) ;
        result[i++] = (byte)( (test22 & 0xFF00) >> 8 );
        return result;
    }



//sample的长度为2，表示有2个char，在内存中占4个字节(byte)。
String sample = "测试";
//把String sample的value按char取出。Java内部char的编码为unicode双字节代表一个char。且使用大头编码。
//此处sample占用4个字节。byteOfSample的长度是4
byte[] byteOfSample = charArray2ByteArray(sample.toCharArray());

//byteOfSample是sample在内存中的字节流，所以可以使用utf_16BE编码还原为String。
String aaaab = new String(aaaaa, StandardCharsets.UTF_16BE);


/*

When you use GetBytes From a String in Java, The return result will depend on the default encode of your computer setting.(eg: StandardCharsetsUTF-8 or StandardCharsets.ISO_8859_1etc...).

So, whenever you want to getBytes from a String Object. Make sure to give a encode . like :

String sample = "abc";
Byte[] a_byte = sample .getBytes(StandardCharsets.UTF_8);

Let check what has happened with the code. In java, the String named sample , is stored by Unicode. every char in String stored by 2 byte.

sample :  value: "abc"   in Memory(Hex):  00 61 00 62 00 63
        a -> 00 61
        b -> 00 62
        c -> 00 63

But, When we getBytes From a String, we have

Byte[] a_byte = sample .getBytes(StandardCharsets.UTF_8)
//result is : 61 62 63
//length: 3 bytes

Byte[] a_byte = sample .getBytes(StandardCharsets.UTF_16BE)  
//result is : 00 61 00 62 00 63        
//length: 6 bytes

In order to get the oringle byte of the String. We can just read the Memory of the string and get Each byte of the String.Below is the sample Code:

public static byte[] charArray2ByteArray(char[] chars){
    int length = chars.length;
    byte[] result = new byte[length*2+2];
    int i = 0;
    for(int j = 0 ;j<chars.length;j++){
        result[i++] = (byte)( (chars[j] & 0xFF00) >> 8 );
        result[i++] = (byte)((chars[j] & 0x00FF)) ;
    }
    return result;
}

Usages:

String sample = "abc";
//First get the chars of the String,each char has two bytes(Java).
Char[] sample_chars = sample.toCharArray();
//Get the bytes
byte[] result = charArray2ByteArray(sample_chars).

//Back to String.
//Make sure we use UTF_16BE. Because we read the memory of Unicode of  
//the String from Left to right. That's the same reading 
//sequece of  UTF-16BE.
String sample_back= new String(result , StandardCharsets.UTF_16BE);

*/