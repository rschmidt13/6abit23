-- Hausübung 23.12.2023
-- Die Datenbank ist in Mini-Projekt-Input.sql enthalten

-- Abfragen und Erweiterungen:
-- Mindestens je eine Datenbankabfrage mit 
-- Kreuzprodukt 
-- Theta-Join 
-- natürlichem Verbund
-- Unterabfrage (Sub-Select)
-- Mengenvereinigung
-- Mengendifferenz
-- Erweiterungen
-- Sequenzen
-- Views (z.B. in Kombination mit natural Join möglich)
-- Domänen

-- 1. Kreuzprodukt
SELECT Film.Titel, Medium.typ, Video.Preis
FROM Film, Video, Medium
WHERE Film.F_ID = Video.F_ID AND Medium.m_id = Video.M_ID AND Video.M_ID = 2;


-- Theta-Join
SELECT Film.Titel, Medium.typ, Video.Preis
FROM Film
JOIN Video ON Film.F_ID = Video.F_ID
JOIN medium ON Medium.M_ID = Video.M_ID 
WHERE Video.M_ID = 2;


-- natürlicher Verbund
SELECT Film.Titel, Medium.typ, Video.Preis
FROM Film
NATURAL JOIN Video
NATURAL JOIN medium
WHERE Video.M_ID = 2;


-- Unterabfrage (Sub-Select)
SELECT(SELECT Titel FROM Film WHERE Film.F_ID = Video.F_ID) AS Filmtitel,
(select typ from medium where medium.m_id = video.m_id) as Medium ,Preis
FROM Video
WHERE M_ID = 2;


-- Ausgabe der Kunden Tabelle
SELECT * FROM Kunde;
-- Ausgabe der Mitarbeiter Tabelle
SELECT * FROM Mitarbeiter;


-- Mengenvereinigung
-- Wichtig gleiches Schema herstellen
-- Kunde und Mitarbeiter 
-- Alle Mitarbeiter und Kunden
SELECT Vorname, Nachname, A_ID FROM Mitarbeiter
UNION
SELECT Vorname, Nachname, A_ID  FROM Kunde;


-- Mengendifferenz
-- Wichtig gleiches Schema herstellen
-- Kunde und Mitarbeiter
-- Alle Mitarbeiter die keine Kunden sind
SELECT Vorname, Nachname, A_ID FROM Mitarbeiter
EXCEPT
SELECT Vorname, Nachname, A_ID  FROM Kunde;


-- Erweiterungen
-- Sequenzen
-- eine Sequenz erstellen
CREATE SEQUENCE seq_mitarbeiter
INCREMENT BY 2
START WITH 6
MINVALUE 6;
-- anwendung der Sequenz
INSERT INTO Mitarbeiter (P_M_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Eintrittsdatum, Gehalt, Vorgesetzter)
VALUES (nextval('seq_mitarbeiter'), 'Toni', 'Erikson', '1995-06-05', 'toni.erikson@example.com', '0662 163456', 1, '2022-01-01', 2000.00, 1);

INSERT INTO Mitarbeiter (P_M_ID, Vorname, Nachname, Geburtsdatum, Email, Telefonnummer, A_ID, Eintrittsdatum, Gehalt, Vorgesetzter)
VALUES (nextval('seq_mitarbeiter'), 'Anna', 'Johnson', '1990-07-15', 'anna.johnson@example.com', '0662 123456', 1, '2021-12-01', 2500.00, 1);


-- Ausgabe der Rechnung Tabelle
SELECT * FROM Rechnung;
-- Ausgabe der Rechnungsposition Tabelle
SELECT * FROM Rechnungsposition;


-- Views
-- View erstellen
-- Rechnung und Rechnungsposition
CREATE VIEW Kunden_Rechnung AS
SELECT DISTINCT
  CONCAT(K.Vorname, ' ', K.Nachname) AS Kundennamen,
  CONCAT(A.Straße, ' ', A.Hausnummer, ', ', A.PLZ, ' ', A.Ort) AS Adresse,
  R.Gesamtpreis AS Preis
FROM
  Kunde K
JOIN Adresse A ON K.A_ID = A.A_ID
JOIN Verleih VL ON VL.K_ID = K.P_K_ID
JOIN Rechnungsposition RP ON RP.Verleih_ID = VL.Verleih_ID
JOIN Rechnung R ON R.R_ID = RP.R_ID;
-- View ausgeben
SELECT * FROM Kunden_Rechnung;
SELECT * FROM Kunden_Rechnung WHERE kundennamen = 'Maria Musterfrau';

-- View löschen
DROP VIEW Kunden_Rechnung;
--Ausgabe der Adresse Tabelle
SELECT * FROM Adresse;


-- Domänen
-- Domäne erstellen
-- PLZ mit 5 Ziffern und nur Zahlen
CREATE DOMAIN PLZ AS CHAR(5) CHECK (VALUE SIMILAR TO '[0-9]{5}');
-- Domäne auf bestehende Tabelle anwenden
ALTER TABLE Adresse
ALTER COLUMN PLZ TYPE PLZ
USING (PLZ::text);
-- Domäne anwenden
INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (13, 'Domänenstraße', '17', '50200', 'Klarstadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (14, 'Teststraße', '1', '12340', 'Teststadt');

INSERT INTO Adresse (A_ID, Straße, Hausnummer, PLZ, Ort)
VALUES (15, 'Fehlerstraße', '1', '1234', 'Fehlerstadt');
-- Ändern Sie den Datentyp der PLZ-Spalte
ALTER TABLE Adresse
ALTER COLUMN PLZ TYPE CHAR(5);


-- Löschen Sie den PLZ-Domänentyp
DROP DOMAIN PLZ;
-- Löschen Sie die Adresse mit der ID 14
DELETE FROM Adresse WHERE A_ID = 14;