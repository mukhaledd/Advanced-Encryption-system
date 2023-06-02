library verilog;
use verilog.vl_types.all;
entity mixColumns is
    port(
        inState         : in     vl_logic_vector(0 to 127);
        outState        : out    vl_logic_vector(0 to 127)
    );
end mixColumns;
