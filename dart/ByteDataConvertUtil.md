```dart
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';

class ByteDataConvertUtil {
  static final String CHAR_ENCODE = "UTF-8";

  static int binToInt(Uint8List paramArrayOfByte, int paramInt1, int paramInt2) {
    paramInt2--;
    int i = 0;
    while (paramInt2 >= 0) {
      i = (i << 8) | (paramArrayOfByte[paramInt1] & 0xFF);
      paramInt2--;
      paramInt1++;
    }
    return i;
  }

  static int binToLong(Uint8List paramArrayOfByte, int paramInt1, int paramInt2) {
    paramInt2--;
    int l = 0;
    while (paramInt2 >= 0) {
      l = (l << 8) | (paramArrayOfByte[paramInt1] & 0xFF);
      paramInt2--;
      paramInt1++;
    }
    return l;
  }

  static void binnCat(Uint8List paramArrayOfByte, int paramInt1, int paramInt2) {
    int j = 0;
    int i = paramInt1;
    while (i < paramInt2 + paramInt1) {
      int b = paramArrayOfByte[j];
      i++;
      j++;
    }
  }

  static void binnCatArray(Uint8List paramArrayOfByte1, Uint8List paramArrayOfByte2, int paramInt1, int paramInt2) {
    int i = 0;
    while (i < paramInt2) {
      paramArrayOfByte2[i] = paramArrayOfByte1[paramInt1];
      i++;
      paramInt1++;
    }
  }

  static int bit8Array2Int(Uint8List paramArrayOfByte) {
    int k = paramArrayOfByte.length - 1;
    int i = k;
    int j = 0;
    while (i >= 0) {
      j += paramArrayOfByte[i] << (k - i);
      i--;
    }
    return j;
  }

  static int byte2Int(int paramByte) {
    return (paramByte >= 0) ? paramByte : (paramByte + 256);
  }

  static Uint8List int2Bit8(int paramInt) {
    int b = paramInt;
    Uint8List arrayOfByte = Uint8List(8);
    for (int i = 0; i <= 7; i++) {
      arrayOfByte[i] = (b & 0x1);
      b = (b >> 1);
    }
    return arrayOfByte;
  }

  static int int2Byte(int paramInt) {
    return (paramInt & 0xFF);
  }

  static Uint8List intToBin(int paramInt1, int paramInt2) {
    Uint8List arrayOfByte = Uint8List(paramInt2);
    int i = paramInt2 - 1;
    for (int j = 0; i >= 0; j++) {
      arrayOfByte[j] = (paramInt1 >> (i * 8));
      i--;
    }
    return arrayOfByte;
  }

  static Uint8List intToBinArray(int paramInt1, Uint8List paramArrayOfByte, int paramInt2, int paramInt3) {
    while (--paramInt3 >= 0) {
      paramArrayOfByte[paramInt2] = (paramInt1 >> (paramInt3 * 8));
      paramInt3--;
      paramInt2++;
    }
    return paramArrayOfByte;
  }

  static Uint8List intToBinReverseArray(int paramInt1, int paramInt2) {
    Uint8List arrayOfByte1 = intToBin(paramInt1, paramInt2);
    Uint8List arrayOfByte2 = Uint8List(arrayOfByte1.length);
    for (int i = 0; i < arrayOfByte2.length; i++)
      arrayOfByte2[i] = arrayOfByte1[arrayOfByte1.length - 1 - i];
    return arrayOfByte2;
  }

  static void longToBin(int paramLong, Uint8List paramArrayOfByte, int paramInt1, int paramInt2) {
    while (--paramInt2 >= 0) {
      paramArrayOfByte[paramInt1] = (paramLong >> (paramInt2 * 8));
      paramInt2--;
      paramInt1++;
    }
  }

  static Uint8List longToBinArray(int paramLong, int paramInt) {
    Uint8List arrayOfByte = Uint8List(paramInt);
    int i = paramInt - 1;
    for (int j = 0; i >= 0; j++) {
      arrayOfByte[j] = (paramLong >> (i * 8));
      i--;
    }
    return arrayOfByte;
  }

  static Uint8List stringToByte(String paramString1) {
    if (paramString1 != null)
      try {
        return utf8.encode(paramString1);
      } catch (Exception e) {
        print(e.toString());
      }
    return Uint8List(0);
  }

  static Uint8List byteMerger(Uint8List paramArrayOfByte1, Uint8List paramArrayOfByte2) {
    Uint8List arrayOfByte = Uint8List(paramArrayOfByte1.length + paramArrayOfByte2.length);
    for (int i = 0; i < paramArrayOfByte1.length; i++) {
      arrayOfByte[i] = paramArrayOfByte1[i];
    }
    for (int i = 0; i < paramArrayOfByte2.length; i++) {
      arrayOfByte[paramArrayOfByte1.length + i] = paramArrayOfByte2[i];
    }
    return arrayOfByte;
  }

  static String bytesToHexString(Uint8List paramArrayOfByte) {
    StringBuffer stringBuffer = StringBuffer();
    if (paramArrayOfByte != null && paramArrayOfByte.length > 0) {
      for (int i = 0; i < paramArrayOfByte.length; i++) {
        String str = paramArrayOfByte[i].toRadixString(16).padLeft(2, '0');
        stringBuffer.write(str);
        stringBuffer.write(" ");
      }
      return stringBuffer.toString();
    }
    return null;
  }

  static String bytesToHexString2(Uint8List paramArrayOfByte) {
    StringBuffer stringBuffer = StringBuffer();
    if (paramArrayOfByte != null && paramArrayOfByte.length > 0) {
      for (int i = 0; i < paramArrayOfByte.length; i++) {
        String str = paramArrayOfByte[i].toRadixString(16).padLeft(2, '0');
        stringBuffer.write(str);
      }
      return stringBuffer.toString();
    }
    return null;
  }

  static List<String> bytesToHexStrings(Uint8List paramArrayOfByte) {
    if (paramArrayOfByte != null && paramArrayOfByte.length > 0) {
      List<String> arrayOfString = List<String>(paramArrayOfByte.length);
      for (int i = 0; i < paramArrayOfByte.length; i++) {
        String str2 = paramArrayOfByte[i].toRadixString(16).padLeft(2, '0');
        String str1 = str2;
        if (str2.length == 1) {
          str1 = "0" + str2;
        }
        arrayOfString[i] = str1;
      }
      return arrayOfString;
    }
    return null;
  }

  static int bytesToInt(Uint8List paramArrayOfByte) {
    StringBuffer stringBuffer = StringBuffer();
    for (int i = paramArrayOfByte.length - 1; i >= 0; i--) {
      String str = paramArrayOfByte[i].toRadixString(16).padLeft(2, '0');
      stringBuffer.write(str);
    }
    return int.parse(stringBuffer.toString(), radix: 16);
  }

  static String byteToString(Uint8List paramArrayOfByte) {
    try {
      return utf8.decode(paramArrayOfByte);
    } catch (Exception e) {
      print(e.toString());
      return "";
    }
  }

  static Uint8List getBytesByFilePath(String paramString) {
    try {
      File file = File(paramString);
      List<int> fileBytes = file.readAsBytesSync();
      return Uint8List.fromList(fileBytes);
    } catch (Exception e) {
      print(e.toString());
    }
    return null;
  }

  static Uint8List getJsonByte(String paramString) {
    return stringToByte(paramString);
  }

  static Uint8List getMacBytes(String paramString) {
    List<String> arrayOfString = paramString.split(":");
    Uint8List arrayOfByte = Uint8List(6);
    for (int i = 0; i < arrayOfString.length; i++) {
      arrayOfByte[i] = int.parse(arrayOfString[i], radix: 16);
    }
    return arrayOfByte;
  }

  static String getStrBytes(Uint8List paramArrayOfByte, int paramInt1, int paramInt2) {
    if (paramArrayOfByte.length < paramInt1 + paramInt2)
      return null;
    String str = "";
    for (int i = 0; i < paramInt2; i++) {
      str += "${paramArrayOfByte[paramInt1 + i].toRadixString(16).padLeft(2, '0')}";
    }
    return str;
  }

  static String i2b(int paramInt) {
    return paramInt.toRadixString(16)[0];
  }

  static T invertArray<T>(T paramT) {
    int j = paramT.length;
    Object object = List.from(paramT);
    int i = 0;
    int k = j - 1;
    while (i < j ~/ 2) {
      var t = object[i];
      object[i] = object[k];
      object[k] = t;
      i++;
      k--;
    }
    return object;
  }

  static int toRevInt(Uint8List paramArrayOfByte, int paramInt1, int paramInt2) {
    int i = 0;
    paramInt1 = paramInt1 + paramInt2 - 1;
    int j = 0;
    while (i < paramInt2) {
      j = (j << 8) | (paramArrayOfByte[paramInt1] & 0xFF);
      i++;
      paramInt1--;
    }
    return j;
  }
}
```