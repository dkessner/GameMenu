//
// BasicProgramView
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import java.util.*;
import java.io.*;
import java.nio.file.*;


public class BasicProgramView implements VideoGameMenu.ProgramView
{
    public BasicProgramView(PApplet papplet)
    {
        this.papplet = papplet;
        readFontList();
        initializeDimensions();
        initializeSettings();
        initializeImages();
    }

    public void display(ArrayList<ProgramGroup> programs, int current_i, int current_j)
    {
        initializeDimensions();
        displayBackground();
        displayCrest();

        ProgramGroup pg = programs.get(current_i);
        displayProgramList(pg, current_j);

        Program current = pg.get(current_j);
        displayPreview(current);
    }

    public void keyPressed()
    {
        if (papplet.key == 'a')
        {
            previousBackground(); 
        }
        else if (papplet.key == 'd')
        {
            nextBackground(); 
        }
        else if (papplet.key == 'w')
        {
            nextFont(); 
        }
        else if (papplet.key == 's')
        {
            previousFont(); 
        }
        else if (papplet.key == '1')
        {
            tile = !tile;
        }
        else if (papplet.key == '2')
        {
            whiteText = !whiteText;
        }
        else if (papplet.key == '3')
        {
            initializeSettings();
        }
    }

    // private methods and data

    private float xPreviewPane;
    private float yProgramList;
    private float previewPaneWidth;
    private float listSpacing;
    private float xList;
    private float yListTop;
    private float yListBottom;
    private float yListCenter;

    private void initializeDimensions()
    {
        xPreviewPane = papplet.width/3;
        yProgramList = papplet.height/4;
        previewPaneWidth = papplet.width-xPreviewPane;
        listSpacing = papplet.height/16;
        xList = 0;
        yListTop = yProgramList + listSpacing;
        yListBottom = papplet.height - listSpacing;
        yListCenter = (yListTop + yListBottom)/2;
    }

    private void displayBackground()
    {
        PImage background = backgrounds.get(currentBackground);

        if (background != null)
        {
            if (tile)
            {
                // program group / section (upper left)

                papplet.image(background, 0, yProgramList, xPreviewPane, papplet.height-yProgramList);

                // program list (lower left)

                papplet.image(background, 0, 0, xPreviewPane, yProgramList);

                // preview pane (right)

                papplet.image(background, xPreviewPane, 0, 
                                           (papplet.width-xPreviewPane), papplet.height);
            }
            else // single background image
            {
                papplet.image(background, 0, 0, papplet.width, papplet.height);
            }
        }
    }

    private void displayProgramList(ProgramGroup pg, int current_j)
    {
        papplet.textAlign(papplet.CENTER, papplet.CENTER);
        papplet.textSize(listSpacing * 1.5f);
        papplet.fill(whiteText ? 255 : 0);
        papplet.textFont(font, listSpacing);
        papplet.text(pg.name, 0, 0, xPreviewPane, yProgramList);

        papplet.textSize(listSpacing * .8f);
        papplet.fill(255);

        for (int j=0; j<pg.size(); j++)
        {
            float x = xList + 50;
            float y = yListCenter + listSpacing*(j - current_j);
            float w = xPreviewPane - 2*x;
            float h = listSpacing;

            if (y>yListTop && y<yListBottom)
            {
                Program program = pg.get(j);

                if (j == current_j)
                {
                    papplet.fill(whiteText ? 255 : 0);
                    papplet.textSize(listSpacing * .55f);
                }
                else
                {
                    papplet.fill(128);
                    papplet.textSize(listSpacing * .4f);
                }

                papplet.text(program.title, x, y, w, h);
            }
        }
    }

