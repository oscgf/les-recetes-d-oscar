-- Crear la tabla de recetes
CREATE TABLE IF NOT EXISTS recetes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  titulu TEXT NOT NULL,
  descripcion TEXT NOT NULL,
  ingredientes TEXT[] NOT NULL,
  pasos TEXT[] NOT NULL,
  tiempu_preparacion INTEGER NOT NULL,
  categoria TEXT NOT NULL CHECK (categoria IN ('Primeros', 'Segundos', 'Postres', 'Bebíes')),
  imaxe_url TEXT NOT NULL,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Activar Row Level Security
ALTER TABLE recetes ENABLE ROW LEVEL SECURITY;

-- Policy: Toos pueden ver les recetes
CREATE POLICY "Les recetes son visibles pa toos"
  ON recetes
  FOR SELECT
  USING (true);

-- Policy: Solo usuarios autenticaos pueden crear recetes
CREATE POLICY "Usuarios autenticaos pueden crear recetes"
  ON recetes
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Policy: Solo'l propietariu puede actualizar les sos recetes
CREATE POLICY "Usuarios pueden actualizar les sos propies recetes"
  ON recetes
  FOR UPDATE
  USING (auth.uid() = user_id);

-- Policy: Solo'l propietariu puede desaniciar les sos recetes
CREATE POLICY "Usuarios pueden desaniciar les sos propies recetes"
  ON recetes
  FOR DELETE
  USING (auth.uid() = user_id);

-- Crear índices pa meyorar el rendimientu
CREATE INDEX idx_recetes_categoria ON recetes(categoria);
CREATE INDEX idx_recetes_created_at ON recetes(created_at DESC);
CREATE INDEX idx_recetes_user_id ON recetes(user_id);

-- Crear el bucket de storage pa les imáxenes (executa esto na consola de Supabase Storage)
-- INSERT INTO storage.buckets (id, name, public) VALUES ('recetes-imaxenes', 'recetes-imaxenes', true);

-- Policies pa'l storage bucket 'recetes-imaxenes'
-- Llectura pública
CREATE POLICY "Les imáxenes son visibles pa toos"
  ON storage.objects
  FOR SELECT
  USING (bucket_id = 'recetes-imaxenes');

-- Escritura solo pa usuarios autenticaos
CREATE POLICY "Usuarios autenticaos pueden xubir imáxenes"
  ON storage.objects
  FOR INSERT
  WITH CHECK (
    bucket_id = 'recetes-imaxenes' 
    AND auth.role() = 'authenticated'
  );

-- Datos d'exemplu (opcional) - RECETES VEGANES
INSERT INTO recetes (titulu, descripcion, ingredientes, pasos, tiempu_preparacion, categoria, imaxe_url, user_id) VALUES
(
  'Fabada Vegana Asturiana',
  'Versión vegana del platu más tradicional d''Asturies. Fabes con verdures y especias que te calentarán el cuerpu y l''alma.',
  ARRAY[
    '500g de fabes asturianes',
    '200g de seitán o chorizu veganu',
    '150g de morcilla vegana',
    '2 cebolles',
    '6 dientes d''ayu',
    '2 fueyes de llaurel',
    '1 cucharadina de pimentón ahumáu',
    'Azafrán',
    'Sal',
    'Aceite d''oliva',
    'Pimienta negra'
  ],
  ARRAY[
    'Dexa les fabes a remoyu la nueche anterior con agua fría',
    'Escurre les fabes y ponles nuna cazuela grande con agua fría',
    'Añade la cebolla pelada entera, l''ayu y les fueyes de llaurel',
    'Cuando empiece a ferver, baxa''l fueu y cuez a fueu lentu',
    'Tres 1 hora, añade''l seitán o chorizu veganu y la morcilla vegana',
    'Añade''l pimentón ahumáu pa dar sabor',
    'Sigue cociendo a fueu lentu unes 2 hores más',
    'Añade l''azafrán, sal y pimienta al gustu',
    'Dexa reposar 10 minutos enantes de sirvir'
  ],
  180,
  'Primeros',
  'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&q=80',
  (SELECT id FROM auth.users LIMIT 1)
),
(
  'Setes en Sidra',
  'Setes fresques cocinades na sidra asturiana, un platu del monte con sabor tradicional y totalmente veganu.',
  ARRAY[
    '500g de setes variades (boletus, shiitake, champiñones)',
    '1 botella de sidra asturiana',
    '6 dientes d''ayu',
    '2 cebolles',
    'Perejil frescu',
    'Tomillu',
    'Sal',
    'Pimienta',
    'Aceite d''oliva'
  ],
  ARRAY[
    'Llimpia bien les setes y córtales en trozos',
    'Pela y pica l''ayu y la cebolla finamente',
    'Nuna sartén grande, calienta l''aceite y sofríe l''ayu y la cebolla',
    'Añade les setes y saltéales hasta que suelten l''agua',
    'Vierte la sidra y dexa que reduzca a fueu mediu',
    'Añade sal, pimienta, tomillu y perejil picao',
    'Cuez unos 20-25 minutos hasta que les setes tean tiernes',
    'Sirve caliente col caldín de sidra'
  ],
  45,
  'Segundos',
  'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=800&q=80',
  (SELECT id FROM auth.users LIMIT 1)
),
(
  'Casadielles Veganes',
  'Dulce tradicional asturianu en versión vegana, una empanadilla rellena de nueces y anís, frita y espolvoriada con azucre.',
  ARRAY[
    '500g de farina',
    '100ml d''aceite d''oliva',
    '100ml de vinu blancu',
    '50ml d''agua',
    '200g de nueces picaes',
    '150g d''azucre morenu',
    '1 cucharada d''anís',
    '1 cucharadina de canela',
    'Azucre pa espolvoriar',
    'Aceite pa freír'
  ],
  ARRAY[
    'Mezcla la farina col aceite, el vinu y l''agua hasta formar una masa',
    'Dexa reposar la masa 30 minutos tapada',
    'Prepara''l rellenu mezclando les nueces, l''azucre, l''anís y la canela',
    'Estira la masa finamente y corta círculos de 10cm',
    'Pon una cucharada de rellenu nel centru de cada círculu',
    'Dobla per la metá y sella los bordes con un tenedor',
    'Fríe les casadielles n''aceite caliente hasta que tean doraes',
    'Escurre sobre papel y espolvorea con azucre'
  ],
  90,
  'Postres',
  'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800&q=80',
  (SELECT id FROM auth.users LIMIT 1)
),
(
  'Sidra Natural Asturiana',
  'La bebida más emblemática d''Asturies y naturalmente vegana. Aprende a escanciar y esfrutar d''una bona sidra natural.',
  ARRAY[
    '1 botella de sidra natural asturiana',
    'Vasu de sidra (culín)'
  ],
  ARRAY[
    'Enfría la sidra a temperatura ambiente (nun la metas na nevera)',
    'Suxeta la botella en altu cola mano derecha',
    'Pon el vasu abaxo, inclináu llixeramente',
    'Vierte la sidra dende l''altor pa que se oxixene (escanciáu)',
    'Llena solo un culín (un pocu) nel fondu del vasu',
    'Bebe d''un tragu y tira''l restu',
    'Repite''l procesu pa cada persona',
    'Disfruta de la sidra con bona compañía'
  ],
  5,
  'Bebíes',
  'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=800&q=80',
  (SELECT id FROM auth.users LIMIT 1)
);
