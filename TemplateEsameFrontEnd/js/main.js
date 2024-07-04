document.addEventListener("DOMContentLoaded", function() {
    const filmTableBody = document.getElementById("filmTable").getElementsByTagName("tbody")[0];

    // Recupera il token JWT dal localStorage
    const token = localStorage.getItem('jwt');
    if (!token) {
        console.error('Token JWT non trovato. Assicurati di aver effettuato il login correttamente.');
        window.location.href = '/Login.html';
        return;
    }

    fetch('https://localhost:7032/Film/Test', {
        headers: {
            'Authorization': `Bearer ${token}`, // Aggiungi il token JWT all'header Authorization
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        data.forEach((film, index) => {
            const row = filmTableBody.insertRow();
            
            const cell1 = row.insertCell(0);
            const cell2 = row.insertCell(1);
            const cell3 = row.insertCell(2);
            const cell4 = row.insertCell(3);

            cell1.textContent = film.titolo;
            cell2.textContent = film.genere;
            cell3.textContent = film.nazionalita;
            cell4.textContent = film.regista;
        });
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
    });
});
