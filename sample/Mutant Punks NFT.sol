
 Submitted for verification at Etherscan.io on 2021-10-14


 SPDX-License-Identifier GPL-3.0

 File @openzeppelincontractsutilsintrospectionIERC165.sol
pragma solidity ^0.8.0;


 
interface IERC165 {
    
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

 File @openzeppelincontractstokenERC721IERC721.sol
pragma solidity ^0.8.0;


 
interface IERC721 is IERC165 {
    
      @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    
      @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );

    
      @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    
      @dev Returns the number of tokens in ``owner``'s account.
     
    function balanceOf(address owner) external view returns (uint256 balance);

    
      @dev Returns the owner of the `tokenId` token.
     
      Requirements
     
      - `tokenId` must exist.
     
    function ownerOf(uint256 tokenId) external view returns (address owner);

    
     
     
      
     
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    
      @dev Transfers `tokenId` token from `from` to `to`.
     
      WARNING Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     
      Requirements
     
      - `from` cannot be the zero address.
      - `to` cannot be the zero address.
      - `tokenId` token must be owned by `from`.
      - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     
      Emits a {Transfer} event.
     
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    
      @dev Gives permission to `to` to transfer `tokenId` token to another account.
      The approval is cleared when the token is transferred.
     
      Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     
      Requirements
     
      - The caller must own the token or be an approved operator.
      - `tokenId` must exist.
     
      Emits an {Approval} event.
     
    function approve(address to, uint256 tokenId) external;

    
      @dev Returns the account approved for `tokenId` token.
     
      Requirements
     
      - `tokenId` must exist.
     
    function getApproved(uint256 tokenId)
        external
        view
        returns (address operator);

    
      @dev Approve or remove `operator` as an operator for the caller.
      Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     
      Requirements
     
      - The `operator` cannot be the caller.
     
      Emits an {ApprovalForAll} event.
     
    function setApprovalForAll(address operator, bool _approved) external;

    
      @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     
      See {setApprovalForAll}
     
    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    
      
     
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

 File @openzeppelincontractstokenERC721extensionsIERC721Enumerable.sol
pragma solidity ^0.8.0;


  @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
  @dev See httpseips.ethereum.orgEIPSeip-721
 
interface IERC721Enumerable is IERC721 {
    
     
     
    function totalSupply() external view returns (uint256);

    
      @dev Returns a token ID owned by `owner` at a given `index` of its token list.
      Use along with {balanceOf} to enumerate all of ``owner``'s tokens.
     
    function tokenOfOwnerByIndex(address owner, uint256 index)
        external
        view
        returns (uint256 tokenId);

    
      @dev Returns a token ID at a given `index` of all the tokens stored by the contract.
      Use along with {totalSupply} to enumerate all tokens.
     
    function tokenByIndex(uint256 index) external view returns (uint256);
}

 File @openzeppelincontractsutilsintrospectionERC165.sol
pragma solidity ^0.8.0;


 
  ```solidity
  function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
      return interfaceId == type(MyInterface).interfaceId  super.supportsInterface(interfaceId);
  }
  ```
 
  Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 
abstract contract ERC165 is IERC165 {
    
      @dev See {IERC165-supportsInterface}.
     
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return interfaceId == type(IERC165).interfaceId;
    }
}

 File @openzeppelincontractsutilsStrings.sol

pragma solidity ^0.8.0;


  @dev String operations.
 
library Strings {
    bytes16 private constant _HEX_SYMBOLS = 0123456789abcdef;

    
      @dev Converts a `uint256` to its ASCII `string` decimal representation.
     
    function toString(uint256 value) internal pure returns (string memory) {
         Inspired by OraclizeAPI's implementation - MIT licence
         httpsgithub.comoraclizeethereum-apiblobb42146b063c7d6ee1358846c198246239e9360e8oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return 0;
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp = 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value = 10;
        }
        return string(buffer);
    }

    
      @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return 0x00;
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp = 8;
        }
        return toHexString(value, length);
    }

    
      @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     
    function toHexString(uint256 value, uint256 length)
        internal
        pure
        returns (string memory)
    {
        bytes memory buffer = new bytes(2  length + 2);
        buffer[0] = 0;
        buffer[1] = x;
        for (uint256 i = 2  length + 1; i  1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value = 4;
        }
        require(value == 0, Strings hex length insufficient);
        return string(buffer);
    }
}

 File @openzeppelincontractsutilsAddress.sol

