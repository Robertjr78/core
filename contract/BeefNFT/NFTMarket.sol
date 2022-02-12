// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev External interface of AccessControl declared to support ERC165 detection.
 */
interface IAccessControlUpgradeable {
    /**
     * @dev Emitted when `new admin role` is set as ``role``'s admin role, replacing `previousAdminRole`
     *
     * `DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
     * {RoleAdminChanged} not being emitted signaling this.
     *
     * _Available since v3.1._
     */
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);

    /**
     * @dev Emitted when `account` is granted `role`.
     *
     * `sender` is the account that originated the contract call, an admin role
     * bearer except when using {AccessControl-_setupRole}.
     */
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Emitted when `account` is revoked `role`.
     *
     * `sender` is the account that originated the contract call:
     *   - if using `revokeRole`, it is the admin role bearer
     *   - if using `renounceRole`, it is the role bearer (i.e. `account`)
     */
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) external view returns (bool);

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {AccessControl-_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function grantRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function revokeRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been granted `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `account`.
     */
    function renounceRole(bytes32 role, address account) external;
}


pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165Upgradeable {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


pragma solidity ^0.8.0;

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721ReceiverUpgradeable {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}


pragma solidity ^0.8.0;

/**
 * @dev String operations.
 */
library StringsUpgradeable {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}


pragma solidity ^0.8.0;

/**
 * @dev Collection of functions related to the address type
 */
library AddressUpgradeable {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verifies that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


pragma solidity ^0.8.0;

/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since a proxied contract can't have a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 *
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {ERC1967Proxy-constructor}.
 *
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 */
abstract contract Initializable {
    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier initializer() {
        require(_initializing || !_initialized, "Initializable: contract is already initialized");

        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }

        _;

        if (isTopLevelCall) {
            _initializing = false;
        }
    }
}

pragma solidity ^0.8.0;

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165Upgradeable is Initializable, IERC165Upgradeable {
    function __ERC165_init() internal initializer {
        __ERC165_init_unchained();
    }

    function __ERC165_init_unchained() internal initializer {
    }
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165Upgradeable).interfaceId;
    }
    uint256[50] private __gap;
}


pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal initializer {
        __Context_init_unchained();
    }

    function __Context_init_unchained() internal initializer {
    }
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
    uint256[50] private __gap;
}


pragma solidity ^0.8.0;

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721Upgradeable is IERC165Upgradeable {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}


pragma solidity ^0.8.0;

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721MetadataUpgradeable is IERC721Upgradeable {
    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}


pragma solidity ^0.8.0;

/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721EnumerableUpgradeable is IERC721Upgradeable {
    /**
     * @dev Returns the total amount of tokens stored by the contract.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns a token ID owned by `owner` at a given `index` of its token list.
     * Use along with {balanceOf} to enumerate all of ``owner``'s tokens.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256 tokenId);

    /**
     * @dev Returns a token ID at a given `index` of all the tokens stored by the contract.
     * Use along with {totalSupply} to enumerate all tokens.
     */
    function tokenByIndex(uint256 index) external view returns (uint256);
}


pragma solidity ^0.8.0;

/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
contract ERC721Upgradeable is Initializable, ContextUpgradeable, ERC165Upgradeable, IERC721Upgradeable, IERC721MetadataUpgradeable {
    using AddressUpgradeable for address;
    using StringsUpgradeable for uint256;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;

    // Mapping owner address to token count
    mapping(address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    function __ERC721_init(string memory name_, string memory symbol_) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name_, symbol_);
    }

    function __ERC721_init_unchained(string memory name_, string memory symbol_) internal initializer {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165Upgradeable, IERC165Upgradeable) returns (bool) {
        return
            interfaceId == type(IERC721Upgradeable).interfaceId ||
            interfaceId == type(IERC721MetadataUpgradeable).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721-balanceOf}.
     */
    function balanceOf(address owner) public view virtual override returns (uint256) {
        require(owner != address(0), "ERC721: balance query for the zero address");
        return _balances[owner];
    }

    /**
     * @dev See {IERC721-ownerOf}.
     */
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    /**
     * @dev See {IERC721Metadata-name}.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev See {IERC721Metadata-symbol}.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }

    /**
     * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
     * by default, can be overriden in child contracts.
     */
    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    /**
     * @dev See {IERC721-approve}.
     */
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ERC721Upgradeable.ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(
            _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _approve(to, tokenId);
    }

    /**
     * @dev See {IERC721-getApproved}.
     */
    function getApproved(uint256 tokenId) public view virtual override returns (address) {
        require(_exists(tokenId), "ERC721: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
    }

    /**
     * @dev See {IERC721-setApprovalForAll}.
     */
    function setApprovalForAll(address operator, bool approved) public virtual override {
        require(operator != _msgSender(), "ERC721: approve to caller");

        _operatorApprovals[_msgSender()][operator] = approved;
        emit ApprovalForAll(_msgSender(), operator, approved);
    }

    /**
     * @dev See {IERC721-isApprovedForAll}.
     */
    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    /**
     * @dev See {IERC721-transferFrom}.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");

        _transfer(from, to, tokenId);
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        safeTransferFrom(from, to, tokenId, "");
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
        _safeTransfer(from, to, tokenId, _data);
    }

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * `_data` is additional data, it has no specified format and it is sent in call to `to`.
     *
     * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
     * implement alternative mechanisms to perform token transfer, such as signature-based.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

    /**
     * @dev Returns whether `tokenId` exists.
     *
     * Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
     *
     * Tokens start existing when they are minted (`_mint`),
     * and stop existing when they are burned (`_burn`).
     */
    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }

    /**
     * @dev Returns whether `spender` is allowed to manage `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view virtual returns (bool) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        address owner = ERC721Upgradeable.ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
    }

    /**
     * @dev Safely mints `tokenId` and transfers it to `to`.
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    /**
     * @dev Same as {xref-ERC721-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
     * forwarded in {IERC721Receiver-onERC721Received} to contract recipients.
     */
    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _mint(to, tokenId);
        require(
            _checkOnERC721Received(address(0), to, tokenId, _data),
            "ERC721: transfer to non ERC721Receiver implementer"
        );
    }

    /**
     * @dev Mints `tokenId` and transfers it to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - `to` cannot be the zero address.
     *
     * Emits a {Transfer} event.
     */
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    /**
     * @dev Destroys `tokenId`.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721Upgradeable.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

        // Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }

    /**
     * @dev Transfers `tokenId` from `from` to `to`.
     *  As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     *
     * Emits a {Transfer} event.
     */
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(ERC721Upgradeable.ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    /**
     * @dev Approve `to` to operate on `tokenId`
     *
     * Emits a {Approval} event.
     */
    function _approve(address to, uint256 tokenId) internal virtual {
        _tokenApprovals[tokenId] = to;
        emit Approval(ERC721Upgradeable.ownerOf(tokenId), to, tokenId);
    }

    /**
     * @dev Internal function to invoke {IERC721Receiver-onERC721Received} on a target address.
     * The call is not executed if the target address is not a contract.
     *
     * @param from address representing the previous owner of the given token ID
     * @param to target address that will receive the tokens
     * @param tokenId uint256 ID of the token to be transferred
     * @param _data bytes optional data to send along with the call
     * @return bool whether the call correctly returned the expected magic value
     */
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) private returns (bool) {
        if (to.isContract()) {
            try IERC721ReceiverUpgradeable(to).onERC721Received(_msgSender(), from, tokenId, _data) returns (bytes4 retval) {
                return retval == IERC721ReceiverUpgradeable.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, ``from``'s `tokenId` will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}
    uint256[44] private __gap;
}


pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

pragma solidity ^0.8.0;

/**
 * @dev Contract module which allows children to implement an emergency stop
 * mechanism that can be triggered by an authorized account.
 *
 * This module is used through inheritance. It will make available the
 * modifiers `whenNotPaused` and `whenPaused`, which can be applied to
 * the functions of your contract. Note that they will not be pausable by
 * simply including this module, only once the modifiers are put in place.
 */
abstract contract Pausable is Context {
    /**
     * @dev Emitted when the pause is triggered by `account`.
     */
    event Paused(address account);

    /**
     * @dev Emitted when the pause is lifted by `account`.
     */
    event Unpaused(address account);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state.
     */
    constructor() {
        _paused = false;
    }

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function paused() public view virtual returns (bool) {
        return _paused;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    modifier whenNotPaused() {
        require(!paused(), "Pausable: paused");
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    modifier whenPaused() {
        require(paused(), "Pausable: not paused");
        _;
    }

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    function _pause() internal virtual whenNotPaused {
        _paused = true;
        emit Paused(_msgSender());
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    function _unpause() internal virtual whenPaused {
        _paused = false;
        emit Unpaused(_msgSender());
    }
}

////marketNFT.sol
pragma solidity ^0.8.4;

interface ISwapFeeRewardWithBB {
    function accrueBBFromMarket(
        address account,
        address fromToken,
        uint256 amount
    ) external;
}

interface ISmartChefMarket {
    function updateStakedTokens(address _user, uint256 amount) external;
}


//BEEF, BNB, WBNB, BUSD, USDT
contract Market is ReentrancyGuard, Ownable, Pausable {
    using SafeERC20 for IERC20;

    enum Side {
        Sell,
        Buy
    }
    enum OfferStatus {
        Open,
        Accepted,
        Cancelled
    }

    struct RoyaltyStr {
        uint32 rate;
        address receiver;
        bool enable;
    }

    uint256 constant MAX_DEFAULT_FEE = 1000; // max fee 10% (base 10000)
    uint256 public defaultFee = 100; //in base 10000 1%
    uint8 public maxUserTokenOnSellToReward = 3; //max count sell offers of nftForAccrualRB on which Rb accrual
    uint256 rewardDistributionSeller = 50; //Distribution reward between seller and buyer. Base 100
    address public treasuryAddress;
    ISwapFeeRewardWithRB feeRewardRB;
    ISmartChefMarket smartChefMarket;
    bool feeRewardRBIsEnabled = false; // Enable/disable accrue RB reward for trade NFT tokens from nftForAccrualRB list
    bool placementRewardEnabled = false; //Enable rewards for place NFT tokens on market

    Offer[] public offers;
    mapping(IERC721 => mapping(uint256 => uint256)) public tokenSellOffers; // nft => tokenId => id
    mapping(address => mapping(IERC721 => mapping(uint256 => uint256))) public userBuyOffers; // user => nft => tokenId => id
    mapping(address => bool) public nftBlacklist; //add tokens on blackList
    mapping(address => bool) public nftForAccrualRB; //add tokens on which RobiBoost is accrual
    mapping(address => bool) public dealTokensWhitelist;
    mapping(address => uint256) public userFee; //User trade fee. if Zero - fee by default
    mapping(address => uint256) public tokensCount; //User`s number of tokens on sale: user => count
    mapping(address => RoyaltyStr) public royalty; //Royalty for NFT creator. NFTToken => royalty (base 10000)

    struct Offer {
        uint256 tokenId;
        uint256 price;
        IERC20 dealToken;
        IERC721 nft;
        address user;
        address acceptUser;
        OfferStatus status;
        Side side;
    }

    event NewOffer(
        address indexed user,
        IERC721 indexed nft,
        uint256 indexed tokenId,
        address dealToken,
        uint256 price,
        Side side,
        uint256 id
    );

    event CancelOffer(uint256 indexed id);
    event AcceptOffer(uint256 indexed id, address indexed user, uint256 price);
    event NewTreasuryAddress(address _treasuryAddress);
    event NFTBlackListUpdate(address nft, bool state);
    event NFTAccrualListUpdate(address nft, bool state);
    event DealTokensWhiteListUpdate(address token, bool whiteListed);
    event NewUserFee(address user, uint256 fee);
    event SetRoyalty(
        address nftAddress,
        address royaltyReceiver,
        uint32 rate,
        bool enable
    );

    constructor(
        address _treasuryAddress,
        ISwapFeeRewardWithRB _feeRewardRB
    ) {
        //NFT-01
        require(_treasuryAddress != address(0), "Address cant be zero");
        treasuryAddress = _treasuryAddress;
        feeRewardRB = _feeRewardRB;
        feeRewardRBIsEnabled = false;
        // take id(0) as placeholder
        offers.push(
            Offer({
                tokenId: 0,
                price: 0,
                nft: IERC721(address(0)),
                dealToken: IERC20(address(0)),
                user: address(0),
                acceptUser: address(0),
                status: OfferStatus.Cancelled,
                side: Side.Buy
            })
        );
    }


    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function enableRBFeeReward() public onlyOwner {
        feeRewardRBIsEnabled = true;
    }

    function disableRBFeeReward() public onlyOwner {
        feeRewardRBIsEnabled = false;
    }

    function enablePlacementReward() public onlyOwner {
        placementRewardEnabled = true;
    }

    function disablePlacementReward() public onlyOwner {
        placementRewardEnabled = false;
    }

    function setTreasuryAddress(address _treasuryAddress) public onlyOwner {
        //NFT-01
        require(_treasuryAddress != address(0), "Address cant be zero");
        treasuryAddress = _treasuryAddress;
        emit NewTreasuryAddress(_treasuryAddress);
    }

    function setRewardDistributionSeller(uint256 _rewardDistributionSeller)
        public
        onlyOwner
    {
        require(
            _rewardDistributionSeller <= 100,
            "Incorrect value Must be equal to or greater than 100"
        );
        rewardDistributionSeller = _rewardDistributionSeller;
    }

    function setRoyalty(
        address nftAddress,
        address royaltyReceiver,
        uint32 rate,
        bool enable
    ) public onlyOwner {
        require(nftAddress != address(0), "Address cant be zero");
        require(royaltyReceiver != address(0), "Address cant be zero");
        require(rate < 10000, "Rate must be less than 10000");
        royalty[nftAddress].receiver = royaltyReceiver;
        royalty[nftAddress].rate = rate;
        royalty[nftAddress].enable = enable;
        emit SetRoyalty(nftAddress, royaltyReceiver, rate, enable);
    }

    function addBlackListNFT(address[] calldata nfts) public onlyOwner {
        for (uint256 i = 0; i < nfts.length; i++) {
            nftBlacklist[nfts[i]] = true;
            emit NFTBlackListUpdate(nfts[i], true);
        }
    }

    function delBlackListNFT(address[] calldata nfts) public onlyOwner {
        for (uint256 i = 0; i < nfts.length; i++) {
            delete nftBlacklist[nfts[i]];
            emit NFTBlackListUpdate(nfts[i], false);
        }
    }

    function addWhiteListDealTokens(address[] calldata _tokens)
        public
        onlyOwner
    {
        for (uint256 i = 0; i < _tokens.length; i++) {
            require(_tokens[i] != address(0), "Address cant be 0");
            dealTokensWhitelist[_tokens[i]] = true;
            emit DealTokensWhiteListUpdate(_tokens[i], true);
        }
    }

    function delWhiteListDealTokens(address[] calldata _tokens)
        public
        onlyOwner
    {
        for (uint256 i = 0; i < _tokens.length; i++) {
            delete dealTokensWhitelist[_tokens[i]];
            emit DealTokensWhiteListUpdate(_tokens[i], false);
        }
    }

    function addNftForAccrualRB(address _nft) public onlyOwner {
        require(_nft != address(0), "Address cant be zero");
        nftForAccrualRB[_nft] = true;
        emit NFTAccrualListUpdate(_nft, true);
    }

    function delNftForAccrualRB(address _nft) public onlyOwner {
        require(_nft != address(0), "Address cant be zero");
        delete nftForAccrualRB[_nft];
        emit NFTAccrualListUpdate(_nft, false);
    }

    function setUserFee(address user, uint256 fee) public onlyOwner {
        userFee[user] = fee;
        emit NewUserFee(user, fee);
    }

    function setDefaultFee(uint256 _newFee) public onlyOwner {
        require(
            _newFee <= MAX_DEFAULT_FEE,
            "New fee must be less than or equal to max fee"
        );
        defaultFee = _newFee;
    }

    function SetMaxUserTokenOnSellToReward(uint8 newCount) public onlyOwner {
        maxUserTokenOnSellToReward = newCount;
    }

    function setSmartChefMarket(ISmartChefMarket _smartChefMarket)
        public
        onlyOwner
    {
        require(address(_smartChefMarket) != address(0), "Address cant be 0");
        smartChefMarket = _smartChefMarket;
    }

    function setFeeRewardRB(ISwapFeeRewardWithRB _feeRewardRB)
        public
        onlyOwner
    {
        require(address(_feeRewardRB) != address(0), "Address cant be 0");
        feeRewardRB = _feeRewardRB;
    }

    // user functions

    function offer(
        Side side,
        address dealToken,
        IERC721 nft,
        uint256 tokenId,
        uint256 price
    )
        public
        nonReentrant
        whenNotPaused
        _nftAllowed(nft)
        _validDealToken(dealToken)
        notContract
    {
        if (side == Side.Buy) {
            _offerBuy(nft, tokenId, price, dealToken);
        } else if (side == Side.Sell) {
            _offerSell(nft, tokenId, price, dealToken);
        } else {
            revert("Not supported");
        }
    }

    function accept(uint256 id)
        public
        nonReentrant
        _offerExists(id)
        _offerOpen(id)
        _notBlackListed(id)
        whenNotPaused
        notContract
    {
        if (offers[id].side == Side.Buy) {
            _acceptBuy(id);
        } else {
            _acceptSell(id);
        }
    }

    function cancel(uint256 id)
        public
        nonReentrant
        _offerExists(id)
        _offerOpen(id)
        _offerOwner(id)
        whenNotPaused
    {
        if (offers[id].side == Side.Buy) {
            _cancelBuy(id);
        } else {
            _cancelSell(id);
        }
    }

    function multiCancel(uint256[] calldata ids) public notContract {
        for (uint256 i = 0; i < ids.length; i++) {
            cancel(ids[i]);
        }
    }

    //increase: true - increase token to accrue rewards; false - decrease token from
    function placementRewardQualifier(
        bool increase,
        address user,
        address nftToken
    ) internal {
        //Check if nft token in nftForAccrualRB list and accrue reward enable
        if (!nftForAccrualRB[nftToken] || !placementRewardEnabled) return;

        if (increase) {
            tokensCount[user]++;
        } else {
            tokensCount[user] = tokensCount[user] > 0
                ? tokensCount[user] - 1
                : 0;
        }
        if (tokensCount[user] > maxUserTokenOnSellToReward) return;

        uint256 stakedAmount = tokensCount[user] >= maxUserTokenOnSellToReward
            ? maxUserTokenOnSellToReward
            : tokensCount[user];
        smartChefMarket.updateStakedTokens(user, stakedAmount);
    }

    function _offerSell(
        IERC721 nft,
        uint256 tokenId,
        uint256 price,
        address dealToken
    ) internal {
        require(msg.value == 0, "Seller should not pay");
        require(price > 0, "price > 0");
        offers.push(
            Offer({
                tokenId: tokenId,
                price: price,
                dealToken: IERC20(dealToken),
                nft: nft,
                user: msg.sender,
                acceptUser: address(0),
                status: OfferStatus.Open,
                side: Side.Sell
            })
        );

        uint256 id = offers.length - 1;
        emit NewOffer(
            msg.sender,
            nft,
            tokenId,
            dealToken,
            price,
            Side.Sell,
            id
        );

        require(getTokenOwner(id) == msg.sender, "sender should own the token");
        require(isTokenApproved(id, msg.sender), "token is not approved");

        if (tokenSellOffers[nft][tokenId] > 0) {
            _closeSellOfferFor(nft, tokenId);
        } else {
            placementRewardQualifier(true, msg.sender, address(nft));
        }
        tokenSellOffers[nft][tokenId] = id;
    }

    function _offerBuy(
        IERC721 nft,
        uint256 tokenId,
        uint256 price,
        address dealToken
    ) internal {
        IERC20(dealToken).safeTransferFrom(msg.sender, address(this), price);
        require(price > 0, "buyer should pay");
        offers.push(
            Offer({
                tokenId: tokenId,
                price: price,
                dealToken: IERC20(dealToken),
                nft: nft,
                user: msg.sender,
                acceptUser: address(0),
                status: OfferStatus.Open,
                side: Side.Buy
            })
        );
        uint256 id = offers.length - 1;
        emit NewOffer(msg.sender, nft, tokenId, dealToken, price, Side.Buy, id);
        _closeUserBuyOffer(userBuyOffers[msg.sender][nft][tokenId]);
        userBuyOffers[msg.sender][nft][tokenId] = id;
    }

    function _acceptBuy(uint256 id) internal {
        // caller is seller
        Offer storage _offer = offers[id];
        require(msg.value == 0, "seller should not pay");

        require(getTokenOwner(id) == msg.sender, "only owner can call");
        require(isTokenApproved(id, msg.sender), "token is not approved");
        _offer.status = OfferStatus.Accepted;
        _offer.acceptUser = msg.sender;

        _offer.nft.safeTransferFrom(msg.sender, _offer.user, _offer.tokenId);
        _distributePayment(_offer);

        emit AcceptOffer(id, msg.sender, _offer.price);
        _unlinkBuyOffer(_offer);
        if (tokenSellOffers[_offer.nft][_offer.tokenId] > 0) {
            _closeSellOfferFor(_offer.nft, _offer.tokenId);
            //NFT-03
            placementRewardQualifier(false, msg.sender, address(_offer.nft));
        }
    }

    function _acceptSell(uint256 id) internal {
        // caller is buyer
        Offer storage _offer = offers[id];

        if (
            getTokenOwner(id) != _offer.user ||
            isTokenApproved(id, _offer.user) == false
        ) {
            _cancelSell(id);
            return;
        }

        _offer.status = OfferStatus.Accepted;
        _offer.acceptUser = msg.sender;
        _unlinkSellOffer(_offer);

        _offer.dealToken.safeTransferFrom(msg.sender, address(this), _offer.price);
        _distributePayment(_offer);
        _offer.nft.safeTransferFrom(_offer.user, msg.sender, _offer.tokenId);
        emit AcceptOffer(id, msg.sender, _offer.price);
    }

    function _cancelSell(uint256 id) internal {
        Offer storage _offer = offers[id];
        require(_offer.status == OfferStatus.Open, "Offer was cancelled");
        _offer.status = OfferStatus.Cancelled;
        emit CancelOffer(id);
        _unlinkSellOffer(_offer);
    }

    function _cancelBuy(uint256 id) internal {
        Offer storage _offer = offers[id];
        require(_offer.status == OfferStatus.Open, "Offer was cancelled");
        _offer.status = OfferStatus.Cancelled;
        _transfer(msg.sender, _offer.price, _offer.dealToken);
        emit CancelOffer(id);
        _unlinkBuyOffer(_offer);
    }

    // modifiers
    modifier _validDealToken(address _token) {
        require(dealTokensWhitelist[_token], "Deal token not available");
        _;
    }
    modifier _offerExists(uint256 id) {
        require(id > 0 && id < offers.length, "offer does not exist");
        _;
    }

    modifier _offerOpen(uint256 id) {
        require(offers[id].status == OfferStatus.Open, "offer should be open");
        _;
    }

    modifier _offerOwner(uint256 id) {
        require(offers[id].user == msg.sender, "call should own the offer");
        _;
    }

    modifier _notBlackListed(uint256 id) {
        Offer storage _offer = offers[id];
        require(!nftBlacklist[address(_offer.nft)], "NFT in black list");
        _;
    }

    modifier _nftAllowed(IERC721 nft) {
        require(!nftBlacklist[address(nft)], "NFT in black list");
        _;
    }

    modifier notContract() {
        require(!_isContract(msg.sender), "Contract not allowed");
        require(msg.sender == tx.origin, "Proxy contract not allowed");
        _;
    }

    // internal functions
    function _transfer(
        address to,
        uint256 amount,
        IERC20 _dealToken
    ) internal {
        require(amount > 0 && to != address(0), "Wrong amount or dest on transfer");
        _dealToken.safeTransfer(to, amount);
    }

    function _distributePayment(Offer memory _offer) internal {
        (address seller, address buyer) = _offer.side == Side.Sell
            ? (_offer.user, _offer.acceptUser)
            : (_offer.acceptUser, _offer.user);
        uint256 feeRate = userFee[seller] == 0 ? defaultFee : userFee[seller];
        uint256 fee = (_offer.price * feeRate) / 10000;
        uint256 royaltyFee = 0;
        if (royalty[address(_offer.nft)].enable) {
            royaltyFee =
                (_offer.price * royalty[address(_offer.nft)].rate) /
                10000;
            _transfer(
                royalty[address(_offer.nft)].receiver,
                royaltyFee,
                _offer.dealToken
            );
        }
        _transfer(treasuryAddress, fee, _offer.dealToken);
        _transfer(seller, _offer.price - fee - royaltyFee, _offer.dealToken);
        if (feeRewardRBIsEnabled && nftForAccrualRB[address(_offer.nft)]) {
            feeRewardRB.accrueRBFromMarket(
                seller,
                address(_offer.dealToken),
                (fee * rewardDistributionSeller) / 100
            );
            feeRewardRB.accrueRBFromMarket(
                buyer,
                address(_offer.dealToken),
                (fee * (100 - rewardDistributionSeller)) / 100
            );
        }
    }

    function _closeSellOfferFor(IERC721 nft, uint256 tokenId) internal {
        uint256 id = tokenSellOffers[nft][tokenId];
        if (id == 0) return;

        // closes old open sell offer
        Offer storage _offer = offers[id];
        _offer.status = OfferStatus.Cancelled;
        tokenSellOffers[_offer.nft][_offer.tokenId] = 0;
        emit CancelOffer(id);
    }

    function _closeUserBuyOffer(uint256 id) internal {
        Offer storage _offer = offers[id];
        if (
            id > 0 &&
            _offer.status == OfferStatus.Open &&
            _offer.side == Side.Buy
        ) {
            _offer.status = OfferStatus.Cancelled;
            _transfer(_offer.user, _offer.price, _offer.dealToken);
            _unlinkBuyOffer(_offer);
            emit CancelOffer(id);
        }
    }

    function _unlinkBuyOffer(Offer storage o) internal {
        userBuyOffers[o.user][o.nft][o.tokenId] = 0;
    }

    function _unlinkSellOffer(Offer storage o) internal {
        placementRewardQualifier(false, o.user, address(o.nft));
        tokenSellOffers[o.nft][o.tokenId] = 0;
    }

    // helpers

    function isValidSell(uint256 id) public view returns (bool) {
        if (id >= offers.length) {
            return false;
        }

        Offer storage _offer = offers[id];
        // try to not throw exception
        return
            _offer.status == OfferStatus.Open &&
            _offer.side == Side.Sell &&
            isTokenApproved(id, _offer.user) &&
            (_offer.nft.ownerOf(_offer.tokenId) == _offer.user);
    }

    function isTokenApproved(uint256 id, address owner)
        public
        view
        returns (bool)
    {
        Offer storage _offer = offers[id];
        return
            _offer.nft.getApproved(_offer.tokenId) == address(this) ||
            _offer.nft.isApprovedForAll(owner, address(this));
    }

    function getTokenOwner(uint256 id) public view returns (address) {
        Offer storage _offer = offers[id];
        return _offer.nft.ownerOf(_offer.tokenId);
    }

    function _isContract(address _addr) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(_addr)
        }
        return size > 0;
    }
}
