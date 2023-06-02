module shiftRows(input [0:127] in, output [0:127] out);

// first row: output is same as input
assign out[0:7] = in[0:7];
assign out[32:39] = in[32:39];
assign out[64:71] = in[64:71];
assign out[96:103] = in[96:103];

// second row: output is left-shifted by 1
assign out[8:15] = in[40:47];
assign out[40:47] = in[72:79];
assign out[72:79] = in[104:111];
assign out[104:111] = in[8:15];

// third row: output is left-shifted by 2
assign out[16:23] = in[80:87];
assign out[48:55] = in[112:119];
assign out[80:87] = in[16:23];
assign out[112:119] = in[48:55];

// fourth row: output is left-shifted by 3
assign out[24:31] = in[120:127];
assign out[56:63] = in[24:31];
assign out[88:95] = in[56:63];
assign out[120:127] = in[88:95];

endmodule
