/*Se ingresan 3 clientes*/
INSERT INTO cliente (idCliente, cliente.name, adress, email, phone) VALUES (1, "David Gonzalez", "Calle 161", "david@gmail.com", "32145678");
INSERT INTO cliente (idCliente, cliente.name, adress, email, phone) VALUES (2, "Diego Perez", "Calle 162", "diego@gmail.com", "31256478");
INSERT INTO cliente (idCliente, cliente.name, adress, email, phone) VALUES (3, "Sergio Vargas", "Calle 163", "sergio@gmail.com", "36259841");

/*Se ingresan 3 abogados*/
INSERT INTO lawyer (idLawyer, lawyer.name, Professional_card, phone, email, adress) VALUES (10, "Tuneivash Vargas",101, "34152689", "Tuneivash@gmail.com", "Calle 61");
INSERT INTO lawyer (idLawyer, lawyer.name, Professional_card, phone, email, adress) VALUES (20, "Felipe Martin",102, "38452619", "Felipe@gmail.com", "Calle 62");
INSERT INTO lawyer (idLawyer, lawyer.name, Professional_card, phone, email, adress) VALUES (30, "Salome Torres",103, "30254168", "Salome@gmail.com", "Calle 63");

/*Se establecen los estados en la tabla de estado de caso*/
INSERT INTO case_state (idCase_state, State) VALUES (1000, "Sin iniciar");
INSERT INTO case_state (idCase_state, State) VALUES (2000, "En trámite");
INSERT INTO case_state (idCase_state, State) VALUES (3000, "Archivado");

/*Se ingresan 3 casos*/
INSERT INTO caso (idCaso, caso.name, start_date, finish_date, Case_state_idCase_state, Cliente_idCliente) VALUES (11, "Divorcio", "25-02-12", "25-03-12", 3000, 1);
INSERT INTO caso (idCaso, caso.name, start_date, finish_date, Case_state_idCase_state, Cliente_idCliente) VALUES (12, "Recuperación de propiedad", "25-02-12", "no terminado", 2000, 3);
INSERT INTO caso (idCaso, caso.name, start_date, finish_date, Case_state_idCase_state, Cliente_idCliente) VALUES (13, "Defensa", "25-02-12", "", 1000, 2);

/*Recuperar un abogado según su cedula (id)*/
SELECT * FROM lawyer WHERE idLawyer = 10;

/*Recuperar todos los casos por un estado de caso*/
SELECT * FROM caso WHERE Case_state_idCase_state = 1000;

/*Actualice el registro de un caso*/
UPDATE caso SET Case_state_idCase_state = 2000 WHERE Case_state_idCase_state = 1000;
SELECT * FROM caso WHERE Case_state_idCase_state = 2000;

/*Elimine un caso*/
DELETE FROM caso WHERE idCaso = 13;

