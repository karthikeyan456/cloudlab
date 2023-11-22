package matrix;
import java.util.*;
import java.io.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.conf.*;

public class reduce extends Reducer<Text,Text,Text,Text> {

              public void reduce(Text key, Iterable<Text> values, Context context) throws IOException,InterruptedException{
                    HashMap<Integer,Float> hashA=new HashMap<Integer,Float>();
                    HashMap<Integer,Float> hashB=new HashMap<Integer,Float>();
                    String[] arr;
                    for(Text value:values){
                         arr=value.toString().split(",");
                         if(arr[0].equals("M")){
                             hashA.put(Integer.parseInt(arr[1]),Float.parseFloat(arr[2]));
                             
                         }
                         else{
                             hashB.put(Integer.parseInt(arr[1]),Float.parseFloat(arr[2]));
                         }
                    }
                    float result=0.0f;
                    float mij,njk;
                    for(int j=0;j<2;j++){
                         mij=hashA.containsKey(j) ? hashA.get(j):0.0f;
                         njk=hashB.containsKey(j) ? hashB.get(j):0.0f;
                         result+=mij*njk;
                         
                    }
                    context.write(null,new Text(key.toString()+","+Float.toString(result)));
              }
              
              
              }
