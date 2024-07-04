document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('main-form').addEventListener('submit', function(event) {
        event.preventDefault();
        
        var formData = {
            username: document.getElementById('username').value,
            password: document.getElementById('password').value
        };
    
        fetch('https://localhost:7032/authentication/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Errore durante il login');
            }
            return response.text(); // Leggi la risposta come testo
        })
        .then(data => {
            localStorage.setItem('jwt', data); // Salva il token JWT in locale
            window.location.href = '/Home.html'; // Reindirizza alla pagina di dashboard dopo il login
        })
        .catch(error => {
            console.error('Errore durante il login:', error);
            showAlert('Credenziali errate. Riprova.');
        });
    });

    function showAlert(message) {
        swal({
            title: "Errore!",
            text: message,
            icon: "error",
            button: "OK",
        });
    }
});
