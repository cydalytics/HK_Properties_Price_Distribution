# Hong Kong Properties Price Distribution [![R](https://img.shields.io/badge/Program-R-BLUE)](https://cydalytics.blogspot.com/) [![Rayshader](https://img.shields.io/badge/Package-Rayshader-GREEN)](https://cydalytics.blogspot.com/)
*<b>Created by cyda - Carrie Lo & Yeung Wong</b>*
[![alt text](https://2.bp.blogspot.com/-JDCofS2Pvic/WxQCv_XstyI/AAAAAAAAABM/rWHKnG4ItnMULgmO_tWAuGTNL6kAexJlACK4BGAYYCw/s1000/tight%2Bbanner.png)](https://cydalytics.blogspot.com/)

---------------------------------------------------------------------------------------------
### Please acknowledge <b>team cyda - Carrie Lo and Yeung Wong</b> when using the code

### If you find this script is helpful, please feel free to endorse us through Linkedin!
Linkedin:

* Carrie Lo - *https://www.linkedin.com/in/carrielsc/*
* Yeung Wong - *https://www.linkedin.com/in/yeungwong/*
---------------------------------------------------------------------------------------------
## Project Description
This project is to visualize Hong Kong housing price in 3D plot.

[![YouTube](https://1.bp.blogspot.com/-X71OGd9ULno/Xt-MOSTIjDI/AAAAAAAAAG8/kvN-jeaTQHUcTxyDAKX1SaKXciQ-EEDiwCLcBGAsYHQ/s1600/Cover.jpg)](https://www.youtube.com/watch?v=qgVW-2UJZrY)

## Project Details
To check the tutorial article, please click [here](https://towardsdatascience.com/introducing-3d-ggplots-with-rayshader-r-c61e27c6f0e9?source=friends_link&sk=211866db685b04d913e760d6f67d9ec2).

The package used is `rayshader`. Rayshader is an open source package for producing 2D and 3D data visualizations in R which uses elevation data in a base R matrix and a combination of raytracing, spherical texture mapping, overlays, and ambient occlusion to generate beautiful topographic 2D and 3D maps. To know more about the package, you can refer to the docunment [here](https://www.rayshader.com/).

Data were downloaded from [census population statistics](https://www.censtatd.gov.hk/hkstat/sub/sp150.jsp?productCode=B1130301) released from Hong Kong Government and scraped from [Hong Kong Property](https://app2.hkp.com.hk/tx/default.jsp?lang=zh%27). The pre-processed data are [Population Data.xlsx](https://github.com/cydalytics/HK_Properties_Price_Distribution/blob/master/Population%20Data.xlsx) and [real_estate_master_df.csv](https://github.com/cydalytics/HK_Properties_Price_Distribution/blob/master/real_estate_master_df.csv).

To learn how to generate a 3D map plot with rayshader, please see the R script [here](https://github.com/cydalytics/HK_Properties_Price_Distribution/blob/master/HK_Properties_Price_Distribution.R).

## Demonstration
Example of 3D Plot

![alt text](https://github.com/cydalytics/HK_Properties_Price_Distribution/blob/master/Output/output1.gif)

![alt text](https://github.com/cydalytics/HK_Properties_Price_Distribution/blob/master/Output/output2.gif)
