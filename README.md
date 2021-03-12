
# Realtime Weather

> *This demo provides weather information in Taipei City, New Taipei City and Taoyuan City (update hourly).*

Data Source: -   [https://opendata.cwb.gov.tw/index](https://opendata.cwb.gov.tw/index)

## APIs
### 🔑 Generate Key
Allow users to generate keys which can be used as authorization in API url
 `/admin/auth` `POST`
 #### Expected Response

    // JWT Token
    Bearer ***

### 🌤 Get Weather Info
Users, with valid authorization keys, can get weather information of the location specified in the input url
 `/realtimeWeather?locationName={location}&city={city}&dist={dist}` `GET`
  #### Required Request

    // Authorization *requested from header
    e.g. Bearer ***
    
    // locationName
    e.g. 板橋、新屋、淡水、臺北
    
    // city
    e.g. 臺北、臺北市、新北、新北市
    
    // dist
    e.g. 板橋、板橋區、北投、北投區
    
 #### Expected Response
**Example endpoint** : `/realtimeWeather?locationName=臺北`

**Example header** : `{ Authorization: 'JWT Token' }`

    [
        {
            "id":  2,
            "station_id":  "466920", // 測站ID
            "ELEV":  6.26, // 高度（公尺）
            "WDIR":  100, // 風向（度）
            "WDSD":  4.4, // 風速（公尺／秒）
            "TEMP":  18.7, // 溫度（攝氏）
            "HUMD":  0.88, // 相對濕度（百分比）
            "PRES":  1017.6, // 測站氣壓（百帕）
            "24R":  0, // 日累積雨量（毫米）
            "H_FX":  11.7, // 小時最大陣風風速（公尺／秒）
            "H_XD":  90, // 小時最大陣風風向（度）
            "H_FXT":  "1643", // 小時最大陣風時間（hhmm）
            "H_F10":  4.9, // 本時最大10分鐘平均風速（公尺／秒）
            "H_10D":  90, // 本時最大10分鐘平均風向（度）
            "H_F10T":  "1621", // 本時最大10分鐘平均風速發生時間（hhmm）
            "H_UVI":  0.19, // 小時紫外線指數
            "D_TX":  21.3, // 本日最高溫（攝氏）
            "D_TXT":  "1319", // 本日最高溫發生時間（hhmm）
            "D_TN":  17.5, // 本日最低溫（攝氏）
            "D_TNT":  "0620", // 本日最低溫發生時間（hhmm）
            "D_TS":  0.2, // 本日總日照（小時）
            "VIS":  "21-30", // 10分鐘盛行能見度（公里）
            "Weather":  "陰" // 10分鐘天氣現象描述
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