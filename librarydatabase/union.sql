SELECT
    member_name || '' || member_surname AS full_name,
    'Member' AS role
FROM
    ho_members

UNION

SELECT
    first_name || ' ' || last_name AS full_name,
    'Author' AS role
FROM
    ho_authors;


