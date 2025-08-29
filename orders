create table orders (
  id uuid not null default extensions.uuid_generate_v4 (),
  table_id uuid null,
  order_number text not null,
  customer_name text null,
  status text not null default 'pending'::text,
  total_amount numeric(10, 2) null default 0,
  tax_amount numeric(10, 2) null default 0,
  discount_amount numeric(10, 2) null default 0,
  payment_method text null,
  notes text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  completed_at timestamp with time zone null,
  constraint orders_pkey primary key (id),
  constraint orders_order_number_key unique (order_number),
  constraint orders_table_id_fkey foreign KEY (table_id) references tables (id),
  constraint orders_tax_amount_check check ((tax_amount >= (0)::numeric)),
  constraint orders_discount_amount_check check ((discount_amount >= (0)::numeric)),
  constraint orders_total_amount_check check ((total_amount >= (0)::numeric)),
  constraint orders_payment_method_check check (
    (
      payment_method = any (
        array['cash'::text, 'card'::text, 'transfer'::text]
      )
    )
  ),
  constraint orders_status_check check (
    (
      status = any (
        array[
          'pending'::text,
          'preparing'::text,
          'ready'::text,
          'delivered'::text,
          'paid'::text,
          'cancelled'::text
        ]
      )
    )
  )
) TABLESPACE pg_default;

create index IF not exists idx_orders_table on public.orders using btree (table_id) TABLESPACE pg_default;

create index IF not exists idx_orders_status on public.orders using btree (status) TABLESPACE pg_default;

create index IF not exists idx_orders_created on public.orders using btree (created_at) TABLESPACE pg_default;

create index IF not exists idx_orders_number on public.orders using btree (order_number) TABLESPACE pg_default;
