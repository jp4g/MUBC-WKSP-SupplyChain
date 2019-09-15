pragma solidity >= 0.4.0 < 0.7.0;

/**
 * Interface for role management in supply chain demo app
 * @author MUBC
 * Date: 09.11.2019
 **/
contract ISupplyChainRoles {
   
    /// EVENTS ///
   
    event AdministratorEnrolled(address _to, string _name);
    event ManufacturerEnrolled(address _to, string _name);
    event TransporterEnrolled(address _to, string _name);
    event DistributerEnrolled(address _to, string _name);
    event BuyerEnrolled(address _to, string _name);
   
    /// VARIABLES ///
   
    enum Role { NONE, ADMINISTRATOR, MANUFACTURER, TRANSPORTER, DISTRIBUTER, BUYER }
    mapping(address => uint) roleAddressing;
    mapping(address => string) orgName;
   
    /// MODIFIERS ///
   
    modifier onlyAdministrator() {
        require(roleAddressing[msg.sender] == uint(Role.ADMINISTRATOR), "Address is not Administrator!");
        _;
    }
   
    modifier onlyManufacturer() {
        require(roleAddressing[msg.sender] == uint(Role.MANUFACTURER), "Address is not Manufacturer");
        _;
    }
   
    modifier onlyTransporter() {
        require(roleAddressing[msg.sender] == uint(Role.TRANSPORTER), "Address is not Transporter!");
        _;
    }
   
    modifier onlyDistributer() {
        require(roleAddressing[msg.sender] == uint(Role.DISTRIBUTER), "Address is not Distributer!");
        _;
    }
   
    modifier onlyBuyer() {
        require(roleAddressing[msg.sender] == uint(Role.BUYER), "Address is not Buyer!");
        _;
    }
   
    /// MUTABLE FUNCTIONS ///
   
    /**
     * @dev modifier onlyAdministrator
     * Give an address administrator permissions
     * @param _to address being permitted as administrator
     * @param _name string name of organization
     **/
    function enrollAdministrator(address _to, string memory _name) public;
   
    /**
     * @dev modifier onlyAdministrator
     * Give an address manufacturer permissions
     * @param _to address being permitted as manufacturer
     * @param _name string name of organization
     **/
    function enrollManufacturer(address _to, string memory _name) public;
   
    /**
     * @dev modifier onlyAdministrator
     * Give an address transporter permissions
     * @param _to address being permitted as transporter
     * @param _name string name of organization
     **/
    function enrollTransporter(address _to, string memory _name) public;
   
    /**
     * @dev modifier onlyAdministrator
     * Give an address distributer permissions
     * @param _to address being permitted as distributer
     * @param _name string name of organization
     **/
    function enrollDistributer(address _to, string memory _name) public;
   
    /**
     * @dev modifier onlyAdministrator
     * Give an address buyer permissions
     * @param _to address being permitted as buyer
     * @param _name string name of organization
     **/
    function enrollBuyer(address _to, string memory _name) public;
   
    /// VIEWABLE FUNCTIONS ///
   
    /**
     * Determine whether an address is an administrator
     * @param _query address being queried for administrator status
     * @return true if address is administator, and false otherwise
     **/
    function isAdministrator(address _query) public view returns (bool);
   
    /**
     * Determine whether an address is a manufacturer
     * @param _query address being queried for manufacturer status
     * @return true if address is manufacturer, and false otherwise
     **/
    function isManufacturer(address _query) public view returns (bool);
   
    /**
     * Determine whether an address is a transporter
     * @param _query address being queried for transporter status
     * @return true if address is transporter, and false otherwise
     **/
    function isTransporter(address _query) public view returns (bool);
   
    /**
     * Determine whether an address is a distributer
     * @param _query address being queried for distributer status
     * @return true if address is distributer, and false otherwise
     **/
    function isDistributer(address _query) public view returns (bool);
   
    /**
     * Determine whether an address is a buyer
     * @param _query address being queried for buyer status
     * @return true if address is buyer, and false otherwise
     **/
    function isBuyer(address _query) public view returns (bool);
   
    /**
     * Determine whether an address has joined the network
     * @param _query address being queried for network status
     * @return true if the address has been given a role in the network, and false otherwise
     **/
    function inNetwork(address _query) public view returns (bool);
   
    /**
     * Determine the name associated with an organization's address
     * @param _query address being queried for name
     * @return string organization name
     **/
    function organizationName(address _query) public view returns (string memory);

}
