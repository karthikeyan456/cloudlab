package word_count;
import java.io.*;
import java.util.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.lib.input.*;
import org.apache.hadoop.mapreduce.lib.output.*;
import org.apache.hadoop.conf.Configuration;
public class wordcount{
       public static void main(String[] args) throws Exception{
           Configuration conf=new Configuration();
           Job job=new Job(conf,"Word Count");
           job.setJarByClass(wordcount.class);
           job.setMapperClass(map.class);
           job.setReducerClass(reduce.class);
           job.setCombinerClass(reduce.class);
           job.setOutputKeyClass(Text.class);
           job.setOutputValueClass(IntWritable.class);
           FileInputFormat.addInputPath(job,new Path(args[0]));
           FileOutputFormat.setOutputPath(job,new Path(args[1]));
           job.waitForCompletion(true);
       }

}
