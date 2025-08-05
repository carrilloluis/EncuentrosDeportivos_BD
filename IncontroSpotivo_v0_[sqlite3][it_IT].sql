CREATE TABLE IF NOT EXISTS ab ( -- Giaocatore
a_ INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, -- giocatoreID
b_ VARCHAR(40) NOT NULL, -- nomi 
c_ VARCHAR(80) NOT NULL, -- cognomi
d_ DATE NOT NULL, -- data de nascimento 
e_ CHAR(1) NULL -- stato fisico
);

CREATE TABLE IF NOT EXISTS bc ( -- Allenatore
a_ INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, -- allenatoreID
b_ VARCHAR(40) NOT NULL, -- nomi 
c_ VARCHAR(80) NOT NULL, -- cognomi
d_ DATE NOT NULL -- data de nascimento
);

CREATE TABLE IF NOT EXISTS cd ( -- Squadra 
a_ INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,  -- squadraID 
b_ CHAR(6) NOT NULL, -- città procedenza
c_ VARCHAR(80) NOT NULL -- nomi
);

CREATE TABLE IF NOT EXISTS de ( -- Partita
i_ INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,  -- partitaID 
a_ INTEGER UNSIGNED NOT NULL, -- squadra_locale
b_ INTEGER UNSIGNED NOT NULL, -- squadra_ospite
c_ CHAR(4) NOT NULL, -- anno del torneo
d_ DATE NOT NULL, -- data della partita
e_ INTEGER UNSIGNED NOT NULL DEFAULT 0, --  squadra_vincente / 0 = non vince niente
f_ CHAR(5) NOT NULL, -- punteggio della partita / score 
g_ TIME NOT NULL, -- ora di inizio della partita
h_ TIME NOT NULL, -- ora finale della partita
FOREIGN KEY (a_) REFERENCES cd(a_),
FOREIGN KEY (b_) REFERENCES cd(a_)
);

CREATE TABLE IF NOT EXISTS ef ( -- Arbitro
a_ INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, -- arbitroID
b_ VARCHAR(40) NOT NULL, -- nomi 
c_ VARCHAR(80) NOT NULL, -- cognomi
d_ DATE NOT NULL -- data de nascimento
);

CREATE TABLE IF NOT EXISTS fg ( -- Dettagli Partita
a_ INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, -- dettagliID
b_ INTEGER UNSIGNED NOT NULL, -- partitaID
c_ INTEGER UNSIGNED NOT NULL, -- allenatoreID squadra_locale
d_ INTEGER UNSIGNED NOT NULL, -- allenatoreID squadra_ospite
e_ INTEGER UNSIGNED NOT NULL, -- arbitroID
FOREIGN KEY (b_) REFERENCES de(i_),
FOREIGN KEY (c_) REFERENCES bc(a_),
FOREIGN KEY (d_) REFERENCES bc(a_),
FOREIGN KEY (e_) REFERENCES ef(a_)
);