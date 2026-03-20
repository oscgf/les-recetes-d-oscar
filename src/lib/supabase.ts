import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Falten les variables d\'entornu de Supabase');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export interface Receta {
  id: string;
  titulu: string;
  descripcion: string;
  ingredientes: string[];
  pasos: string[];
  tiempu_preparacion: number;
  categoria: 'Primeros' | 'Segundos' | 'Postres' | 'Bebíes';
  imaxe_url: string;
  user_id: string;
  created_at: string;
}

export async function getRecetes(): Promise<Receta[]> {
  const { data, error } = await supabase
    .from('recetes')
    .select('*')
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Error al cargar les recetes:', error);
    return [];
  }

  return data || [];
}

export async function getReceteById(id: string): Promise<Receta | null> {
  const { data, error } = await supabase
    .from('recetes')
    .select('*')
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error al cargar la receta:', error);
    return null;
  }

  return data;
}

export async function getRecetesByCategoria(categoria: string): Promise<Receta[]> {
  const { data, error } = await supabase
    .from('recetes')
    .select('*')
    .eq('categoria', categoria)
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Error al filtrar les recetes:', error);
    return [];
  }

  return data || [];
}

export async function createReceta(recetaData: Omit<Receta, 'id' | 'created_at'>): Promise<Receta | null> {
  const { data, error } = await supabase
    .from('recetes')
    .insert([recetaData])
    .select()
    .single();

  if (error) {
    console.error('Error al crear la receta:', error);
    return null;
  }

  return data;
}

export async function uploadImaxe(file: File): Promise<string | null> {
  const fileExt = file.name.split('.').pop();
  const fileName = `${Math.random().toString(36).substring(2)}-${Date.now()}.${fileExt}`;
  const filePath = `${fileName}`;

  const { error: uploadError } = await supabase.storage
    .from('recetes-imaxenes')
    .upload(filePath, file);

  if (uploadError) {
    console.error('Error al xubir la imaxe:', uploadError);
    return null;
  }

  const { data } = supabase.storage
    .from('recetes-imaxenes')
    .getPublicUrl(filePath);

  return data.publicUrl;
}
