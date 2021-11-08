// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract UniswapV2Pair {
    
    uint112 reserve0 = 1;
    uint112 reserve1 = 2;
    uint32 blockTimestampLast = 3;
    
    function getReserves() public view returns (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) {
        _reserve0 = reserve0;
        _reserve1 = reserve1;
        _blockTimestampLast = blockTimestampLast;
    }
    
}

interface IUniswapV2Pair{
        function getReserves() external view returns (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast);
}

contract MyContract {

    function Reserves(address _uniswapV2) external view returns (uint112) {
        uint112 _reserve0;
        uint112 _reserve1;
        (_reserve0, _reserve1, ) = IUniswapV2Pair(_uniswapV2).getReserves();
        return (_reserve0 + _reserve1);
    }
}
