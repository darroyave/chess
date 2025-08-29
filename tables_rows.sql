create table tables (
  id uuid not null default extensions.uuid_generate_v4 (),
  table_number integer not null,
  capacity integer not null,
  status text not null default 'available'::text,
  location text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint tables_pkey primary key (id),
  constraint tables_table_number_key unique (table_number),
  constraint tables_capacity_check check ((capacity > 0)),
  constraint tables_status_check check (
    (
      status = any (
        array[
          'available'::text,
          'occupied'::text,
          'reserved'::text,
          'maintenance'::text
        ]
      )
    )
  )
) TABLESPACE pg_default;

create index IF not exists idx_tables_status on public.tables using btree (status) TABLESPACE pg_default;

create index IF not exists idx_tables_number on public.tables using btree (table_number) TABLESPACE pg_default;

INSERT INTO "tables" ("id", "table_number", "capacity", "status", "location", "created_at", "updated_at") VALUES ('012f9909-c734-4b65-ab62-cafb7e7729cd', '8', '6', 'occupied', 'Terraza', '2025-08-28 16:46:06.895137+00', '2025-08-28 17:30:55.874+00'), ('60fb1392-938f-425d-996e-8448c60d4915', '4', '4', 'available', 'Terraza', '2025-08-28 16:46:06.895137+00', '2025-08-28 16:46:06.895137+00'), ('7827a0c0-b98b-42ce-ac07-fdf3026b27e1', '7', '4', 'available', 'Interior', '2025-08-28 16:46:06.895137+00', '2025-08-28 16:46:06.895137+00'), ('974a4fbe-b182-4a1d-8eea-15a5de4fd5d2', '1', '4', 'available', 'Interior', '2025-08-28 16:46:06.895137+00', '2025-08-28 16:46:06.895137+00'), ('ae13751b-b0f0-4296-9fbf-1eef62957a62', '5', '8', 'available', 'VIP', '2025-08-28 16:46:06.895137+00', '2025-08-28 16:46:06.895137+00'), ('b344cdea-3931-4e7c-8c82-ce15dfb44807', '3', '6', 'available', 'Terraza', '2025-08-28 16:46:06.895137+00', '2025-08-28 16:46:06.895137+00'), ('ca17c535-765d-424f-9310-768e34b81cba', '6', '2', 'available', 'Barra', '2025-08-28 16:46:06.895137+00', '2025-08-28 16:46:06.895137+00'), ('fbfb19cf-f2fb-4f4e-be82-84455a44c38c', '2', '2', 'available', 'Interior', '2025-08-28 16:46:06.895137+00', '2025-08-28 16:46:06.895137+00');
