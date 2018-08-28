pragma solidity 0.4.24;

contract Caller {
    function call(address receiverAddress) public {
        bytes memory test = hex"12345678";

        // NOTE: Fixed in Solidity 0.5
        // This syntax will corrupt the parameters of the function when doing the call and will no longer be allowed in Solidity 0.5:
        //
        // receiverAddress.call(abi.encodeWithSignature("tokenFallback(address,uint256,bytes)"), msg.sender, 100, test);
        //
        // While this one works fine.
        receiverAddress.call(abi.encodeWithSignature("tokenFallback(address,uint256,bytes)", msg.sender, 100, test));
    }
}
