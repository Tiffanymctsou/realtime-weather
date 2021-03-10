
# Realtime Weather

> *This demo provides weather information in Taipei City, New Taipei City and Taoyuan City (update hourly).*

Data Source: -   [https://opendata.cwb.gov.tw/index](https://opendata.cwb.gov.tw/index)

## APIs
### 🔑 Generate Key
Allow users to generate keys which can be used as authorization in API url
 `/admin/auth` `POST`
 #### Expected Response

     LRWI-1615369249594-JFO98

### 🌤 Get Weather Info
Users, with valid authorization keys, can get weather information of the location specified in the input url
 `/realtimeWeather?Authorization={key}&locationName={location}&city={city}&dist={dist}` `GET`
  #### Required Request

    // Authorization *required
    e.g. LRWI-1615369249594-JFO98
    
    // locationName
    e.g. 板橋、新屋、淡水、臺北
    
    // city
    e.g. 臺北、臺北市、新北、新北市
    
    // dist
    e.g. 板橋、板橋區、北投、北投區
    
 #### Expected Response
**Example endpoint** : `/realtimeWeather?Authorization=LRWI-1615369249594-JFO98&locationName=臺北`

    [
    	{
    		"id":  2,
    		"station_id":  "466920", // 測站ID
    		"height":  6.26, // 高度（公尺）
    		"wind_direction":  100, // 風向（度）
    		"wind_speed":  4.4, // 風速（公尺／秒）
    		"temp":  18.7, // 溫度（攝氏）
    		"humidity":  0.88, // 相對濕度（百分比）
    		"pressure":  1017.6, // 測站氣壓（百帕）
    		"daily_rain":  0, // 日累積雨量（毫米）
    		"wind_speed_max":  11.7, // 小時最大陣風風速（公尺／秒）
    		"wind_direction_max":  90, // 小時最大陣風風向（度）
    		"max_wind_time":  "1643", // 小時最大陣風時間（hhmm）
    		"wind_speed_max_10":  4.9, // 本時最大10分鐘平均風速（公尺／秒）
    		"wind_direction_max_10":  90, // 本時最大10分鐘平均風向（度）
    		"max_wind_time_10":  "1621", // 本時最大10分鐘平均風速發生時間（hhmm）
    		"UV_index":  0.19, // 小時紫外線指數
    		"max_temp":  21.3, // 本日最高溫（攝氏）
    		"max_temp_time":  "1319", // 本日最高溫發生時間（hhmm）
    		"min_temp":  17.5, // 本日最低溫（攝氏）
    		"min_temp_time":  "0620", // 本日最低溫發生時間（hhmm）
    		"total_sun_time":  0.2, // 本日總日照（小時）
    		"visible_distance":  "21-30", // 10分鐘盛行能見度（公里）
    		"weather":  "陰" // 10分鐘天氣現象描述
    		}
    ]

> If `locationName`, `city` and `dist` are not defined, all weather
> information will be returned by default

## Technologies
**Backend**
- Node.js / Express.js
- MySQL

**Packages**
- Cron
-- *For scheduling the execution of fetching weather data from Open Data API*
- Cors
-- *For cross-origin resource sharing*

## Developed by
👩‍💻  ｜[Tiffany Tsou](https://github.com/Tiffanymctsou "Tiffany Tsou")