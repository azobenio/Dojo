# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "e8eaf4a1-cca4-4769-b96a-11e95227e29e",
# META       "default_lakehouse_name": "DW018_BronzeLH",
# META       "default_lakehouse_workspace_id": "0733d2c6-8f5b-42b6-abda-70d9990bc791",
# META       "known_lakehouses": [
# META         {
# META           "id": "e8eaf4a1-cca4-4769-b96a-11e95227e29e"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
files_to_load = [
    ("Files/Bronze/CRMCustomers.csv", "em_customers"),
    ("Files/Bronze/Offers.csv", "em_offers"),
    ("Files/Bronze/Venues.csv", "em_venues"),
    ("Files/Bronze/TicketSales.csv", "em_ticket_sales"),
    ("Files/Bronze/ConferenceEvents.csv", "em_conference_events"),
    ("Files/Bronze/LVAttendanceRecords.csv", "lv_attendance_records"),
    ("Files/Bronze/LVAttendees_mapping.csv", "lv_attendees_mapping"),
    ("Files/Bronze/LVRooms.csv", "lv_rooms"),
    ("Files/Bronze/LVSchedule.csv", "lv_schedule"),
    ("Files/Bronze/LVSpeakers.csv", "lv_speakers"),
    ("Files/Bronze/STOCKCheck_Ins.csv", "stock_check_ins"),
    ("Files/Bronze/STOCKSessions.csv", "stock_sessions"),
] 

for file_path, table_name in files_to_load: 
    df = spark.read.format("csv").option("header", "true").option("inferSchema", "true").load(file_path)
    df.write.mode("overwrite").saveAsTable(table_name)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