pragma solidity ^0.8.0;


  @dev Collection of functions related to the address type
 
library Address {
    
      
     
     
     
    function isContract(address account) internal view returns (bool) {
         This method relies on extcodesize, which returns 0 for contracts in
         construction, since the code is only stored at the end of the
         constructor execution.

        uint256 size;
        assembly {
            size = extcodesize(account)
        }
        return size  0;
    }

    
      @dev Replacement for Solidity's `transfer` sends `amount` wei to
      `recipient`, forwarding all available gas and reverting on errors.
     
      httpseips.ethereum.orgEIPSeip-1884[EIP1884] increases the gas cost
      of certain opcodes, possibly making contracts go over the 2300 gas limit
      imposed by `transfer`, making them unable to receive funds via
      `transfer`. {sendValue} removes this limitation.
     
      httpsdiligence.consensys.netposts201909stop-using-soliditys-transfer-now[Learn more].
     
      IMPORTANT because control is transferred to `recipient`, care must be
      taken to not create reentrancy vulnerabilities. Consider using
      {ReentrancyGuard} or the
      httpssolidity.readthedocs.ioenv0.5.11security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance = amount,
            Address insufficient balance
        );

        (bool success, ) = recipient.call{value amount}();
        require(
            success,
            Address unable to send value, recipient may have reverted
        );
    }

    
     
     
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, Address low-level call failed);
    }

    
      @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
      `errorMessage` as a fallback revert reason when `target` reverts.
     
      _Available since v3.1._
     
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    
      
     
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                Address low-level call with value failed
            );
    }

    
      @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
      with `errorMessage` as a fallback revert reason when `target` reverts.
     
      _Available since v3.1._
     
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance = value,
            Address insufficient balance for call
        );
        require(isContract(target), Address call to non-contract);

        (bool success, bytes memory returndata) = target.call{value value}(
            data
        );
        return verifyCallResult(success, returndata, errorMessage);
    }

    
      @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
      but performing a static call.
     
      _Available since v3.3._
     
    function functionStaticCall(address target, bytes memory data)
        internal
        view
        returns (bytes memory)
    {
        return
            functionStaticCall(
                target,
                data,
                Address low-level static call failed
            );
    }

    
      @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
      but performing a static call.
     
      _Available since v3.3._
     
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), Address static call to non-contract);

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    
      @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
      but performing a delegate call.
     
      _Available since v3.4._
     
    function functionDelegateCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return
            functionDelegateCall(
                target,
                data,
                Address low-level delegate call failed
            );
    }

    
      @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
      but performing a delegate call.
     
      _Available since v3.4._
     
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), Address delegate call to non-contract);

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    
      @dev Tool to verifies that a low level call was successful, and revert if it wasn't, either by bubbling the
      revert reason using the provided one.
     
      _Available since v4.3._
     
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
             Look for revert reason and bubble it up if present
            if (returndata.length  0) {
                 The easiest way to bubble the revert reason is using memory via assembly

                assembly {
                    let returndata_size = mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

 File @openzeppelincontractstokenERC721extensionsIERC721Metadata.sol

pragma solidity ^0.8.0;


  @title ERC-721 Non-Fungible Token Standard, optional metadata extension
  @dev See httpseips.ethereum.orgEIPSeip-721
 
interface IERC721Metadata is IERC721 {
    
      @dev Returns the token collection name.
     
    function name() external view returns (string memory);

    
      @dev Returns the token collection symbol.
     
    function symbol() external view returns (string memory);

    
      @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     
    function tokenURI(uint256 tokenId) external view returns (string memory);
}

 File @openzeppelincontractstokenERC721IERC721Receiver.sol

pragma solidity ^0.8.0;


 
interface IERC721Receiver {
    
    
     
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

 File @openzeppelincontractsutilsContext.sol
pragma solidity ^0.8.0;
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

 File @openzeppelincontractstokenERC721ERC721.sol
pragma solidity ^0.8.0;


  @dev Implementation of httpseips.ethereum.orgEIPSeip-721[ERC721] Non-Fungible Token Standard, including
  the Metadata extension, but not including the Enumerable extension, which is available separately as
  {ERC721Enumerable}.
 
contract ERC721 is Context, ERC165, IERC721, IERC721Metadata {
    using Address for address;
    using Strings for uint256;

     Token name
    string private _name;

     Token symbol
    string private _symbol;

     Mapping from token ID to owner address
    mapping(uint256 = address) private _owners;

     Mapping owner address to token count
    mapping(address = uint256) private _balances;

     Mapping from token ID to approved address
    mapping(uint256 = address) private _tokenApprovals;

     Mapping from owner to operator approvals
    mapping(address = mapping(address = bool)) private _operatorApprovals;

    
    
     
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    
      @dev See {IERC165-supportsInterface}.
     
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC165, IERC165)
        returns (bool)
    {
        return
            interfaceId == type(IERC721).interfaceId 
            interfaceId == type(IERC721Metadata).interfaceId 
            super.supportsInterface(interfaceId);
    }

    
      @dev See {IERC721-balanceOf}.
     
    function balanceOf(address owner)
        public
        view
        virtual
        override
        returns (uint256)
    {
        require(
            owner != address(0),
            ERC721 balance query for the zero address
        );
        return _balances[owner];
    }

    
      @dev See {IERC721-ownerOf}.
     
    function ownerOf(uint256 tokenId)
        public
        view
        virtual
        override
        returns (address)
    {
        address owner = _owners[tokenId];
        require(
            owner != address(0),
            ERC721 owner query for nonexistent token
        );
        return owner;
    }

    
      @dev See {IERC721Metadata-name}.
     
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    
      @dev See {IERC721Metadata-symbol}.
     
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    
      @dev See {IERC721Metadata-tokenURI}.
     
    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            ERC721Metadata URI query for nonexistent token
        );

        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length  0
                 string(abi.encodePacked(baseURI, tokenId.toString()))
                 ;
    }

    
      @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
      token will be the concatenation of the `baseURI` and the `tokenId`. Empty
      by default, can be overriden in child contracts.
     
    function _baseURI() internal view virtual returns (string memory) {
        return ;
    }

    
      @dev See {IERC721-approve}.
     
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ERC721.ownerOf(tokenId);
        require(to != owner, ERC721 approval to current owner);

        require(
            _msgSender() == owner  isApprovedForAll(owner, _msgSender()),
            ERC721 approve caller is not owner nor approved for all
        );

        _approve(to, tokenId);
    }

    
      @dev See {IERC721-getApproved}.
     
    function getApproved(uint256 tokenId)
        public
        view
        virtual
        override
        returns (address)
    {
        require(
            _exists(tokenId),
            ERC721 approved query for nonexistent token
        );

        return _tokenApprovals[tokenId];
    }

    
      @dev See {IERC721-setApprovalForAll}.
     
    function setApprovalForAll(address operator, bool approved)
        public
        virtual
        override
    {
        require(operator != _msgSender(), ERC721 approve to caller);

        _operatorApprovals[_msgSender()][operator] = approved;
        emit ApprovalForAll(_msgSender(), operator, approved);
    }

    
      @dev See {IERC721-isApprovedForAll}.
     
    function isApprovedForAll(address owner, address operator)
        public
        view
        virtual
        override
        returns (bool)
    {
        return _operatorApprovals[owner][operator];
    }

    
      @dev See {IERC721-transferFrom}.
     
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        solhint-disable-next-line max-line-length
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            ERC721 transfer caller is not owner nor approved
        );

        _transfer(from, to, tokenId);
    }

    
      @dev See {IERC721-safeTransferFrom}.
     
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        safeTransferFrom(from, to, tokenId, );
    }

    
      @dev See {IERC721-safeTransferFrom}.
     
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            ERC721 transfer caller is not owner nor approved
        );
        _safeTransfer(from, to, tokenId, _data);
    }

    
      
     
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _transfer(from, to, tokenId);
        require(
            _checkOnERC721Received(from, to, tokenId, _data),
            ERC721 transfer to non ERC721Receiver implementer
        );
    }

    
      @dev Returns whether `tokenId` exists.
     
      Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
     
      Tokens start existing when they are minted (`_mint`),
      and stop existing when they are burned (`_burn`).
     
    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }

    
      @dev Returns whether `spender` is allowed to manage `tokenId`.
     
      Requirements
     
      - `tokenId` must exist.
     
    function _isApprovedOrOwner(address spender, uint256 tokenId)
        internal
        view
        virtual
        returns (bool)
    {
        require(
            _exists(tokenId),
            ERC721 operator query for nonexistent token
        );
        address owner = ERC721.ownerOf(tokenId);
        return (spender == owner 
            getApproved(tokenId) == spender 
            isApprovedForAll(owner, spender));
    }

    
    
     
    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, );
    }

    
    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _mint(to, tokenId);
        require(
            _checkOnERC721Received(address(0), to, tokenId, _data),
            ERC721 transfer to non ERC721Receiver implementer
        );
    }

    
      @dev Mints `tokenId` and transfers it to `to`.
     
      WARNING Usage of this method is discouraged, use {_safeMint} whenever possible
     
      Requirements
     
      - `tokenId` must not exist.
      - `to` cannot be the zero address.
     
      Emits a {Transfer} event.
     
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), ERC721 mint to the zero address);
        require(!_exists(tokenId), ERC721 token already minted);

        _beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    
      @dev Destroys `tokenId`.
      The approval is cleared when the token is burned.
     
      Requirements
     
      - `tokenId` must exist.
     
      Emits a {Transfer} event.
     
    function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

         Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }

    
      @dev Transfers `tokenId` from `from` to `to`.
       As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
     
      Requirements
     
      - `to` cannot be the zero address.
      - `tokenId` token must be owned by `from`.
     
      Emits a {Transfer} event.
     
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(
            ERC721.ownerOf(tokenId) == from,
            ERC721 transfer of token that is not own
        );
        require(to != address(0), ERC721 transfer to the zero address);

        _beforeTokenTransfer(from, to, tokenId);

         Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    
      @dev Approve `to` to operate on `tokenId`
     
      Emits a {Approval} event.
     
    function _approve(address to, uint256 tokenId) internal virtual {
        _tokenApprovals[tokenId] = to;
        emit Approval(ERC721.ownerOf(tokenId), to, tokenId);
    }

   
     
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) private returns (bool) {
        if (to.isContract()) {
            try
                IERC721Receiver(to).onERC721Received(
                    _msgSender(),
                    from,
                    tokenId,
                    _data
                )
            returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert(
                        ERC721 transfer to non ERC721Receiver implementer
                    );
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

    
      @dev Hook that is called before any token transfer. This includes minting
      and burning.
     
      Calling conditions
     
      - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
      transferred to `to`.
      - When `from` is zero, `tokenId` will be minted for `to`.
      - When `to` is zero, ``from``'s `tokenId` will be burned.
      - `from` and `to` are never both zero.
     
      To learn more about hooks, head to xrefROOTextending-contracts.adoc#using-hooks[Using Hooks].
     
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}
}

 File @openzeppelincontractstokenERC721extensionsERC721Enumerable.sol

