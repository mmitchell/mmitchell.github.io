---
title: Null Hypothesis Significance Testing in Python
category: 'Data Science & Statistics'
short_desc: Using NHST and Python/Pandas we show strong causal evidence for the Stroop Effect.
---

One of the assignments for Udacity's Data Analysis Degree is to apply Null Hypothesis Significance Testing (NHST) to data collected from an experiment designed around the Stroop Effect. You may have seen the Stroop Effect before, in brief it's the additional time needed to read a list of colors when the ink used to write the name of the color does not match the color name itself (as demonstrated below).

<div style="text-align:center;">
<h1 style="color: green;"> Red </h1>
<h1 style="color: red;"> Blue </h1>
<h1 style="color: yellow;"> Green </h1>
<h1 style="color: blue;"> Yellow </h1>
</div>

The data from the original experiment (below) shows a large effect size between reading speeds on matching vs. mismatching color word lists.

![Stroop Effect](static/img/stroop-effect.jpg)

The goal of the assignment was to use data from a replica of this study to conduct a NHST and report our findings. My full report can be read here: [Strop Effect Report](http://github.com/mmitchell/data-analyst-nanodegree/blob/master/p1/stroop_effect.ipynb)