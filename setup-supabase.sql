-- =============================================================
-- CALCULADORA DE RENDA — SOLAGORA
-- Execute este script no SQL Editor do seu projeto Supabase
-- =============================================================

CREATE TABLE IF NOT EXISTS consultas (
  id               UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at       TIMESTAMPTZ DEFAULT NOW(),

  -- Identificação
  id_contrato      TEXT        NOT NULL,
  analista         TEXT        NOT NULL,

  -- Inputs do analista
  conta_energia    NUMERIC     NOT NULL,
  parcela          NUMERIC     NOT NULL,
  renda            NUMERIC     NOT NULL,
  consumo_kwh      NUMERIC     NOT NULL,
  pico_kwh         NUMERIC     NOT NULL,
  renda_individual NUMERIC,
  renda_presumida  NUMERIC,

  -- Resultados calculados
  taxa_kwh         NUMERIC,
  custo_pico       NUMERIC,
  res_5pct_conta   NUMERIC,
  res_10pct_conta  NUMERIC,
  res_5pct_pico    NUMERIC,
  res_10pct_pico   NUMERIC,
  status_5pct_conta  TEXT,
  status_10pct_conta TEXT,
  status_5pct_pico   TEXT,
  status_10pct_pico  TEXT,
  comprometimento  NUMERIC,
  renda_alvo       NUMERIC,

  -- Composição de Renda (aba Renda da planilha)
  renda_mes1           NUMERIC,
  renda_mes2           NUMERIC,
  renda_mes3           NUMERIC,
  renda_media_mensal   NUMERIC
);

-- Habilitar Row Level Security
ALTER TABLE consultas ENABLE ROW LEVEL SECURITY;

-- Permitir leitura e escrita pública (sem login)
CREATE POLICY "acesso_publico_leitura"  ON consultas FOR SELECT USING (true);
CREATE POLICY "acesso_publico_escrita"  ON consultas FOR INSERT WITH CHECK (true);
