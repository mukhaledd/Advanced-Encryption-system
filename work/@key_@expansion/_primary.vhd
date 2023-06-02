library verilog;
use verilog.vl_types.all;
entity Key_Expansion is
    generic(
        NK              : integer := 4;
        NR              : vl_notype
    );
    port(
        K               : in     vl_logic_vector;
        GeneratedKey    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NK : constant is 1;
    attribute mti_svvh_generic_type of NR : constant is 3;
end Key_Expansion;
