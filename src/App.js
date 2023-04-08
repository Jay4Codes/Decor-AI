import "./App.css";

function App() {
  let startResponse = fetch("https://api.replicate.com/v1/predictions", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Token a4d8b9cece7fec7ab285af80af02020910dcfe98",
    },
    body: JSON.stringify({
      version:
        "854e8727697a057c525cdb45ab037f64ecca770a1769cc52287c2e56472a247b",
      input: {
        image:
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/612QHteoZ2S._SY450_.jpg",
        prompt: "hello world",
        scale: 9,
        a_prompt:
          "best quality, photo from Pinterest, interior, cinematic photo, ultra-detailed, ultra-realistic, award-winning, interior design, natural lighting",
        n_prompt:
          "longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality",
      },
    }),
  });

  console.log(startResponse);

  return <div className="App"></div>;
}

export default App;
