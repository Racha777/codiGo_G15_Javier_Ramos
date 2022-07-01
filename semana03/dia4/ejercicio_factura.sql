DELIMITER $$

DROP PROCEDURE IF EXISTS registrar_factura $$
CREATE PROCEDURE registrar_factura(IN nro_fact VARCHAR(100), IN fecha_e DATE, IN moneda VARCHAR(20), IN valor_venta DOUBLE, IN emisor INT, IN cliente INT)
BEGIN
    --variables
    DECLARE impuestoId INT;
    DECLARE porc_impuesto DOUBLE;
    DECLARE valor_impuesto DOUBLE;
    DECLARE numeroImpuestos INT;
    DECLARE totalImpuestos DOUBLE;
    DECLARE facturaId INT;
    DECLARE importe_total DOUBLE;

    SET impuestoId=1;
    SET porc_impuesto=0;
    SET valor_impuesto=0;
    SET numeroImpuestos=0;
    SET totalImpuestos=0;
    SET facturaId=0;
    SET importe_total=0;
    --insertar datos
    INSERT INTO tbl_factura(factura_nro,factura_fecha_emision,factura_tipo_moneda,factura_valor_venta,emisor_id,cliente_id,factura_importe_total)
    VALUES(nro_fact,fecha_e,moneda,valor_venta,emisor,cliente,0);

    --calcular impuesto
    SELECT count(*) INTO numeroImpuestos from tbl_impuesto;
    SELECT max(factura_id) INTO facturaId FROM tbl_factura;

    WHILE impuestoId<=numeroImpuestos DO
        SELECT impuesto_porcentaje INTO porc_impuesto from tbl_impuesto;
        IF porc_impuesto=0 THEN
            SELECT impuesto_monto INTO valor_impuesto from tbl_impuesto WHERE impuesto_id=impuestoId;
        ELSE
            SELECT impuesto_porcentaje INTO porc_impuesto FROM tbl_impuesto WHERE impuesto_id=impuestoId;
            SET valor_impuesto=(porc_impuesto*valor_venta)/100;
        END IF;

        INSERT INTO tbl_factura_impuesto(facimp_monto,factura_id,impuesto_id)
        values(valor_impuesto,facturaId,impuestoId);

        SET impuestoId=impuestoId+1;

    END WHILE;

    SELECT sum(facimp_monto) INTO totalImpuestos from tbl_factura_impuesto WHERE factura_id=facturaId;
    SET importe_total=valor_venta+totalImpuestos;
    UPDATE tbl_factura SET factura_importe_total=importe_total WHERE factura_id=facturaId;
    --INSERT INTO tbl_factura(factura_importe_total) values(importe_total) WHERE factura_id=facturaId;

END
$$

DELIMITER ;

CALL registrar_factura('E001-1213','2022-06-30','SOLES',100,1,2);