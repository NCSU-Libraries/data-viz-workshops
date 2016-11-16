**Visualize Your Data with Tableau **

**Activity Guide**

Create Tableau Public account.

Play with a demo of what we are going to make here:
[*https://public.tableau.com/views/RaleighCrimeDashboard2/Dashboard*](https://public.tableau.com/views/RaleighCrimeDashboard2/Dashboard?:embed=y&:display_count=yes&:showTabs=y)

**\
We will make four different charts and a dashboard that connects the
charts together.**

Connect to a Data set

Choose Excel file

Select burglaries.xls, click Connect

When it loads, check to make sure the data is structured properly and
the data types are correct at the top of each column.

![](media/image1.png){width="3.799189632545932in"
height="3.7239588801399823in"}

Click on the dropdown next to column headers to change titles.

**Change Lcr Desc to Description**

**Change Inc Datetime to Date**

Click on Sheet1

**1. Stacked Bar chart**

This will be on Sheet 1

Note that Tableau divides variables into *Dimensions* and *Measures.
Dimensions* tend to be strings and dates, while *Measures* tend to be
numbers and geospatial coordinates.

We’re going to make a bar chart showing the **number of burglaries by
district** and by **type of burglary**.

Drag and drop….

-District to columns

*-Number of Records* to rows

-Description onto the Color button in the Marks menu

-Number of Records onto the Label button in the Marks menu

**Order the bars by size** so that it’s easier for viewers to compare
quantities.

To order, click on one of these icons:
![](media/image2.png){width="0.7083333333333334in" height="0.3125in"}

This should give you a bar chart showing \# of burglaries by district,
as well as by type. We can see that the Southeast is particularly high
in terms of residential burglaries. The labels are added in the bars to
make analysis easier.

To change theme colors, click on the Color button in the Marks menu.
Select Edit colors. Choose a new color palette and click “Assign
Palette,” or, click on the data item and manually click on a color block
to assign it a new color.

**2. Map showing burglary location by type**

First go to Analysis in your top menu, then uncheck **Aggregate Measures
-** this will prevent tableau from averaging all of your latitude and
longitude points when you’re trying to make a map.

Create a new sheet by clicking on this button:
![](media/image3.png){width="0.4166666666666667in" height="0.34375in"}

Rename it “map”![](media/image4.png){width="4.463542213473316in"
height="4.479166666666667in"}

**Drag and drop…**

-Longitude to Columns

-Latitude to Rows

This should give you a map with the dots colored by category: blue for
commercial/non-residential burglaries, orange for residential. You can
change the colors by clicking on the Color button.

**Add details to the map:**

Select Map &gt; Map Layers

**Add detail to the basemap: **

Check the following layers: Streets and Highways, Zip Code Boundaries,
Zip Code Labels

**Add a data layer from US Census**:

Data Layer (click on dropdown menu),

Select the following layer: Household Income (median),

By: Block Group

Change the color to a different color scheme (Gray Sequential)

Let’s imagine you want to enable users to filter the map based on the
burglary type:

**Add in a filte**r by dragging Description to Filters

Once filter is added, click on show filter in the dropdown menu

The filter appears on the top right side of the page. The user can
select different options to filter the map.

**3. Line Chart**![](media/image5.png){width="3.7864588801399823in"
height="2.6408114610673667in"}

Now we will create a line chart to examine the number of burglaries that
happen by weekday.

Create a new sheet named “line”

**Drag & drop…**

-Date to Columns

-Click on blue Date tab, select WEEKDAY as choice

-Number of Records to Rows

This should give you a line chart showing total \# of crimes per day of
the week.![](media/image6.png){width="2.088542213473316in"
height="1.4216119860017498in"}

**Drag and drop Description to the Color button** to separate data into
two lines based on category of burglary type.

**4: Tree map - useful for displaying a lot of hierarchical data with
subcategories**

**Main category: District**

**Subcategory: weekday**

Create a new sheet and rename it “tree map”

Drag and drop the following:

Number of records to the **Text** button
![](media/image7.png){width="1.390625546806649in"
height="1.4002154418197725in"}

District to the **Text** button

Date to the **Color** button in the Marks menu

**Change Date from Year to Weekday** (click on title dropdown menu,
select More... &gt; Weekday)

In the Show me window, click on the treemap, the icon with green and
orange squares.

Your default treemap will be green unless you have specified a different
color.

**Tree maps are useful for showing data hierarchical data with
subcategories in a small space.**

**5. Create a Dashboard to Put it All Together**

Click the new dashboard button:
![](media/image8.png){width="0.3899737532808399in"
height="0.3854166666666667in"}

![](media/image9.png){width="1.9791666666666667in"
height="2.129371172353456in"}

Under Objects, select the **Tiled** button - make sure it turns blue.
This will allow you to put your charts where ever you want them.

Under the **Dashboard** menu, select Size: **Automatic** (this re-sizes
based on screen size)

Drag and drop sheets 1-4 to the dashboard to position them where you
like. Move around the legends. Resize as necessary by clicking on a
chart and dragging a blue rectangle on the corner.

To remove sheet titles, right click on the chart and select Hide Title:

![](media/image10.png){width="1.4114588801399826in"
height="1.9176367016622922in"}

Once you have the charts positioned as you like, you can add actions to
link the charts together.

In the top menu, click Dashboard. Select Actions….

![](media/image11.png){width="2.713542213473316in"
height="2.5612029746281713in"}

A window should pop up. Click the Add Action button. Choose Filter.

Choose the Select button under “Run action on:”

Under Target Filters, select All Fields

Click OK to save.

![](media/image12.png){width="3.6960323709536307in"
height="1.328125546806649in"}

Your actions list should now include one action:

![](media/image13.png){width="3.432292213473316in"
height="2.0162182852143484in"}

Test your action by clicking items on the bar chart and see if the other
charts update their views.

Any time you select something from a chart, the other charts should
update based on your selection. What insights about the data can you get
from this interactivity with the dashboard?
