library verilog;
use verilog.vl_types.all;
entity S_Box is
    port(
        State           : in     vl_logic_vector(7 downto 0);
        SubState        : out    vl_logic_vector(7 downto 0)
    );
end S_Box;
