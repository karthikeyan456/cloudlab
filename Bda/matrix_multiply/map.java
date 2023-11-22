package matrix;
import java.util.*;
import java.io.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.conf.*;

public class map extends Mapper<LongWritable,Text,Text,Text>{

     public void map(LongWritable key,Text value,Context context) throws IOException, InterruptedException{
      Text outputkey=new Text();
      Text outputvalue=new Text();
      int m=2;
      int p=2;
      String[] indicesandvalues=value.toString().split(",");
      if(indicesandvalues[0].equals("M")){
          for(int k=0;k<p;k++){
             outputkey.set(indicesandvalues[1]+","+k);
                outputvalue.set(indicesandvalues[0]+","+indicesandvalues[2]+","+indicesandvalues[3]);
                context.write(outputkey,outputvalue);
          
          }
      }
      else{
         for(int i=0;i<m;i++){
             outputkey.set(i+","+indicesandvalues[2]);
             outputvalue.set("N"+","+indicesandvalues[1]+","+indicesandvalues[3]);
             context.write(outputkey,outputvalue);
         }
      }
     
     
     }
     }
