// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {
    AdvancedOrder,
    CriteriaResolver
} from "seaport-types/src/lib/ConsiderationStructs.sol";

import { OrderHelperRequest, OrderHelperResponse } from "./OrderHelperLib.sol";

interface SeaportOrderHelperInterface {
    function prepare(
        OrderHelperRequest memory request
    ) external view returns (OrderHelperResponse memory);

    /**
     * @notice Generate a criteria merkle root from an array of `tokenIds`. Use
     *         this helper to construct an order item's `identifierOrCriteria`.
     *
     * @param tokenIds An array of integer token IDs to be converted to a merkle
     *                 root.
     *
     * @return The bytes32 merkle root of a criteria tree containing the given
     *         token IDs.
     */
    function criteriaRoot(
        uint256[] memory tokenIds
    ) external pure returns (bytes32);

    /**
     * @notice Generate a criteria merkle proof that `id` is a member of
     *        `tokenIds`. Reverts if `id` is not a member of `tokenIds`. Use
     *         this helper to construct proof data for criteria resolvers.
     *
     * @param tokenIds An array of integer token IDs.
     * @param id       The integer token ID to generate a proof for.
     *
     * @return Merkle proof that the given token ID is  amember of the criteria
     *         tree containing the given token IDs.
     */
    function criteriaProof(
        uint256[] memory tokenIds,
        uint256 id
    ) external pure returns (bytes32[] memory);
}
