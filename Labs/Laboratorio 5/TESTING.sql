SELECT * 
FROM mbda.DATA 
WHERE NID = 1000095821 OR NID = 1000095859;

INSERT INTO (SELECT * 
            FROM mbda.DATA;)