package word_count;
import java.io.*;
import java.util.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.lib.input.*;
import org.apache.hadoop.mapreduce.lib.output.*;

public class map extends Mapper<Object,Text,Text,IntWritable> {
    
    public void map(Object key,Text value, Context context) throws IOException, InterruptedException{
        StringTokenizer itr=new StringTokenizer(value.toString());
        while(itr.hasMoreTokens()){
          context.write(new Text(itr.nextToken()),new IntWritable(1));
        
        }
    
    }



}

