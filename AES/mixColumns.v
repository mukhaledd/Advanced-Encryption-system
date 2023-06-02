module mixColumns(inState, outState);

input[0:127] inState;
output[0:127] outState;


// multiplication by 2: leftshift by one bit and xor with 1b iff MSB is 1
function [0:7] mulBy2;
	input [0:7] inp;
	begin
		mulBy2 = (inp[0] == 1'b0)? (inp << 1): (inp << 1)^8'h1b;
	end

endfunction

// multiplication by 3 = multiplication by (2 ^ 1)

function [0:7] mulBy3;
	input [0:7] inp;
	begin
		mulBy3 = mulBy2(inp) ^ inp;
	end
endfunction



genvar i;

generate

	for(i = 0; i < 4; i = i + 1) begin: mc_steps
	
	assign outState[i*32 +: 8] = mulBy2(inState[i*32 +: 8]) ^ mulBy3(inState[(i*32+8) +: 8]) ^ inState[(i*32+16) +: 8] ^ inState[(i*32+24) +: 8];
	assign outState[(i*32+8) +: 8] = inState[i*32 +: 8] ^ mulBy2(inState[(i*32+8) +: 8]) ^ mulBy3(inState[(i*32+16) +: 8]) ^ inState[(i*32+24) +: 8];
	assign outState[(i*32+16) +: 8] = inState[i*32 +: 8] ^ inState[(i*32+8) +: 8] ^ mulBy2(inState[(i*32+16) +: 8]) ^ mulBy3(inState[(i*32+24) +: 8]);
	assign outState[(i*32+24) +: 8] = mulBy3(inState[i*32 +: 8]) ^ inState[(i*32+8) +: 8] ^ inState[(i*32+16) +: 8] ^ mulBy2(inState[(i*32+24) +: 8]);
	
	end

endgenerate



endmodule
