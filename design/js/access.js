const express = require("express");
const client = require("./db");
const router = express.Router();

// Obtener el listado de accesos que un usuario aun no ha solicitado
router.get("/list/faltantes/:id_usuario", async (req, res) => {
    const { id_usuario } = req.params;

    const query = `
        SELECT acc.id_acessos as id_accesos, acc.modulo, acc.estado, acc.id_especialidad
        FROM accesos acc
        LEFT JOIN accesos_usuario au ON acc.id_acessos = au.id_accesos AND au.id_usuario = ${id_usuario}
        WHERE au.id_accesos IS NULL
        ORDER BY acc.modulo ASC
    `;

    try {
        const result = await client.query(query);
        res.json(result.rows);
    } catch (error) {
        console.error("Error al obtener el listado de accesos:", error);
        res.status(500).send("Error al obtener el listado de accesos");
    }
});
// TODO: quitar los accesos de las especialidades del doctor


// Obtener el listado de accesos que un usuario ya ha solicitado
router.get("/list/solicitadas/:id_usuario", async (req, res) => {
    const { id_usuario } = req.params;
    const accesos_usuario = []

    try {
        const query_accesos_solicitados = `
            SELECT au.id_acc_usuario, au.id_accesos, acc.modulo, acc.id_especialidad, MAX(con.fecha_hora) AS fecha_ultima_consulta
            FROM accesos_usuario au
            JOIN accesos acc ON au.id_accesos = acc.id_acessos
            LEFT JOIN consulta con ON con.id_especialidad = acc.id_especialidad
            WHERE au.id_usuario = ${id_usuario}
            GROUP BY au.id_acc_usuario, au.id_accesos, acc.id_especialidad, acc.modulo
        `;
        const result_accesos_solicitados = await client.query(query_accesos_solicitados);
        
        const query_accesos_by_user_especiality = `
        SELECT a.*, MAX(con.fecha_hora) AS fecha_ultima_consulta
        FROM accesos a
        JOIN (
            SELECT de.id_especialidad 
            FROM doctor_especialidad de
            WHERE de.id_doctor = (SELECT id_doctor FROM doctor WHERE id_usuario = ${id_usuario})
        ) AS esp ON a.id_especialidad = esp.id_especialidad
        LEFT JOIN consulta con ON con.id_especialidad = a.id_especialidad
        GROUP BY a.id_acessos
        `;
        const result_accesos_by_user_especiality = await client.query(query_accesos_by_user_especiality);
        
        const accesos_by_user = result_accesos_by_user_especiality.rows.map((acceso)=>{
            return { id_acc_usuario: null, estado: true, id_accesos: acceso.id_acessos, id_especialidad: acceso.id_especialidad, modulo: acceso.modulo }
        })
        

        console.log('---> ', accesos_by_user);
        



        accesos_usuario.push(...accesos_by_user, ...result_accesos_solicitados.rows)

        res.json(accesos_usuario);
    } catch (error) {
        console.error("Error al obtener el listado de accesos:", error);
        res.status(500).send("Error al obtener el listado de accesos");
    }
});


// Obtener las solicitudes que aun no se han aceptado o rechazado
router.get("/solicitudes", async (req, res) => {
    const query = `
        SELECT a.id_acc_usuario, a.id_accesos, a.id_usuario, a.estado
        FROM accesos_usuario a
        WHERE a.estado IS NULL
    `;

    try {
        const result = await client.query(query);

        res.json(result.rows);
    } catch (error) {
        console.error("Error al obtener las solicidudes de accesos:", error);
        res.status(500).send("Error al obtener las solicidudes de accesos");
    }
});



// Enviar solicitud de acceso
router.post("/solicitudes", async (req, res) => {
    const { motivo, id_accesos, id_usuario } = req.body;

    if (!motivo) {
        return res
        .status(400)
        .json({ error: "Debe de ingresar el motivo de su solicitud." });
    }

    try {
        const query = `
            INSERT INTO accesos_usuario (id_accesos, id_usuario, estado, motivo)
            VALUES ($1, $2, $3, $4) RETURNING *
        `;

        const values = [id_accesos, id_usuario, null, motivo];
        const result = await client.query(query, values);

        if (result.rows.length > 0) {
        res
            .status(200)
            .json({ message: "Solicitud de acceso enviada correctamente" });
        } else {
        res.status(400).json({ message: "Error al enviar la solicitud." });
        }
    } catch (error) {
        console.log("error ", error);
        
        console.error("Error al registrar la solicidud de accesos:", error);
        res.status(500).send("Error al obtener las solicidudes de accesos");
    }
});

module.exports = router;
