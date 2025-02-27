--Výpočet průměrné doby schválení žádosti

SELECT Produkt, AVG(DATEDIFF(HOUR, Datum_Podani, Datum_Schvaleni)) AS Prumerna_Doba_Hodin
FROM BankovniZadosti
WHERE Stav = 'Schváleno'
GROUP BY Produkt;

-- Identifikace nevyřízených žádostí

SELECT * FROM BankovniZadosti WHERE Stav = 'Čeká na schválení';


-- Rozdělení žádostí podle oddělení

SELECT Odpovedny_utvar, COUNT(*) Pocet_zadosti
FROM BankovniZadosti
GROUP BY Odpovedny_Utvar;



-- Nejčastější důvody zamítnutí

SELECT Duvod_Odmitnuti,COUNT(*) pocet_odmitnutych
FROM BankovniZadosti
WHERE Stav = 'Odmítnuto'
GROUP BY Duvod_Odmitnuti
ORDER BY pocet_odmitnutych DESC;

-- Kolik zamítnutých žádostí má každý produkt?

SELECT Produkt, COUNT(*) AS Pocet_Odmitnutych
FROM BankovniZadosti
WHERE Stav = 'Odmítnuto'
GROUP BY Produkt;


-- Které oddělení zamítá nejvíce žádostí

SELECT Odpovedny_Utvar, COUNT(*) AS pocet_odmitnutych
FROM BankovniZadosti
WHERE Stav = 'Odmítnuto'
GROUP BY Odpovedny_Utvar;

-- Zamítnuto s hodnoty NULL

SELECT Stav, Duvod_Odmitnuti, COUNT(*)
FROM BankovniZadosti
WHERE Stav = 'Odmítnuto' AND Duvod_Odmitnuti IS NULL
GROUP BY Stav, Duvod_Odmitnuti;
