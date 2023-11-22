package word_count;
import java.io.*;
import java.util.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.lib.input.*;
import org.apache.hadoop.mapreduce.lib.output.*;

public class reduce extends Reducer<Text,IntWritable,Text,IntWritable> {
          
          public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {
                   int sum=0;
                   for (IntWritable i: values){
                       sum+=i.get();
                   }
                   context.write(key,new IntWritable(sum));
          }

}
