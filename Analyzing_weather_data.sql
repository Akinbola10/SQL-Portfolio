## Step 1: obtaining the temperature, wind speed, and precipitation for stations La Guardia and JFK, for every day in 2020 in descending order by date and ascending order by Station ID. 
SELECT
  stn,
  date,
  IF(
     temp=9999.9,
     NULL,
     temp) AS temperature,
  IF(
     wdsp="999.9",
     NULL,
     CAST(wdsp AS Float64)) AS wind_speed,
  IF(
     prcp=99.99,
     0,
     prcp) AS precipitation
FROM
  `bigquery-public-data.noaa_gsod.gsod2020`
WHERE
  stn="725030" -- La Guardia
  OR stn="744860" -- JFK
ORDER BY
  date DESC,
  stn ASC
  
## Step 2: Finding the average temperature in June 2020. 
SELECT
    AVG(temperature)
FROM
    `my-project-portfolio-477023.demos.nyc_weather`  
WHERE
    date BETWEEN '2020-06-01' AND '2020-06-30'
