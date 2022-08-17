CREATE TABLE `tbl_usuario` (
	`usuario_id` INT(11) NOT NULL AUTO_INCREMENT,
	`usuario_nombre` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci',
	`usuario_password` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`usuario_id`) USING BTREE,
	UNIQUE INDEX `usuario_nombre` (`usuario_nombre`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;