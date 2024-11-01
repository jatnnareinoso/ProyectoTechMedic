const express = require('express');
const client = require('./db'); 
const router = express.Router();


router.get('/paciente/:id_paciente', async (req, res) => {
    const idPaciente = req.params.id_paciente;

    try {
        const result = await client.query('SELECT * FROM paciente WHERE id_paciente = $1', [idPaciente]);

        if (result.rows.length > 0) {
            res.json(result.rows[0]); 
        } else {
            res.status(404).json({ message: 'Paciente no encontrado' }); 
        }
    } catch (error) {
        console.error('Error al obtener el paciente:', error);
        res.status(500).json({ message: 'Error al obtener el paciente' }); 
    }
});

router.get('/consultas/paciente/:id_paciente', async (req, res) => {
    const { id_paciente } = req.params;

    try {
        const result = await client.query(
            `SELECT 
                c.id_cita,
                c.fecha_hora AS fecha_consulta,
                e.id_especialidad,          -- Selecciona el id_especialidad
                e.especialidad AS especialidad, 
                CONCAT(u.nombre, ' ', u.apellido) AS doctor
            FROM 
                consulta c
            JOIN 
                especialidad e ON c.id_especialidad = e.id_especialidad
            JOIN 
                cita ct ON c.id_cita = ct.id_cita
            JOIN 
                doctor d ON ct.id_doctor = d.id_doctor
            JOIN 
                usuario u ON d.id_usuario = u.id_usuario
            WHERE 
                ct.id_paciente = $1
            GROUP BY 
                e.id_especialidad, e.especialidad, u.nombre, u.apellido, c.fecha_hora, c.id_cita
            ORDER BY 
                c.fecha_hora DESC;
            `,
            [id_paciente]
        );

        const consultasAgrupadas = result.rows.reduce((acc, row) => {
            const especialidad = row.especialidad;
            if (!acc[especialidad]) {
                acc[especialidad] = {
                    especialidad,
                    id_especialidad: row.id_especialidad,  
                    consultas: []
                };
            }
            acc[especialidad].consultas.push({
                fecha_consulta: row.fecha_consulta,
                doctor: row.doctor
            });
            return acc;
        }, {});

        res.json(Object.values(consultasAgrupadas));
    } catch (error) {
        console.error('Error al obtener las consultas:', error);
        res.status(500).json({ error: 'Error al obtener las consultas' });
    }
});


router.get('/consultas/pacientes/:id_paciente/especialidad/:id_especialidad', async (req, res) => {
    const { id_paciente, id_especialidad } = req.params;

    try {
        const result = await client.query(
            `SELECT 
                c.id_cita,
                c.fecha_hora AS fecha_consulta,
                e.especialidad AS especialidad, 
                CONCAT(u.nombre, ' ', u.apellido) AS doctor,
                c.motivo,
                c.descripcion,
                c.estado,
                c.notas_internas,
                c.notas_externas,
                c.pruebas,
                c.resultados_pruebas
            FROM 
                consulta c
            JOIN 
                especialidad e ON c.id_especialidad = e.id_especialidad
            JOIN 
                cita ct ON c.id_cita = ct.id_cita
            JOIN 
                doctor d ON ct.id_doctor = d.id_doctor
            JOIN 
                usuario u ON d.id_usuario = u.id_usuario
            WHERE 
                ct.id_paciente = $1
                AND c.id_especialidad = $2
            ORDER BY 
                c.fecha_hora DESC;
            `,
            [id_paciente, id_especialidad]
        );

        const consultas = result.rows.map(row => ({
            id_cita: row.id_cita,
            fecha_consulta: row.fecha_consulta,
            doctor: row.doctor,
            motivo: row.motivo,
            descripcion: row.descripcion,
            estado: row.estado,
            notas_internas: row.notas_internas,
            notas_externas: row.notas_externas,
            pruebas: row.pruebas,
            resultados_pruebas: row.resultados_pruebas
        }));

        res.json(consultas);
    } catch (error) {
        console.error('Error al obtener las consultas del paciente por especialidad:', error);
        res.status(500).json({ error: 'Error al obtener las consultas del paciente por especialidad' });
    }
});



module.exports = router;