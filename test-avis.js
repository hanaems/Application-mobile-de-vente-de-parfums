// Test de la route avis-commande-simple
const API_URL = 'http://20.30.1.59:3000';

async function testAvis() {
  try {
    console.log('Test de la route avis-commande-simple...');
    
    const response = await fetch(`${API_URL}/api/avis-commande-simple`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        user_id: 7,
        commande_id: 1,
        note: 5,
        commentaire: 'Test avis'
      })
    });

    console.log('Status:', response.status);
    console.log('Headers:', response.headers);
    
    const text = await response.text();
    console.log('Response text:', text);
    
    try {
      const json = JSON.parse(text);
      console.log('JSON:', json);
    } catch (e) {
      console.log('Pas du JSON, probablement du HTML:', text.substring(0, 200));
    }
    
  } catch (error) {
    console.error('Erreur:', error);
  }
}

testAvis();