-- Active: 1656462099096@@127.0.0.1@3306@db_factura
insert into tbl_empresa(empresa_nombre,empresa_direccion,empresa_ruc)
values
('NOTICIERO DEL CONTADOR S.A.C.','CALLE MARTIN OLAYA 129 DPTO 1107 ALT CDRA 01 DE AV PARDO - MIRAFLORES - LIMA -LIMA','20556106909'),
('ESTUDIO FERN E.I.R.L.','CALLE LAS BEGONIAS 123 JESUS MARIA - LIMA -LIMA','20600647840');
select * from tbl_empresa;

insert into tbl_producto(producto_codigo,producto_descripcion,producto_unidad_medida)
values('ASESORIA','SERVICIO DE CONSULTORIA EMPRESARIAL SEGUN COTIZACIÓN 235-2021','UNIDAD');

select * from tbl_producto;

insert into tbl_factura(factura_nro,factura_fecha_emision,factura_tipo_moneda,factura_valor_venta,factura_importe_total,emisor_id,cliente_id)
values('E001-1212','2021-09-13','SOLES',500,590,1,2);

select * from tbl_factura;

insert into tbl_factura_detalle(factura_id,producto_id,facdet_cantidad,facdet_valor_unitario)
values(1,1,1,500);

insert into tbl_impuesto(impuesto_nombre,impuesto_porcentaje,impuesto_monto)
values ('ISC',5,0),('IGV',18,0),('ICBPER',0,0.10);

select * from tbl_impuesto;

insert into tbl_factura_impuesto(factura_id,impuesto_id,facimp_monto)
values(1,1,0),(1,2,90),(1,3,0);

select 
e.empresa_nombre as emisor_nombre,
e.empresa_ruc as emisor_ruc,
c.empresa_nombre as cliente_nombre,
c.empresa_ruc as cliente_ruc,
f.factura_nro as nro,
f.factura_fecha_emision as fecha_emision,
f.factura_tipo_moneda as tipo_moneda,
f.factura_valor_venta as valor_venta,
(select facimp_monto from tbl_factura_impuesto fi where fi.factura_id = f.factura_id and fi.impuesto_id = 2) as valor_igv,
f.factura_importe_total as importe_total
from tbl_factura f
inner join tbl_empresa e on f.emisor_id = e.empresa_id
inner join tbl_empresa c on f.cliente_id = c.empresa_id