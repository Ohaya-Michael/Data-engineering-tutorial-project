-- BRONZE: stream raw files in, all as text

CREATE OR REFRESH STREAMING TABLE roadsafe.bronze.accidents_dp1
AS SELECT 
*,
    current_timestamp() AS _ingest_ts,
    _metadata.file_path AS _source_file
FROM STREAM read_files(
    '/Volumes/roadsafe/bronze/raw_files/',
    format => 'csv',
    header => true,
    sep => ',',
    inferColumnTypes => false
);

-- SILVER: typed, labelled, with quality rules
CREATE OR REFRESH MATERIALIZED VIEW roadsafe.silver.accidents_dp1 (
    CONSTRAINT valid_coords
        EXPECT (lat BETWEEN 47.0 AND 55.5 AND lon BETWEEN 5.5 AND 15.5)
        ON VIOLATION DROP ROW,
    CONSTRAINT valid_severity
        EXPECT (severity_code IN (1, 2, 3))
        ON VIOLATION DROP ROW,
    CONSTRAINT valid_month
        EXPECT (month BETWEEN 1 AND 2)
)
AS SELECT 
    CAST(UJAHR AS INT) AS year,
    CAST(UMONAT AS INT) AS month,
    CAST(USTUNDE AS INT) AS hour,
    CAST(UWOCHENTAG AS INT) AS weekday,
    CAST(UKATEGORIE AS INT) AS severity_code,
    CASE CAST(UKATEGORIE AS INT)
        WHEN 1 THEN 'fatal' WHEN 2 THEN 'serious' WHEN 3 THEN 'slight' END AS severity,
    CAST(ULICHTVERH AS INT) AS light_code,
    CAST(STRZUSTAND AS INT) AS road_condition_code,
    CAST(IstRad AS INT) = 1 AS involves_bicycle,
    CAST(IstPKW AS INT) = 1 AS involve_car,
    CAST(IstFuss AS INT) = 1 AS involves_pedestrian,
    CAST(IstKrad AS INT) = 1 AS involves_motorbike,
    CAST(IstGkfz AS INT) = 1 AS involves_truck,
    LON AS lon,
    LAT AS lat,
    _source_file
FROM roadsafe.bronze.accidents_dp1;