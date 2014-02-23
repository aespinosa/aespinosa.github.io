---
comments: true
date: 2008-09-07 02:17:53
layout: post
slug: ubiquity-weather-command
title: Ubiquity weather command
wordpressid: 164
categories: Soft Hacks
tags: firefox,ubiquity
---

[Ubiquity](http://labs.mozilla.com/2008/08/introducing-ubiquity/) from Mozilla labs features a nice command for querying the weather. It creates a query to the Google Weather service and returns the result. But with Google's location/ IP dependent search results you can get the weather information in various languages depending where you conduct the search. For example if your language preference is Filipino (politically correct) or Tagalog (ISO language standard code) TL, you get the results in the corresponding language and in the unit standard used in the area.

But as a metric thinking type of guy, I hate it when Google gives me the results in Fahrenheit! I did some tweaking to get the weather in the metric system while using the English language.Â  The simple solution is to use the EN-UK language code. Simply edit your ~/.mozilla/[profile_name]/extentions/ubiquity@labs.mozilla.com/chrome/content/builtincmds.js and modify the command "weather":


    
    <code>
    CmdUtils.CreateCommand({
      name: "weather",
      takes: {"location": noun_arb_text},
      icon: "http://www.wunderground.com/favicon.ico",
      description: "Checks the weather for a given location.",
      help: "Try issuing "weather chicago".  It works with zip-codes, too.",
      execute: function( directObj ) {
        var location = directObj.text;
        var url = "http://www.wunderground.com/cgi-bin/findweather/getForecast?query=";
        url += escape( location );
    
        Utils.openUrlInBrowser( url );
      },
    
      preview: function( pblock, directObj ) {
        var location = directObj.text;
        if( location.length < 1 ) {
          pblock.innerHTML = "Gets the weather for a zip code/city.";
          return;
        }
    
        var url = "http://www.google.com/ig/api";
        jQuery.get( url, {weather: location, hl: "EN-GB"}, function(xml) {
          var el = jQuery(xml).find("current_conditions");
          if( el.length == 0 ) return;
    
          var condition = el.find("condition").attr("data");
    
          var weatherId = WEATHER_TYPES.indexOf( condition.toLowerCase() );
          var imgSrc = "http://l.yimg.com/us.yimg.com/i/us/nws/weather/gr/";
          imgSrc += weatherId + "d.png";
    
          var weather = {
            condition: condition,
            temp: el.find("temp_c").attr("data"),
            humidity: el.find("humidity").attr("data"),
            wind: el.find("wind_condition").attr("data"),
            img: imgSrc
          };
    
          weather["img"] = imgSrc;
    
          var html = CmdUtils.renderTemplate( {file:"weather.html"}, {w:weather}
                                            );
    
          jQuery(pblock).html( html );
          }, "xml");
      }
    });</code>
