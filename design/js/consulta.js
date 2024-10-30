const express = require('express');
const client = require('./db'); 
const router = express.Router();

router.get('/informacion-cita/:id_cita', async (req, res) => {
    const { id_cita } = req.params;

    try {
        const citaQuery = `
            SELECT 
                p.id_paciente,
                CONCAT(p.nombre, ' ', p.apellido) AS nombre_paciente,
                p.cedula,
                d.id_doctor,
               ARRAY_AGG(json_build_object('id_especialidad', e.id_especialidad, 'nombre_especialidad', e.especialidad)) AS especialidades
            FROM 
                cita c
                JOIN paciente p ON c.id_paciente = p.id_paciente
                JOIN doctor d ON c.id_doctor = d.id_doctor
                JOIN doctor_especialidad de ON d.id_doctor = de.id_doctor
                JOIN especialidad e ON de.id_especialidad = e.id_especialidad
            WHERE 
                c.id_cita = $1
            GROUP BY 
                p.id_paciente, p.nombre, p.apellido, p.cedula, d.id_doctor
        `;

        const citaResult = await client.query(citaQuery, [id_cita]);

        if (citaResult.rows.length > 0) {
            res.status(200).json(citaResult.rows[0]);
        } else {
            res.status(404).json({ message: 'Información no encontrada para esta cita' });
        }
    } catch (error) {
        console.error('Error al obtener la información de la cita', error);
        res.status(500).json({ message: 'Error al obtener la información de la cita' });
    }
});

router.post('/registerConsulta', async (req, res) => {
    const { motivo, descripcion, fecha_hora, estado, id_cita, notas_internas, notas_externas, pruebas, resultados_pruebas, id_especialidad } = req.body;

    try {
        const consultaQuery = `
            INSERT INTO consulta (motivo, descripcion, fecha_hora, estado, id_cita, notas_internas, notas_externas, pruebas, resultados_pruebas, id_especialidad)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
            RETURNING *;
        `;

        const values = [
            motivo,
            descripcion,
            fecha_hora,
            estado,
            id_cita,
            notas_internas,
            notas_externas,
            pruebas || null, 
            resultados_pruebas || null,
            id_especialidad
        ];

        const consultaResult = await client.query(consultaQuery, values);
        res.status(201).json(consultaResult.rows[0]); 
    } catch (error) {
        console.error('Error al agregar la consulta', error);
        res.status(500).json({ message: 'Error al agregar la consulta' });
    }
});


module.exports = router;