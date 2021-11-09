// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract VerifySignature {
// 签名
/*
 对内容进行hash
 对hash进行签名（用私钥）
*/

// 验证签名
/*
 重新对内容进行hash
 重建签名，对比解密后的地址
*/

    function getMessageHash(
        string memory _to,
        uint _amount,
        string memory _message,
        uint _nonce
    ) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }
    
    function getEthSignedMessageHash(bytes32 _messageHash) private pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }
    
    function verify( 
        string memory _to, 
        uint _amount,
        string memory _message,
        uint _nonce,
        bytes32 r, bytes32 s, uint8 v
    )
        external view returns (bool)
    {
        bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        return ecrecover(ethSignedMessageHash, v, r, s) == msg.sender;
    }
    
}

// const provider = new _ethers.providers.Web3Provider(window.ethereum)
// const signer = provider.getSigner()

// const messageHashBytes = _ethers.utils.arrayify("")
// const flatSig = await signer.signMessage(messageHashBytes) 
// _ethers.utils.splitSignature(flatSig)
