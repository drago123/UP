
CREATE TABLE Usuario(
  idusuario NUMBER PRIMARY KEY,
  username VARCHAR2(25) NOT NULL,
  password VARCHAR2(25) NOT NULL,
  nombre VARCHAR(15) NOT NULL,
  apellidos VARCHAR2(40) NOT NULL
);


CREATE SEQUENCE seq_usuarios_idusuario 
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 


CREATE TRIGGER trig_usuarios_seq
  BEFORE INSERT ON Usuario
  FOR EACH ROW
  BEGIN
    SELECT seq_usuarios_idusuario.nextval INTO :new.idusuario FROM dual;
  END
;


INSERT INTO Usuario (username, password, nombre, apellidos) values ('luis', '123456', 'luis estuardo', 'sanchez mejia')





CREATE TABLE Pais
(
idpais NUMBER PRIMARY KEY,
nombre VARCHAR2(25) NOT NULL
);


CREATE SEQUENCE seq_pais_idpais
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 


CREATE TRIGGER trig_pais_seq
  BEFORE INSERT ON Pais
  FOR EACH ROW
  BEGIN
    SELECT seq_pais_idpais.nextval INTO :new.idpais FROM dual;
  END


INSERT INTO Pais(nombre) values ('Guatemala')
INSERT INTO Pais(nombre) values ('Argentina')


CREATE TABLE Cliente(
  idcliente  NUMBER PRIMARY KEY,
  nombre VARCHAR(15) NOT NULL,
  apellidos VARCHAR2(40) NOT NULL,
  fechanacimiento DATE NULL,
  idpais NUMBER NOT NULL,
  CONSTRAINT fk_pais
    FOREIGN KEY (idpais)
    REFERENCES Pais(idpais));




CREATE SEQUENCE seq_cliente_idcliente
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 


CREATE TRIGGER trig_cliente_seq
  BEFORE INSERT ON Cliente
  FOR EACH ROW
  BEGIN
    SELECT seq_cliente_idcliente.nextval INTO :new.idcliente FROM dual;
  END
;


INSERT INTO Cliente(nombre, apellidos, fechanacimiento, idpais) values ('luis', 'sanchez', SYSDATE, 1)



CREATE TABLE Piloto
(
idpiloto NUMBER PRIMARY KEY,
nombre VARCHAR2(25)
);



CREATE SEQUENCE seq_Piloto_idpiloto
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 


CREATE TRIGGER trig_Piloto_seq
  BEFORE INSERT ON Piloto
  FOR EACH ROW
  BEGIN
    SELECT seq_Piloto_idpiloto.nextval INTO :new.idpiloto FROM dual;
  END



INSERT INTO TipoCuenta(nombre) values ('Juan Perez')
INSERT INTO TipoCuenta(nombre) values ('Erick Sanchez')


CREATE TABLE Aeropuerto
(
idaeropuerto NUMBER PRIMARY KEY,
nombre NUMBER NOT NULL,
idpais NUMBER NOT NULL,
CONSTRAINT fk_pais
    FOREIGN KEY (idpais)
    REFERENCES Pais(idpais)
);



CREATE SEQUENCE seq_aeropuerto_idaero
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 


CREATE TRIGGER trig_Aeropuerto_seq
  BEFORE INSERT ON Aeropuerto
  FOR EACH ROW
  BEGIN
    SELECT seq_aeropuerto_idaero.nextval INTO :new.idaeropuerto FROM dual;
  END

INSERT INTO Aeropuerto(nombre, idpais) values ('Aurora', 1)





CREATE TABLE Avion(
  idavion NUMBER PRIMARY KEY,
  nombre VARCHAR2(25) NOT NULL,
  idpais NUMBER NOT NULL, 
CONSTRAINT fk_pais
    FOREIGN KEY (idpais)
    REFERENCES Pais(idpais)
);


CREATE SEQUENCE seq_avion_idavion
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 




CREATE TRIGGER trig_avion_seq
  BEFORE INSERT ON Avion
  FOR EACH ROW
  BEGIN
    SELECT seq_avion_idavion.nextval INTO :new.idavion FROM dual;
  END
;



INSERT INTO Avion(nombre, idpais) values ('Ecax', 1)

INSERT INTO Avion(nombre, idpais) values ('Ecax12', 1)




CREATE TABLE Viaje(
  idviaje NUMBER PRIMARY KEY,
  passalida VARCHAR2(25) NOT NULL,
  horasalida DATE NOT NULL,
  pasentrada VARCHAR2(25) NOT NULL,
  horaentrada DATE NOT NULL,
  idpiloto NUMBER NOT NULL,
  idavion NUMBER NOT NULL, 
  idcliente NUMBER NOT NULL,
  idaeropuerto NUMBER NOT NULL
  CONSTRAINT fk_piloto
    FOREIGN KEY (idpiloto)
    REFERENCES Piloto(idpiloto),
  CONSTRAINT fk_avion
    FOREIGN KEY (idavion)
    REFERENCES Avion(idavion),
  CONSTRAINT fk_cliente
    FOREIGN KEY (idcliente)
    REFERENCES Cliente(idcliente),
  CONSTRAINT fk_aeropuerto
    FOREIGN KEY (idaeropuerto)
    REFERENCES Aeropuerto(idaeropuerto)
);


CREATE SEQUENCE seq_viaje_id
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 



CREATE TRIGGER trig_viaje_seq
  BEFORE INSERT ON Viaje
  FOR EACH ROW
  BEGIN
    SELECT seq_viaje_id.nextval INTO :new.idviaje FROM dual;
  END
;


CREATE FUNCTION VerificaLogin(usernameEntry IN VARCHAR2, passwordEntry IN VARCHAR2) 
   RETURN NUMBER 
   IS idusuarioRes NUMBER;
   BEGIN 
      SELECT idusuario
      INTO idusuarioRes
      FROM Usuario
      WHERE username = usernameEntry
      and password = passwordEntry
      and rownum = 1; 
      RETURN(idusuarioRes); 
    END;



