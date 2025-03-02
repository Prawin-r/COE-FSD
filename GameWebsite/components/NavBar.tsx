import {
  HStack,
  Image,
  InputGroup,
  Input,
  InputLeftElement,
  Center,
  Button,
  ButtonGroup,
  IconButton,
  Flex,
} from "@chakra-ui/react";
import { BiSearch } from "react-icons/bi";
import { FaBell } from "react-icons/fa"; // Notification icon
import DarkSwitch from "./DarkSwitch";

const NavBar = ({ onSearch }: { onSearch: (query: string) => void }) => {
  return (
    <HStack
      justifyContent="space-between"
      padding="20px"
      bg="black"
      color="white"
    >
      {/* Logo */}
      <Image
        src="https://press.asus.com/assets/w_743,h_640/90767418-95b3-4934-b729-d5a6b1e97bd3/ROG-logo-white.png"
        boxSize="100px"
        alt="RAWG Logo"
      />

      {/* Search Bar - Centered */}
      <Flex flex="1" justify="center">
        <InputGroup width="50%">
          <InputLeftElement pointerEvents="none">
            <BiSearch color="gray.300" size="20px" />
          </InputLeftElement>
          <Input
            placeholder="Search for a game..."
            bg="gray.700"
            color="white"
            _placeholder={{ color: "gray.400" }}
            borderRadius="md"
            onChange={(e) => onSearch(e.target.value)}
          />
        </InputGroup>
      </Flex>

      {/* Buttons & Dark Mode Toggle - Right Side */}
      <HStack spacing={4}>
        <Button variant="ghost" color="white" _hover={{ bg: "gray.700" }}>
          Home
        </Button>
        <Button variant="ghost" color="white" _hover={{ bg: "gray.700" }}>
          My Library
        </Button>
        <IconButton
          aria-label="Notifications"
          icon={<FaBell />}
          color="white"
          variant="ghost"
          _hover={{ bg: "gray.700" }}
        />
        <DarkSwitch />
      </HStack>
    </HStack>
  );
};

export default NavBar;
