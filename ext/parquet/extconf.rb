require "mkmf"
require "rb_sys/mkmf"

# Set RUSTFLAGS for musl targets to enable cdylib builds
# This is required for Alpine Linux where the default musl configuration
# only supports static linking
create_rust_makefile("parquet/parquet") do |r|
  if RUBY_PLATFORM.include?("musl")
    r.extra_rustflags = ["-C", "target-feature=-crt-static"]
  end
end
