create table product_sizes (
  id uuid not null default extensions.uuid_generate_v4 (),
  product_id uuid not null,
  size_name text not null,
  price numeric(10, 2) not null,
  is_active boolean null default true,
  created_at timestamp with time zone null default now(),
  constraint product_sizes_pkey primary key (id),
  constraint product_sizes_product_id_fkey foreign KEY (product_id) references products (id) on delete CASCADE,
  constraint product_sizes_price_check check ((price >= (0)::numeric))
);

create index IF not exists idx_product_sizes_product on public.product_sizes using btree (product_id) TABLESPACE pg_default;

create index IF not exists idx_product_sizes_active on public.product_sizes using btree (is_active) TABLESPACE pg_default;

INSERT INTO "product_sizes" ("id", "product_id", "size_name", "price", "is_active", "created_at") VALUES ('00288535-699b-40ca-b132-8efc8ec1fab6', 'ad73e0b4-c64f-4a3a-b12f-dc82ea617511', 'Grande (500ml)', '35.00', 'true', '2025-08-28 16:45:48.919385+00'), ('0b880844-8f00-4be7-9a68-d7bbadbdd7cc', 'e5221e94-5c42-4948-a70f-df511a14ea58', 'Porción', '60.00', 'true', '2025-08-28 16:45:48.919385+00'), ('2a02889e-c860-437f-aed1-a05515c6fe48', 'e8f379e1-ed34-4b74-998d-b4625fd8d02d', 'Copa', '12.00', 'true', '2025-08-28 17:20:44.34003+00'), ('2d498252-8587-42c4-8b1e-f49df094af67', 'e8f379e1-ed34-4b74-998d-b4625fd8d02d', 'Media', '45.00', 'true', '2025-08-28 17:20:50.379679+00'), ('3dae3d51-3315-435d-99d2-e94086366a63', '3eefca0f-b565-4827-8153-5fdfd2ad620f', 'Grande', '200.00', 'true', '2025-08-28 16:45:48.919385+00'), ('49a011ad-5f53-425b-81e1-5c62b82f3b20', '3eefca0f-b565-4827-8153-5fdfd2ad620f', 'Mediana', '150.00', 'true', '2025-08-28 16:45:48.919385+00'), ('4c096255-461b-48c9-8782-22c8c536367f', 'a47985f6-f4d5-4dde-a9d9-7cc0aa334a4b', '1 Bola', '30.00', 'true', '2025-08-28 16:45:48.919385+00'), ('65e46e98-346c-49c0-ae6b-5669e52fca71', '39dec0fe-2c39-4113-99f7-7e0261e1b514', 'Lata (355ml)', '20.00', 'true', '2025-08-28 16:45:48.919385+00'), ('7a092e4d-9ce3-4760-9eab-5e6b9dbcda47', 'e8f379e1-ed34-4b74-998d-b4625fd8d02d', 'Botella', '280.00', 'true', '2025-08-28 17:20:56.690327+00'), ('8d16918a-744d-42c4-903d-247d36e8b15c', 'c8fcd9c1-5d31-478e-b18e-8f9844df4790', 'Botella (500ml)', '15.00', 'true', '2025-08-28 16:45:48.919385+00'), ('af357383-62bf-4070-a7b1-fce0cc99d079', 'a47985f6-f4d5-4dde-a9d9-7cc0aa334a4b', '2 Bolas', '50.00', 'true', '2025-08-28 16:45:48.919385+00'), ('c68ae355-8e7d-4ea8-b619-a33596bd7c9d', '39dec0fe-2c39-4113-99f7-7e0261e1b514', 'Botella (600ml)', '25.00', 'true', '2025-08-28 16:45:48.919385+00'), ('dd68c0d6-6b89-434c-8cff-6d05d6a7738a', 'ad73e0b4-c64f-4a3a-b12f-dc82ea617511', 'Pequeña (330ml)', '25.00', 'true', '2025-08-28 16:45:48.919385+00'), ('f16ad4f2-1ee9-41f2-bb32-4060f48537dc', '2d8bf469-ea5a-47d8-bb62-236b2497fbd8', 'Doble', '120.00', 'true', '2025-08-28 16:45:48.919385+00'), ('f88f3685-110f-458b-9e39-509126520031', '2d8bf469-ea5a-47d8-bb62-236b2497fbd8', 'Simple', '85.00', 'true', '2025-08-28 16:45:48.919385+00');
