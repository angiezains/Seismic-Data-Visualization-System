-- Creación de la tabla para almacenar los resultados del modelo de Inteligencia Artificial (Detección de Anomalías / Predicciones)
CREATE TABLE IF NOT EXISTS predicciones_ia (
    id_prediccion INT PRIMARY KEY,
    id_sismo INT, -- Referencia al hecho/sismo analizado
    anomalia_detectada BOOLEAN, -- Resultado de la clasificación del modelo (True/False)
    score_confianza DOUBLE PRECISION, -- Probabilidad o certeza del modelo (ej. 0.95)
    version_modelo VARCHAR(50), -- Versión del algoritmo que generó la predicción
    fecha_generacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Marca de tiempo exacta
    CONSTRAINT fk_sismo FOREIGN KEY (id_sismo) REFERENCES dim_sismos(id_sismo)
);

-- Inserción de un registro de prueba para demostrar el funcionamiento
INSERT INTO predicciones_ia (id_prediccion, id_sismo, anomalia_detectada, score_confianza, version_modelo) 
VALUES (1, 1, TRUE, 0.985, 'IsolationForest_v2.1.0');
