

module KeyExpansion_tb();

reg[0:32*4-1] K1;
reg[0:32*6-1] K2;
reg[0:32*8-1] K3;
wire [0:32*4*(4+7)-1]GeneratedKey1;
wire [0:32*4*(6+7)-1]GeneratedKey2;
wire [0:32*4*(8+7)-1]GeneratedKey3;


initial begin
//NK=6;
K2=192'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b;

// NK=4;
K1 = 128'h2b7e151628aed2a6abf7158809cf4f3c;

//NK=8
K3=256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
end

Key_Expansion #(.NK(4)) bb1(K1,GeneratedKey1);
Key_Expansion #(.NK(6)) bb2(K2,GeneratedKey2);
Key_Expansion #(.NK(8)) bb3(K3,GeneratedKey3);

endmodule
