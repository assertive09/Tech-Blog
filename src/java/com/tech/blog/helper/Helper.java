package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;

public class Helper {
    
  public static boolean deleteFile(String path){
          boolean status =false;
          try {
          File filePath=new File(path);
          filePath.delete();
          status=true;
        }  catch(Exception e){
          e.printStackTrace();
           }         
  return status;
 }
  
  public static boolean saveFile(InputStream is , String path){
  
      boolean status=false;
      try{
      byte[] b=new byte[is.available()];
      is.read(b);
          FileOutputStream fos=new FileOutputStream(path);
          fos.write(b);
          fos.flush();
          fos.close();
          status=true;
      }
      catch(Exception e){
      e.printStackTrace();
      }
      return status;
  }
}