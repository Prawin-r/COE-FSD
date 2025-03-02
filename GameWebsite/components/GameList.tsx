import { useEffect, useState } from "react";
import axios from "axios";
import {
  SimpleGrid,
  Spinner,
  Box,
  Text,
  Image,
  Center,
  Badge,
  Button,
  useColorModeValue,
} from "@chakra-ui/react";

interface Game {
  id: number;
  name: string;
  background_image?: string;
  genres: { name: string }[];
  rating: number;
  released: string;
  metacritic?: number;
  platforms: { platform: { name: string } }[];
}

const API_KEY = "416fa1e3ff8c46c091626f4dd09987ee";
const PAGE_SIZE = 20; // Number of games per page

const GameList: React.FC<{ searchQuery: string }> = ({ searchQuery }) => {
  const [games, setGames] = useState<Game[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [page, setPage] = useState<number>(1);
  const [nextPage, setNextPage] = useState<string | null>(null);
  const [prevPage, setPrevPage] = useState<string | null>(null);

  useEffect(() => {
    const fetchGames = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await axios.get(
          `https://api.rawg.io/api/games?key=${API_KEY}&page=${page}&page_size=${PAGE_SIZE}`
        );
        setGames(response.data.results);
        setNextPage(response.data.next);
        setPrevPage(response.data.previous);
      } catch (error) {
        setError("Failed to load games. Please try again.");
      } finally {
        setLoading(false);
      }
    };

    fetchGames();
  }, [page]);

  // 🔹 Filter games based on search query
  const filteredGames = games.filter((game) =>
    game.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  // Dynamically adjust text color based on card background
  const cardBg = "gray.800"; // Darker shade of gray for better contrast
  const textColor = "white"; // White text for better visibility
  const subTextColor = "gray.400"; // Light gray for secondary text

  if (loading) {
    return (
      <Center height="100vh">
        <Spinner size="xl" color="teal.500" />
      </Center>
    );
  }

  if (error) {
    return (
      <Center height="100vh">
        <Text color="red.500">{error}</Text>
      </Center>
    );
  }

  return (
    <Box bg="black" minH="100vh" padding="20px">
      <SimpleGrid columns={[1, 2, 3, 4]} spacing="20px">
        {filteredGames.length > 0 ? (
          filteredGames.map((game) => (
            <Box
              key={game.id}
              borderRadius="lg"
              overflow="hidden"
              bg={cardBg}
              p={4}
              boxShadow="md"
              transition="transform 0.2s ease-in-out"
              _hover={{ transform: "scale(1.05)", boxShadow: "lg" }}
            >
              <Image
                src={game.background_image || "https://via.placeholder.com/400"}
                alt={game.name}
                borderRadius="md"
                fallbackSrc="https://via.placeholder.com/400"
              />
              <Text fontSize="lg" fontWeight="bold" mt={2} color={textColor}>
                {game.name}
              </Text>

              <Text fontSize="sm" color={subTextColor}>
                {game.genres.map((g) => g.name).join(", ") ||
                  "No genres available"}
              </Text>

              {/* Game Rating */}
              <Badge colorScheme="teal" mt={2} fontSize="md">
                ⭐ {game.rating}
              </Badge>

              {/* Release Date */}
              <Text fontSize="sm" color={subTextColor} mt={1}>
                Released: {game.released}
              </Text>

              {/* Metacritic Score */}
              {game.metacritic && (
                <Badge colorScheme="purple" fontSize="md" mt={1}>
                  Metacritic: {game.metacritic}
                </Badge>
              )}

              {/* Platforms */}
              <Text fontSize="xs" color="gray.500" mt={2}>
                Platforms:{" "}
                {game.platforms.map((p) => p.platform.name).join(", ")}
              </Text>
            </Box>
          ))
        ) : (
          <Center w="100%">
            <Text fontSize="xl" color="white">
              No games found.
            </Text>
          </Center>
        )}
      </SimpleGrid>

      {/* Pagination Controls */}
      <Center mt={5}>
        <Button
          onClick={() => setPage((prev) => prev - 1)}
          isDisabled={!prevPage}
          colorScheme="teal"
          mr={3}
        >
          Previous
        </Button>
        <Text fontSize="lg" color="white" mx={3}>
          Page {page}
        </Text>
        <Button
          onClick={() => setPage((prev) => prev + 1)}
          isDisabled={!nextPage}
          colorScheme="teal"
        >
          Next
        </Button>
      </Center>
    </Box>
  );
};

export default GameList;
