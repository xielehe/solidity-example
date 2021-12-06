
// SPDX-License-Identifier: MIT
// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
pragma solidity ^0.8.7;

interface AggregatorV3Interface {
  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
}

contract PriceConsumerV3 {
    AggregatorV3Interface public priceFeed = AggregatorV3Interface(0x5741306c21795FdCBb9b265Ea0255F499DFe515C);

    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price / 1e8;
    }
}
