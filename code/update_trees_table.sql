-- update_trees_table.sql

-- This SQL code updates the trees.damage_index field using these rules:

-- If damage_index is 0 and the tree has 1 or more vcuts, damage_index is increased to 1.
-- If damage-index is 1 or 2 and tree has 0 vcuts, damage_index is reduced to 0.

-- In other words: 

-- A tree with damage_index 0 (no damage) cannot have any vcuts. 
-- Trees with damage_index 1 and 2 must have 1 or more vcuts.

BEGIN TRANSACTION;

-- Creates a temporary table with one record for each vcut.
-- 

CREATE TEMP TABLE trees_vcuts AS
    SELECT
        trees.frame_id, 
        trees.id AS tree_id, 
        trees.damage_index, 
        vcuts.id As tree_cut_id, 
        ST_Intersects(ST_Envelope(trees.geometry),vcuts.geometry) AS tree_intersects_vcut
    FROM trees
    LEFT JOIN vcuts ON trees.frame_id=vcuts.frame_id;

CREATE TEMP TABLE tree_vcut_count AS
    SELECT tree_id, damage_index, SUM(tree_intersects_vcut>0) AS vcut_count 
    FROM trees_vcuts
    GROUP BY tree_id;

ALTER TABLE trees ADD vcut_count;

UPDATE trees
  SET vcut_count = ( 
    SELECT vcut_count 
    FROM tree_vcut_count 
    WHERE tree_id = trees.id);

UPDATE trees
SET damage_index=1
WHERE damage_index=0 AND vcut_count>0;

UPDATE trees
SET damage_index=0
WHERE damage_index=1 AND vcut_count=0;

UPDATE trees
SET damage_index=0
WHERE damage_index=2 AND vcut_count=0;

COMMIT;
