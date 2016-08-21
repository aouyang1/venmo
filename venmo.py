#!/bin/python

import sys
import os
import re
import requests
import json
from time import sleep
from datetime import datetime, timedelta
from pprint import pprint

import boto3

sess = requests.Session()
adapter = requests.adapters.HTTPAdapter(max_retries=5)
sess.mount('http://', adapter)
sess.mount('https://', adapter)

def collect_data_between(limit=20, page="https://venmo.com/api/v5/public?", folder="data", start_dstr="2016_08_01", end_dstr="2016_08_01"):

    try:
        start_dt = datetime.strptime(start_dstr,"%Y_%m_%d")
        end_dt = datetime.strptime(end_dstr, "%Y_%m_%d")
    except:
        print("Cannot parse start and/or end date")
        raise


    if not os.path.exists(folder):
        os.makedirs(folder)

    fname = "venmo_{}.json".format(start_dstr)
    f_venmo = open(folder+"/"+fname, "w")

    epoch_dt = datetime(1970,1,1)
    start_ts = int((start_dt - epoch_dt).total_seconds())
    end_ts = int((end_dt - epoch_dt).total_seconds())

    page += "until={}".format(end_ts)

    while True:
        page = page.replace(":8100","")
        print(page)
        r = sess.get(page + "&limit={}".format(limit)).json()

        if len(r["data"]) == 0:
            return

        page = r["paging"]["next"]

        for item in r["data"]:
            dt = datetime.strptime(item["created_time"], "%Y-%m-%dT%H:%M:%SZ")
            ts = (dt - epoch_dt).total_seconds()

            if ts < start_ts:
                return f_venmo
            else:
                f_venmo.write("{}\n".format(json.dumps(item)))

def daily_collect():
    prev_dt = datetime.utcnow()
    while True:
        curr_dt = datetime.utcnow()
        if curr_dt.date() != prev_dt.date():
            start_dstr = (curr_dt.date() - timedelta(days=1)).strftime("%Y_%m_%d")
            collect_day(start_dstr)

        prev_dt = curr_dt
        sleep(60)

def collect_day(start_dstr):
    start_dt = datetime.strptime(start_dstr, "%Y_%m_%d")
    end_dstr = (start_dt + timedelta(days=1)).strftime("%Y_%m_%d")
    f_venmo = collect_data_between(limit=1200, start_dstr=start_dstr, end_dstr=end_dstr)
    push_to_s3(f_venmo)

def push_to_s3(f_venmo):
    print("uploading to s3...")
    filename_path = f_venmo.name
    filename = filename_path.split("/")[-1]
    year, month, day = re.search("(?<=venmo_)\w+", filename).group(0).split("_")
    
    s3_client = boto3.client('s3', aws_access_key_id=os.environ["AWS_ACCESS_KEY_ID"], aws_secret_access_key=os.environ["AWS_SECRET_ACCESS_KEY"])
    s3_client.upload_file(filename_path, "venmo-data-monthly", year+"_"+month+"/"+filename)

if __name__ == "__main__":
    args = sys.argv[1:]
    option = args[0]

    if option == "run":
        daily_collect()
    else:
        start_dstr = option
        collect_day(start_dstr)


