
# Realtime Weather

> *This demo provides weather information in Taipei City, New Taipei City and Taoyuan City (update hourly).*

Data Source: -   [https://opendata.cwb.gov.tw/index](https://opendata.cwb.gov.tw/index)

## APIs
### ð Generate Key
Allow users to generate keys which can be used as authorization in API url
 `/admin/auth` `POST`
 #### Expected Response

    // JWT Token
    Bearer ***

### ð¤ Get Weather Info
Users, with valid authorization keys, can get weather information of the location specified in the input url
 `/realtimeWeather?locationName={location}&city={city}&dist={dist}` `GET`
  #### Required Request

    // Authorization *requested from header
    e.g. Bearer ***
    
    // locationName
    e.g. æ¿æ©ãæ°å±ãæ·¡æ°´ãèºå
    
    // city
    e.g. èºåãèºåå¸ãæ°åãæ°åå¸
    
    // dist
    e.g. æ¿æ©ãæ¿æ©åãåæãåæå
    
 #### Expected Response
**Example endpoint** : `/realtimeWeather?locationName=èºå`

**Example header** : `{ Authorization: 'JWT Token' }`

    [
        {
            "id":  2,
            "station_id":  "466920", // æ¸¬ç«ID
            "ELEV":  6.26, // é«åº¦ï¼å¬å°ºï¼
            "WDIR":  100, // é¢¨åï¼åº¦ï¼
            "WDSD":  4.4, // é¢¨éï¼å¬å°ºï¼ç§ï¼
            "TEMP":  18.7, // æº«åº¦ï¼ææ°ï¼
            "HUMD":  0.88, // ç¸å°æ¿åº¦ï¼ç¾åæ¯ï¼
            "PRES":  1017.6, // æ¸¬ç«æ°£å£ï¼ç¾å¸ï¼
            "24R":  0, // æ¥ç´¯ç©é¨éï¼æ¯«ç±³ï¼
            "H_FX":  11.7, // å°ææå¤§é£é¢¨é¢¨éï¼å¬å°ºï¼ç§ï¼
            "H_XD":  90, // å°ææå¤§é£é¢¨é¢¨åï¼åº¦ï¼
            "H_FXT":  "1643", // å°ææå¤§é£é¢¨æéï¼hhmmï¼
            "H_F10":  4.9, // æ¬ææå¤§10åéå¹³åé¢¨éï¼å¬å°ºï¼ç§ï¼
            "H_10D":  90, // æ¬ææå¤§10åéå¹³åé¢¨åï¼åº¦ï¼
            "H_F10T":  "1621", // æ¬ææå¤§10åéå¹³åé¢¨éç¼çæéï¼hhmmï¼
            "H_UVI":  0.19, // å°æç´«å¤ç·ææ¸
            "D_TX":  21.3, // æ¬æ¥æé«æº«ï¼ææ°ï¼
            "D_TXT":  "1319", // æ¬æ¥æé«æº«ç¼çæéï¼hhmmï¼
            "D_TN":  17.5, // æ¬æ¥æä½æº«ï¼ææ°ï¼
            "D_TNT":  "0620", // æ¬æ¥æä½æº«ç¼çæéï¼hhmmï¼
            "D_TS":  0.2, // æ¬æ¥ç¸½æ¥ç§ï¼å°æï¼
            "VIS":  "21-30", // 10åéçè¡è½è¦åº¦ï¼å¬éï¼
            "Weather":  "é°" // 10åéå¤©æ°£ç¾è±¡æè¿°
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
ð©âð»  ï½[Tiffany Tsou](https://github.com/Tiffanymctsou "Tiffany Tsou")