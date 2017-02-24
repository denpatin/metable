-- Test countries and cities table join

SELECT
  countries.name
  , cities.name
FROM
(
  SELECT
      MAX(CASE WHEN name = 'id' THEN val ELSE NULL END) AS id
    , MAX(CASE WHEN name = 'name' THEN val ELSE NULL END) AS name
  FROM (
         SELECT
             d.id    AS kid
           , f.name
           , d.value AS val
         FROM fields f, data d
         WHERE d.field_id = f.id
               AND f.table_id = 1
         ORDER BY d.id, f.id) AS countries_query
  GROUP BY kid) AS countries,
(
  SELECT
      MAX(CASE WHEN name = 'id' THEN val ELSE NULL END) AS id
    , MAX(CASE WHEN name = 'name' THEN val ELSE NULL END) AS name
    , MAX(CASE WHEN name = 'country_id' THEN val ELSE NULL END) AS country_id
  FROM (
         SELECT
             d.id    AS kid
           , f.name
           , d.value AS val
         FROM fields f, data d
         WHERE d.field_id = f.id
               AND f.table_id = 2
         ORDER BY d.id, f.id) AS cities_query
  GROUP BY kid) AS cities
WHERE country_id = countries.id;
