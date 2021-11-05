// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
/*
keccak256(密码学 hash 函数)
 - 输入参数可以是任意大小，输出大小总是固定的
 - 确定性的(hash(x) = h, every time)
 - 计算时间很快
 - 不可逆的
 - 输入参数很小的改动, 输出结果会有很大不同
 - 不容易碰撞（很难找到 hash(x) = hash(y)） 
*/
contract HashFunction {
    function hash(string memory _text) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text));
    }

}


contract GuessTheMagicWord {
    bytes32 public answer =
        0xec97de38549d60252b6c19963a6dc99bab112ccd988434b56522752dbcb6d3f5;
    // answer is Bitcoin
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}
