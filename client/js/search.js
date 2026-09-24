document.addEventListener('DOMContentLoaded', () => {
    loadCategories();
    document.getElementById('search-form').addEventListener('submit', handleSearch);
});

async function loadCategories() {
    try {
        const categories = await fetchJSON('/categories');
        const select = document.getElementById('category');
        categories.forEach(cat => {
            const option = document.createElement('option');
            option.value = cat.category_id;
            option.textContent = cat.name;
            select.appendChild(option);
        });
    } catch (err) {
        console.error('Failed to load categories', err);
    }
}

async function handleSearch(event) {
    event.preventDefault();

    const date = document.getElementById('date').value;
    const location = document.getElementById('location').value.trim();
    const category = document.getElementById('category').value;

    const params = new URLSearchParams();
    if (date) params.append('date', date);
    if (location) params.append('location', location);
    if (category) params.append('category', category);

    const resultsGrid = document.getElementById('results-grid');
    resultsGrid.innerHTML = '<p class="empty-state">Searching...</p>';

    try {
        const events = await fetchJSON(`/events/search?${params.toString()}`);
        resultsGrid.innerHTML = events.map(buildEventCard).join('');
    } catch (err) {
        console.error(err);
        resultsGrid.innerHTML = '<p class="empty-state">Something went wrong while searching.</p>';
    }
}
