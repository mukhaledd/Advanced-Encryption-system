library verilog;
use verilog.vl_types.all;
entity Encryption is
    generic(
        Nk              : integer := 4;
        Nr              : vl_notype
    );
    port(
        \in\            : in     vl_logic_vector(0 to 127);
        key             : in     vl_logic_vector;
        \out\           : out    vl_logic_vector(0 to 127)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Nk : constant is 1;
    attribute mti_svvh_generic_type of Nr : constant is 3;
end Encryption;
