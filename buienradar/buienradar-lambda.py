# Import Modules
from __future__ import print_function
from warnings import catch_warnings
import boto3
import json
import os
import urllib.request
from datetime import datetime

# set boto3 clients
sns_client = boto3.client('sns')

# Global Variable for ARN Topic
TopicArn = os.environ['TopicArn']

def lambda_handler(event, context):
    buienradar_data_url = "https://data.buienradar.nl/2.0/feed/json"
    
    try:
        response = urllib.request.urlopen(buienradar_data_url)
    except:
        return('An error occurred while attempting to retrieve data from Buienradar.')
    
    if response.getcode() == 200:
        source = response.read()
        data = json.loads(source)
    else:
        return('An error occurred while attempting to retrieve data from Buienradar.')
    
    tomorrow = data['forecast']['fivedayforecast'][0]
    
    day_short = tomorrow['day'].split("T")[0]
    datetime_object = datetime.strptime(tomorrow['day'], '%Y-%m-%dT%H:%M:%S')
    day_name = datetime_object.strftime('%A')
    weatherdescript = tomorrow['weatherdescription']
    mintemperature = tomorrow['mintemperature']
    maxtemperature = tomorrow['maxtemperature']
    rainChance = tomorrow['rainChance']
    sunChance = tomorrow['sunChance']
    windDirection = tomorrow['windDirection'].upper()
    wind = tomorrow['wind']
    subject = f"Weather report for - {day_name}"
    msg = """Tomorrows Weather Report
------------------------------------------------------------------------------------
Tomorrow : {a}
------------------------------------------------------------------------------------
\tWeather description\t\t:{b}
\tmintemperature\t\t:{c}°C
\tmaxtemperature\t\t:{d}°C
\trainChance\t\t\t:{e}
\tsunChance\t\t\t:{f}
\twindDirection\t\t\t:{g}
------------------------------------------------------------------------------------

Regards,
Having Fun with Lambda - 101

-- data fetched from https://www.buienradar.nl --
""".format(a=" " + day_short, 
                               b=" " + str(weatherdescript), 
                               c=" " + str(mintemperature), 
                               d=" " + str(maxtemperature),
                               e=" " + str(rainChance) + "%", 
                               f=" " + str(sunChance) + "%",
                               g=" " + windDirection + " " + str(wind) + "Bft" ,)

    topic = sns_client.publish(
        TopicArn=TopicArn,
        Message=msg,
        Subject=subject
    )
    if topic['ResponseMetadata']['HTTPStatusCode'] == 200:
        return(f"{weatherdescript} - TempMin: {mintemperature} C TempMax: {maxtemperature} C")
    else:
        return('An error occurred while attempting to send mail.')