    private void displayPreview(Program program)
    {
        // screenshot

        int screenshotWidth = (int)(previewPaneWidth * 2/3 * .8);
        int screenshotHeight = screenshotWidth * 9/16;
        int xPreviewPaneCenter = (int)(xPreviewPane + previewPaneWidth/2);

        papplet.imageMode(papplet.CENTER);

        PImage screenshot = program.screenshot();

        if (screenshot != null)
            papplet.image(screenshot, xPreviewPaneCenter, yProgramList, 
                    screenshotWidth, screenshotHeight);

        papplet.imageMode(papplet.CORNER);

        // title, author, date

        float spacing = papplet.height/20;
        float yTextBegin = yProgramList + screenshotHeight/2 + spacing*3;
        float y = yTextBegin;

        papplet.fill(whiteText ? 255 : 0);
        papplet.textAlign(papplet.CENTER, papplet.CENTER);

        papplet.textSize(listSpacing*1.2f);
        papplet.text(program.title, xPreviewPaneCenter, y);
        y += spacing*3f;

        papplet.textSize(listSpacing*.4f);
        papplet.text(program.author, xPreviewPaneCenter, y);
        y += spacing;

        papplet.text(program.date, xPreviewPaneCenter, y);
        y += spacing;
    }

    private void displayCrest()
    {
        int w = (int)(previewPaneWidth/5f);
        int h = (int)(w * 741 / 590f);
       
        papplet.image(crest, 
                xPreviewPane + previewPaneWidth*.78f,
                papplet.height * .68f,
                w, h);
        /*
        // for font debugging
        papplet.text(fonts.get(currentFont), 
                xPreviewPane + previewPaneWidth*.6f,
                papplet.height * .8f);
        */
    }

    private void nextBackground()
    {
        currentBackground++;
        if (currentBackground >= backgrounds.size())
            currentBackground = 0;
    }    
    
    private void previousBackground()
    {
        currentBackground--;
        if (currentBackground < 0)
            currentBackground = backgrounds.size()-1;
    }

    private void nextFont()
    {
        currentFont++;
        if (currentFont >= fonts.size())
            currentFont = 0;
        font = papplet.createFont(fonts.get(currentFont), listSpacing);
    }    
    
    private void previousFont()
    {
        currentFont--;
        if (currentFont < 0)
            currentFont = fonts.size()-1;
        font = papplet.createFont(fonts.get(currentFont), listSpacing);
    }

    private void initializeImages()
    {
        // backgrounds

        this.backgrounds = new ArrayList<PImage>(); 
        this.backgrounds.add(papplet.loadImage("images/paper.jpg"));
        this.backgrounds.add(papplet.loadImage("images/wood.jpg"));
        this.backgrounds.add(papplet.loadImage("images/grass.jpg"));
        this.backgrounds.add(papplet.loadImage("images/ocean.jpg"));
        this.backgrounds.add(papplet.loadImage("images/sand.jpg"));
        this.backgrounds.add(papplet.loadImage("images/bubbles.jpg"));
        this.backgrounds.add(papplet.loadImage("images/izzi1.jpg"));
        this.backgrounds.add(papplet.loadImage("images/izzi2.jpg"));
        this.backgrounds.add(papplet.loadImage("images/izzi3.jpg"));
        this.backgrounds.add(papplet.loadImage("images/izzi4.jpg"));
        this.backgrounds.add(papplet.loadImage("images/izzi5.jpg"));
        this.backgrounds.add(papplet.loadImage("images/izzi6.jpg"));
        this.backgrounds.add(papplet.loadImage("images/izzi7.jpg"));

        this.crest = papplet.loadImage("images/crest.png");
    }

    private void initializeSettings()
    {
        currentBackground = 0;
        tile = true;
        whiteText = false;

        //currentFont = 116; // "FreeSerif"
        currentFont = 132; // "Nimbus Mono L Regular"

        if (currentFont < fonts.size())
            this.font = papplet.createFont(fonts.get(currentFont), listSpacing);
        else
            System.out.println("Something's wrong with fonts.");
    }

    private void readFontList()
    {
        try
        {
            System.out.println("Reading font list.");
            Path path = Paths.get("fonts.txt");
            fonts = Files.readAllLines(path);
        }
        catch (IOException e)
        {
            System.out.println(e);
        }
    }

    private PApplet papplet;
    private PFont font;
    private PImage crest;

    private ArrayList<PImage> backgrounds;
    private int currentBackground;

    private List<String> fonts;
    private int currentFont;

    private boolean tile;
    private boolean whiteText;
}


