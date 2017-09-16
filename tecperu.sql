
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





CREATE TABLE TipoCuenta
(
idtipoCuenta NUMBER PRIMARY KEY,
nombre VARCHAR2(25)
);



CREATE SEQUENCE seq_tipocuenta_idtipoCuenta
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 


CREATE TRIGGER trig_tipoCuenta_seq
  BEFORE INSERT ON TipoCuenta
  FOR EACH ROW
  BEGIN
    SELECT seq_tipocuenta_idtipoCuenta.nextval INTO :new.idtipoCuenta FROM dual;
  END



INSERT INTO TipoCuenta(nombre) values ('Monetaria')
INSERT INTO TipoCuenta(nombre) values ('Ahorro')


CREATE TABLE Cuenta
(
idcuenta NUMBER PRIMARY KEY,
idtipocuenta NUMBER NOT NULL,
idcliente NUMBER NOT NULL,
numeroCuenta VARCHAR2(25),
CONSTRAINT fk_tipocuenta
    FOREIGN KEY (idtipoCuenta)
    REFERENCES TipoCuenta(idtipoCuenta),
CONSTRAINT fk_usuario
    FOREIGN KEY (idcliente)
    REFERENCES Cliente(idcliente)
);



CREATE SEQUENCE seq_cuenta_idcuenta
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 


CREATE TRIGGER trig_cuenta_seq
  BEFORE INSERT ON Cuenta
  FOR EACH ROW
  BEGIN
    SELECT seq_cuenta_idcuenta.nextval INTO :new.idcuenta FROM dual;
  END



INSERT INTO Cuenta(idtipocuenta, idpais, idcliente, numerocuenta) values (2, 1, 1, '002345678998-1')





CREATE TABLE TipoMovimientoBancario(
  idtipomovimientobancario NUMBER PRIMARY KEY,
  nombre VARCHAR2(25) NOT NULL
);


CREATE SEQUENCE seq_tipomovimientobancario_id
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 




CREATE TRIGGER trig_tipomoentoban_seq
  BEFORE INSERT ON TipoMovimientoBancario
  FOR EACH ROW
  BEGIN
    SELECT seq_tipomovimientobancario_id.nextval INTO :new.idtipomovimientobancario FROM dual;
  END
;





CREATE TABLE MovimientoBancario(
  idMovimientoBancario NUMBER PRIMARY KEY,
  idcuenta NUMBER NOT NULL,
  idtipomovimientobancario NOT NULL,
  CONSTRAINT fk_cuenta
    FOREIGN KEY (idcuenta)
    REFERENCES Cuenta(idcuenta),
  CONSTRAINT fk_tipomovimiento
    FOREIGN KEY (idtipomovimientobancario)
    REFERENCES TipoMovimientoBancario(idtipomovimientobancario)
);


CREATE SEQUENCE seq_movimientobancario_id
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE; 



CREATE TRIGGER trig_MovimientoBancario_seq
  BEFORE INSERT ON MovimientoBancario
  FOR EACH ROW
  BEGIN
    SELECT seq_movimientobancario_id.nextval INTO :new.idMovimientoBancario FROM dual;
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



