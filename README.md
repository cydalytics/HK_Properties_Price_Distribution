
---------------------------------------------------------------------------------------------
### Please acknowledge <b>team cyda - Carrie Lo and Yeung Wong</b> when using the code

### If you find this script is helpful, please feel free to endorse us through Linkedin!
Linkedin:

* Carrie Lo - *https://www.linkedin.com/in/carrielsc/*
* Yeung Wong - *https://www.linkedin.com/in/yeungwong/*
---------------------------------------------------------------------------------------------
## Project Description
This project is to visualize Hong Kong housing price in 3D plot.

## Project Details
To check the tutorial article, please click [here](https://towardsdatascience.com/introducing-3d-ggplots-with-rayshader-r-c61e27c6f0e9?source=friends_link&sk=211866db685b04d913e760d6f67d9ec2).

The package used is "rayshader". Rayshader is an open source package for producing 2D and 3D data visualizations in R which uses elevation data in a base R matrix and a combination of raytracing, spherical texture mapping, overlays, and ambient occlusion to generate beautiful topographic 2D and 3D maps. To know more about the package, you can refer to the docunment [here](https://www.rayshader.com/).

Data were downloaded from [census population statistics](https://www.censtatd.gov.hk/hkstat/sub/sp150.jsp?productCode=B1130301) released from Hong Kong Government and scraped from [Hong Kong Property](https://app2.hkp.com.hk/tx/default.jsp?lang=zh%27). The pre-processed data are [Population Data.xlsx](https://github.com/cydalytics/rayshader_HK_3D_map/blob/master/Population%20Data.xlsx) and [real_estate_master_df.csv](https://github.com/cydalytics/rayshader_HK_3D_map/blob/master/real_estate_master_df.csv).

To learn how to generate a 3D map plot with rayshader, please see the R script [here](https://github.com/cydalytics/rayshader_HK_3D_map/blob/master/Demo%20-%20Generate%20a%203D%20map%20plot%20with%20rayshader.R).

## Demonstration
Example of 3D Plot
![alt text](https://miro.medium.com/max/1400/1*ylgrDDCbMOpg1Uk8VabvAw.gif)

Result Dataframe
![alt text](https://miro.medium.com/max/2000/1*kvBUrz4tgRxQQVZV2oCz4Q.jpeg)
