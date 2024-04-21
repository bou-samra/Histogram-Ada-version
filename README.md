# Histogram (Ada version)

**What is a histogram?**

* A visual representation that charts the <ins>frequency distribution</ins> of the regularity of an occurrence of a value in a <ins>data set</ins>.
* Often confused with a bar chart, although there are certain defining characteristics or points of differentiation.
* The x-axis consists of equal width bars without space in between, known as <ins>bins</ins> or buckets that represent a <ins>range of classes</ins>.
* x axis is the <ins>class interval</ins> and is identified with a number rather than a description or label.
* The y axis represents the <ins>frequency</ins> of occurrence of a value.
* Bar graphs represents data that is discrete or categorical in nature

**Uses**
* In statistics to show the frequency of a specific value within a certain range.
* Used to analyse large amounts of data easily to detect trends and patterns. 

## Change-log:

* 19/04/2023 - Initial release
* 13/04/2023 - Foundation code

## Compilation
type the following commands:

`gcc -c histogram.adb`

`gnatbind histogram`

`gnatlink histogram`


## Misc.
* I have included both uniform and gaussian (normal) distribution data files.
* Gnuplot or some equivelant application is required to graph the histogram data.
* I find:

`gnuplot`

`set style fill solid border -1 `

`plot 'gauss.out' using 1:2 smooth freq w boxes`

works well (see png file for sample output).


## Todo
* Need to use SDL2 to implement internal plotting routine.
* pretty sure bugs have been ironed out.

## Author(s)
Jason Bou-Samra

