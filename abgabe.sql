-- 1. Kreuzprodukt
SELECT * 
FROM Artikel, Autoren;

-- 2. Theta Join
SELECT * 
FROM Artikel 
JOIN Autoren ON Artikel.AutorID = Autoren.AutorID AND Autoren.Geburtstag > '1980-01-01';

-- 3. Natürlicher Verbund (Natural Join)
SELECT * 
FROM Artikel 
NATURAL JOIN Autoren;

-- 4. Subselect
SELECT * 
FROM Artikel 
WHERE AutorID IN (SELECT AutorID FROM Autoren WHERE Geburtstag > '1980-01-01');

-- 5. Mengenvereinigung (UNION)
SELECT Vorname, Nachname FROM Autoren
UNION
SELECT Vorname, Nachname FROM Abonennten;

-- 6. Mengendifferenz (EXCEPT)
SELECT AutorID FROM Autoren
EXCEPT
SELECT AutorID FROM Artikel;

-- 1. View: Artikel mit Autoreninformationen
CREATE VIEW ArtikelMitAutoren AS
SELECT 
    a.ArtikelID, 
    a.Titel, 
    a.VDATum, 
    a.visibility, 
    a.isPremium, 
    au.Nachname, 
    au.Vorname
FROM Artikel a
JOIN Autoren au ON a.AutorID = au.AutorID;

-- 2. Sequenz: Eindeutige IDs für Artikel
CREATE SEQUENCE artikel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- 3. Domäne: Format für E-Mail-Adressen
CREATE DOMAIN email_typ AS TEXT 
CHECK (VALUE ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