pragma solidity ^0.8.0;


 
abstract contract ERC721Enumerable is ERC721, IERC721Enumerable {
     Mapping from owner to list of owned token IDs
    mapping(address = mapping(uint256 = uint256)) private _ownedTokens;

     Mapping from token ID to index of the owner tokens list
    mapping(uint256 = uint256) private _ownedTokensIndex;

     Array with all token ids, used for enumeration
    uint256[] private _allTokens;

     Mapping from token id to position in the allTokens array
    mapping(uint256 = uint256) private _allTokensIndex;

    
      @dev See {IERC165-supportsInterface}.
     
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(IERC165, ERC721)
        returns (bool)
    {
        return
            interfaceId == type(IERC721Enumerable).interfaceId 
            super.supportsInterface(interfaceId);
    }

    
      @dev See {IERC721Enumerable-tokenOfOwnerByIndex}.
     
    function tokenOfOwnerByIndex(address owner, uint256 index)
        public
        view
        virtual
        override
        returns (uint256)
    {
        require(
            index  ERC721.balanceOf(owner),
            ERC721Enumerable owner index out of bounds
        );
        return _ownedTokens[owner][index];
    }

    
      @dev See {IERC721Enumerable-totalSupply}.
     
    function totalSupply() public view virtual override returns (uint256) {
        return _allTokens.length;
    }

    
      @dev See {IERC721Enumerable-tokenByIndex}.
     
    function tokenByIndex(uint256 index)
        public
        view
        virtual
        override
        returns (uint256)
    {
        require(
            index  ERC721Enumerable.totalSupply(),
            ERC721Enumerable global index out of bounds
        );
        return _allTokens[index];
    }

    
      @dev Hook that is called before any token transfer. This includes minting
      and burning.
     
      Calling conditions
     
      - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
      transferred to `to`.
      - When `from` is zero, `tokenId` will be minted for `to`.
      - When `to` is zero, ``from``'s `tokenId` will be burned.
      - `from` cannot be the zero address.
      - `to` cannot be the zero address.
     
      To learn more about hooks, head to xrefROOTextending-contracts.adoc#using-hooks[Using Hooks].
     
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        if (from == address(0)) {
            _addTokenToAllTokensEnumeration(tokenId);
        } else if (from != to) {
            _removeTokenFromOwnerEnumeration(from, tokenId);
        }
        if (to == address(0)) {
            _removeTokenFromAllTokensEnumeration(tokenId);
        } else if (to != from) {
            _addTokenToOwnerEnumeration(to, tokenId);
        }
    }

    
      @dev Private function to add a token to this extension's ownership-tracking data structures.
      @param to address representing the new owner of the given token ID
      @param tokenId uint256 ID of the token to be added to the tokens list of the given address
     
    function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private {
        uint256 length = ERC721.balanceOf(to);
        _ownedTokens[to][length] = tokenId;
        _ownedTokensIndex[tokenId] = length;
    }

    
      @dev Private function to add a token to this extension's token tracking data structures.
      @param tokenId uint256 ID of the token to be added to the tokens list
     
    function _addTokenToAllTokensEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    
      @dev Private function to remove a token from this extension's ownership-tracking data structures. Note that
      while the token is not assigned a new owner, the `_ownedTokensIndex` mapping is _not_ updated this allows for
      gas optimizations e.g. when performing a transfer operation (avoiding double writes).
      This has O(1) time complexity, but alters the order of the _ownedTokens array.
      @param from address representing the previous owner of the given token ID
      @param tokenId uint256 ID of the token to be removed from the tokens list of the given address
     
    function _removeTokenFromOwnerEnumeration(address from, uint256 tokenId)
        private
    {
         To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
         then delete the last slot (swap and pop).

        uint256 lastTokenIndex = ERC721.balanceOf(from) - 1;
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

         When the token to delete is the last token, the swap operation is unnecessary
        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

            _ownedTokens[from][tokenIndex] = lastTokenId;  Move the last token to the slot of the to-delete token
            _ownedTokensIndex[lastTokenId] = tokenIndex;  Update the moved token's index
        }

         This also deletes the contents at the last position of the array
        delete _ownedTokensIndex[tokenId];
        delete _ownedTokens[from][lastTokenIndex];
    }

    
      @dev Private function to remove a token from this extension's token tracking data structures.
      This has O(1) time complexity, but alters the order of the _allTokens array.
      @param tokenId uint256 ID of the token to be removed from the tokens list
     
    function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private {
         To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
         then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length - 1;
        uint256 tokenIndex = _allTokensIndex[tokenId];

         When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
         rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
         an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId;  Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex;  Update the moved token's index

         This also deletes the contents at the last position of the array
        delete _allTokensIndex[tokenId];
        _allTokens.pop();
    }
}

 File @openzeppelincontractsaccessOwnable.sol
