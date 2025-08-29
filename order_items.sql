create table order_items (
  id uuid not null default extensions.uuid_generate_v4 (),
  order_id uuid not null,
  product_size_id uuid not null,
  quantity integer not null,
  unit_price numeric(10, 2) not null,
  subtotal numeric(10, 2) not null,
  notes text null,
  created_at timestamp with time zone null default now(),
  constraint order_items_pkey primary key (id),
  constraint order_items_order_id_fkey foreign KEY (order_id) references orders (id) on delete CASCADE,
  constraint order_items_product_size_id_fkey foreign KEY (product_size_id) references product_sizes (id),
  constraint order_items_quantity_check check ((quantity > 0)),
  constraint order_items_subtotal_check check ((subtotal >= (0)::numeric)),
  constraint order_items_unit_price_check check ((unit_price >= (0)::numeric))
) TABLESPACE pg_default;

create index IF not exists idx_order_items_order on order_items using btree (order_id) TABLESPACE pg_default;

create index IF not exists idx_order_items_product_size on order_items using btree (product_size_id) TABLESPACE pg_default;
