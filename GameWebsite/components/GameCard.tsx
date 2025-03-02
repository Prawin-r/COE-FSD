import React, { useState } from "react";
import "./GameCard.css"; // Ensure this CSS file exists for styling

interface Game {
  id: number;
  name: string;
  background_image: string;
  released?: string;
  rating_top?: number;
  genres: { name: string }[];
}

interface GameCardProps {
  game: Game;
}

const GameCard: React.FC<GameCardProps> = ({ game }) => {
  const [hovered, setHovered] = useState(false);

  return (
    <div
      className="game-card"
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
    >
      {/* Game Image */}
      <img className="game-image" src={game.background_image} alt={game.name} />

      {/* Game Title & Genre */}
      <div className="game-info">
        <h3>{game.name}</h3>
        <p>{game.genres.map((g) => g.name).join(", ")}</p>
      </div>

      {/* Hover Details */}
      {hovered && (
        <div className="hover-details">
          <p className="hover-text">🖱 MOUSE</p>
          <p className="hover-text text-xl font-bold">32</p>
          <p className="hover-text">
            📅 Release Date: {game.released ? game.released : "N/A"}
          </p>
          <p className="hover-text">
            🎮 Genres: {game.genres.map((g) => g.name).join(", ")}
          </p>
          <p className="hover-text">
            📊 Chart: #{game.rating_top ? game.rating_top : "N/A"} Top{" "}
            {game.released ? new Date(game.released).getFullYear() : "N/A"}
          </p>
        </div>
      )}
    </div>
  );
};

export default GameCard;