pragma solidity ^0.8.0;


 
 
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    
    constructor() {
        _setOwner(_msgSender());
    }

    
      @dev Returns the address of the current owner.
     
    function owner() public view virtual returns (address) {
        return _owner;
    }

    
      @dev Throws if called by any account other than the owner.
     
    modifier onlyOwner() {
        require(owner() == _msgSender(), Ownable caller is not the owner);
        _;
    }

    
     
    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    
   
     
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            Ownable new owner is the zero address
        );
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

pragma solidity ^0.8.0;

contract MutantPunksNFT is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public baseExtension = .json;
    address private signerAddress;
    uint256 public cost = .0 ether;
    uint256 public maxSupply = 10000;
    uint256 public maxAmountPerMint = 2;
    uint256 public maxMintPerAddress = 2;
    bool public publicEnabled = false;
    bool public presaleEnabled = false;
    mapping(address = bool) public whitelisted;
    mapping(address = uint256) public addressMintCount;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _initBaseURI,
        address _initSignerAddress
    ) ERC721(_name, _symbol) {
        setBaseURI(_initBaseURI);
        signerAddress = _initSignerAddress;
        publicMint(msg.sender, 42);
    }

     internal
    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    modifier mintConditionsMet(address _to, uint256 _mintAmount) {
        uint256 supply = totalSupply();
        require(_mintAmount  0, mint amount must be greater than 0);
        require(supply + _mintAmount = maxSupply, mint amount cannot exceed max supply);

        if (msg.sender != owner()) {
            require(_mintAmount = maxAmountPerMint, mint amount cannot exceed max amount per mint);
            require((addressMintCount[_to] + _mintAmount) = maxMintPerAddress, cannot exceed max mint per wallet address);
            if (whitelisted[msg.sender] != true) {
                require(msg.value = cost  _mintAmount, ether value must be greater or equal cost to mint);
            }
        }
        _;
    }

     public sale
    function publicMint(address _to, uint256 _mintAmount) public payable mintConditionsMet(_to, _mintAmount)
    {
        uint256 supply = totalSupply();
        require(publicEnabled  msg.sender == owner(), public sale is not enabled);
        for (uint256 i = 1; i = _mintAmount; i++) {
            _safeMint(_to, supply + i);
            addressMintCount[_to] = (addressMintCount[_to] + _mintAmount);
        }
    }

     pre-sale
    function presaleMint(address _to, uint256 _mintAmount, bytes memory sig) public payable mintConditionsMet(_to, _mintAmount) {
        uint256 supply = totalSupply();
        require(presaleEnabled, pre-sale is not enabled);
        require(isValidSignedData(sig), wallet was not signed by the official whitelisting signer);
        for (uint256 i = 1; i = _mintAmount; i++) {
            _safeMint(_to, supply + i);
            addressMintCount[_to] = (addressMintCount[_to] + _mintAmount);
        }
    }

     public methods
    function walletOfOwner(address _owner) public view returns (uint256[] memory) {
        uint256 ownerTokenCount = balanceOf(_owner);
        uint256[] memory tokenIds = new uint256[](ownerTokenCount);
        for (uint256 i; i  ownerTokenCount; i++) {
            tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return tokenIds;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(
            _exists(tokenId),
            ERC721Metadata URI query for nonexistent token
        );

        string memory currentBaseURI = _baseURI();
        return
            bytes(currentBaseURI).length  0
                 string(
                    abi.encodePacked(
                        currentBaseURI,
                        tokenId.toString(),
                        baseExtension
                    )
                )
                 ;
    }

    only owner
    function setCost(uint256 _newCost) public onlyOwner {
        cost = _newCost;
    }

    function setMaxAmountPerMint(uint256 _newMaxAmountPerMint) public onlyOwner {
        maxAmountPerMint = _newMaxAmountPerMint;
    }

    function setMaxMintPerAddress(uint256 _newMaxMintPerAddress) public onlyOwner {
        maxMintPerAddress = _newMaxMintPerAddress;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function getSignerAddress() public view onlyOwner returns (address) {
        return signerAddress;
    }

    function setSignerAddress(address _newSignerAddress) public onlyOwner {
        signerAddress = _newSignerAddress;
    }

    function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
        baseExtension = _newBaseExtension;
    }

    function setPublicEnabled(bool _state) public onlyOwner {
        publicEnabled = _state;
    }

    function setPresaleEnabled(bool _state) public onlyOwner {
        presaleEnabled = _state;
    }

    function whitelistUser(address _user) public onlyOwner {
        whitelisted[_user] = true;
    }

    function removeWhitelistUser(address _user) public onlyOwner {
        whitelisted[_user] = false;
    }

    function setAddressMintCount(address _user, uint256 count) public onlyOwner {
        addressMintCount[_user] = count;
    }

    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }

    
      Security 
     

    function isValidSignedData(bytes memory sig) public view returns (bool) {
        bytes32 message = keccak256(abi.encodePacked(_msgSender()));
        return (recoverSigner(message, sig) == signerAddress);
    }

    function recoverSigner(bytes32 message, bytes memory sig) public pure returns (address) {
        uint8 v;
        bytes32 r;
        bytes32 s;
        (v, r, s) = splitSignature(sig);
        return ecrecover(message, v, r, s);
    }

    function splitSignature(bytes memory sig) public pure returns (uint8, bytes32, bytes32) {
        require(sig.length == 65);
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
             first 32 bytes, after the length prefix
            r = mload(add(sig, 32))
             second 32 bytes
            s = mload(add(sig, 64))
             final byte (first byte of the next 32 bytes)
            v = byte(0, mload(add(sig, 96)))
        }

        return (v, r, s);
    }
}