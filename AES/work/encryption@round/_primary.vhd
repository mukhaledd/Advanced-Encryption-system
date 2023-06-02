library verilog;
use verilog.vl_types.all;
entity encryptionRound is
    generic(
        B               : integer := 128;
        Nr              : integer := 10;
        Nk              : integer := 4
    );
    port(
        \in\            : in     vl_logic_vector(0 to 127);
        key             : in     vl_logic_vector(0 to 127);
        \out\           : out    vl_logic_vector(0 to 127)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of B : constant is 1;
    attribute mti_svvh_generic_type of Nr : constant is 1;
    attribute mti_svvh_generic_type of Nk : constant is 1;
end encryptionRound;
