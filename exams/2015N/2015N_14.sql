SELECT caption FROM Photo
WHERE julianday(uploadDate) - julianday(creationDate) = 2
AND user IN (
    SELECT id FROM User WHERE name LIKE "Daniel Ramos"
);
