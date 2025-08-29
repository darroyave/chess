create table products (
  id uuid not null default extensions.uuid_generate_v4 (),
  category_id uuid not null,
  name text not null,
  description text null,
  image_url text null,
  is_active boolean null default true,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint products_pkey primary key (id),
  constraint products_category_id_fkey foreign KEY (category_id) references categories (id) on delete CASCADE
);

create index IF not exists idx_products_category on public.products using btree (category_id) TABLESPACE pg_default;

create index IF not exists idx_products_active on public.products using btree (is_active) TABLESPACE pg_default;

INSERT INTO "products" ("id", "category_id", "name", "description", "image_url", "is_active", "created_at", "updated_at") VALUES ('2d8bf469-ea5a-47d8-bb62-236b2497fbd8', '931223e7-8ced-45ee-b285-1e26f90c63c6', 'Hamburguesa', 'Hamburguesa clásica con papas', null, 'true', '2025-08-28 16:45:28.986897+00', '2025-08-28 16:45:28.986897+00'), ('39dec0fe-2c39-4113-99f7-7e0261e1b514', 'c664b852-babc-4cab-af19-4e4048e77169', 'Refresco', 'Bebidas gaseosas', null, 'true', '2025-08-28 16:45:28.986897+00', '2025-08-28 16:45:28.986897+00'), ('3eefca0f-b565-4827-8153-5fdfd2ad620f', '931223e7-8ced-45ee-b285-1e26f90c63c6', 'Pizza', 'Pizza margarita', null, 'true', '2025-08-28 16:45:28.986897+00', '2025-08-28 16:45:28.986897+00'), ('a47985f6-f4d5-4dde-a9d9-7cc0aa334a4b', 'e35f87ce-67b9-483c-b979-d88b150ef7c9', 'Helado', 'Helado de vainilla', null, 'true', '2025-08-28 16:45:28.986897+00', '2025-08-28 16:45:28.986897+00'), ('ad73e0b4-c64f-4a3a-b12f-dc82ea617511', 'c664b852-babc-4cab-af19-4e4048e77169', 'Cerveza', 'Cerveza artesanal', null, 'true', '2025-08-28 16:45:28.986897+00', '2025-08-28 16:45:28.986897+00'), ('c8fcd9c1-5d31-478e-b18e-8f9844df4790', 'c664b852-babc-4cab-af19-4e4048e77169', 'Agua', 'Agua mineral', null, 'true', '2025-08-28 16:45:28.986897+00', '2025-08-28 16:45:28.986897+00'), ('e5221e94-5c42-4948-a70f-df511a14ea58', '7f6c738d-c76c-44d9-9eab-464be42d9f7e', 'Nachos', 'Nachos con queso', null, 'true', '2025-08-28 16:45:28.986897+00', '2025-08-28 16:45:28.986897+00'), ('e8f379e1-ed34-4b74-998d-b4625fd8d02d', 'c664b852-babc-4cab-af19-4e4048e77169', 'Whisky Something Special', 'Whisky premium escocés de malta única', null, 'true', '2025-08-28 17:17:21.396655+00', '2025-08-28 17:17:21.396655+00');
