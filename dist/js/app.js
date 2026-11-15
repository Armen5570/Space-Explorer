
const planets = [
    { name: "Mercury", info: "A rocky planet covered with craters." },
    { name: "Venus", info: "A hot world covered in thick clouds." },
    { name: "Earth", info: "Our home planet with oceans and continents." },
    { name: "Mars", info: "The red planet with dusty landscapes." },
    { name: "Jupiter", info: "A giant planet with powerful storms." },
    { name: "Saturn", info: "A gas giant surrounded by beautiful rings." },
    { name: "Uranus", info: "A cold ice giant with a blue atmosphere." },
    { name: "Neptune", info: "A deep blue planet with strong winds." }
];

const grid = document.getElementById("planetGrid");
const search = document.getElementById("search");

function renderPlanets(items) {
    grid.innerHTML = "";

    if (!items.length) {
        grid.innerHTML = "<p>No planets found.</p>";
        return;
    }

    items.forEach(planet => {
        const card = document.createElement("article");
        card.className = "planet-card";

        card.innerHTML = `
            <div class="planet-visual">
                <div class="planet-real ${planet.name.toLowerCase()}"></div>
            </div>
            <h3>${planet.name}</h3>
            <p>${planet.info}</p>
        `;

        grid.appendChild(card);
    });
}

search.addEventListener("input", () => {
    const value = search.value.toLowerCase();

    renderPlanets(
        planets.filter(planet =>
            planet.name.toLowerCase().includes(value)
        )
    );
});

renderPlanets(planets);
