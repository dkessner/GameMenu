//
// Program
//
// Darren Kessner
// Marlborough School
//


import java.util.*;
import java.io.*;
import java.nio.file.*;
import processing.core.*;


public class Program
{
    public Program(PApplet papplet, String[] commands, String workingDirectory)
    {
        this.papplet = papplet;

        if (System.getProperty("os.name").equals("Mac OS X"))
        {   
            // hacks for OSX
            
            if (commands.length == 2 && commands[0].equals("java"))
            {
                // Java: need to specify java.library.path on command line

                String libpath = "-Djava.library.path=" +
                    System.getProperty("user.dir") + "/../lib";

                this.commands = new String[commands.length + 1];
                this.commands[0] = "java";
                this.commands[1] = libpath;
                this.commands[2] = commands[1];
            }
            else 
            {
                // Processing: processing-java export on OSX creates .app 
                // rather than executable script, so we use "open -a"

                this.commands = new String[commands.length + 2];
                this.commands[0] = "open";
                this.commands[1] = "-a";
                for (int i=0; i<commands.length; i++)
                    this.commands[i+2] = commands[i];
            }

            /*
            System.out.println("Hacked commands for OSX:");
            System.out.println(Arrays.toString(this.commands));
            */
        }
        else
        {
            this.commands = commands;
        }

        this.workingDirectory = workingDirectory;
        
        // read in properties from info.txt

        HashMap<String, String> properties = new HashMap<String, String>();

        try
        {
            Path path = Paths.get(workingDirectory + "/info.txt");
            List<String> lines = Files.readAllLines(path);

            for (String line : lines)
            {
                String[] tokens = line.split(" ");
                if (tokens.length == 0) continue;
                String key = tokens[0];
                String value = String.join(" ", Arrays.copyOfRange(tokens, 1, tokens.length));
                
                properties.put(key, value);
            }
        }
        catch (IOException e)
        {
            System.out.println(e);
        }

        // fill in fields

        this.title = properties.containsKey("title") ? properties.get("title") : Arrays.toString(commands);
        this.screenshotFilename = properties.containsKey("screenshot") ? properties.get("screenshot") : null;
        this.author = properties.containsKey("author") ? properties.get("author") : "Author Unknown";
        this.date = properties.containsKey("date") ? properties.get("date") : "";
    }

    public PImage screenshot()
    {
        String temp = workingDirectory + "/data/" + screenshotFilename;

        try
        {
            if (screenshotImage == null)
            {
                screenshotImage = this.papplet.loadImage(temp);
            }
        }
        catch (Exception e)
        {
            System.out.println("caught");
            System.out.println(e.getMessage());
        }

        return screenshotImage;
    }

    private PApplet papplet;

    public final String[] commands;
    public final String workingDirectory;

    public final String title;

    private String screenshotFilename;
    private PImage screenshotImage;

    public final String author;
    public final String date;
}


