pragma solidity 0.4.24;

contract Caller {
    function call(address receiverAddress) public {
        bytes memory test = "0x12345678";
        receiverAddress.call(abi.encodeWithSignature("tokenFallback(address,uint256,bytes)", msg.sender, 100, test));
    }
}