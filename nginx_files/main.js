async function main() {
  console.log('Hello JavaScript');
  const response = await fetch('/api/hello');
  console.log(response);
  const responseBody = await response.json();
  console.log(responseBody);

  const messageElement = document.getElementById('message');
  messageElement.innerText = responseBody.message;
}

main();
