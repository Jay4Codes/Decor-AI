import React from "react";
// import Replicate from "replicate";

const RoomGPT = () => {
  // const replicate = new Replicate({
  //   auth: "a4d8b9cece7fec7ab285af80af02020910dcfe98",
  // });

  const startResponse = fetch("https://api.replicate.com/v1/predictions", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      Authorization: "Token a4d8b9cece7fec7ab285af80af02020910dcfe98",
    },
    body: JSON.stringify({
      version:
        "854e8727697a057c525cdb45ab037f64ecca770a1769cc52287c2e56472a247b",
      input: {
        image:
          "https://hips.hearstapps.com/hmg-prod/images/harder-jett-008-1643379018.jpg",
        prompt: "a video gaming room",
        scale: 9,
        a_prompt:
          "best quality, photo from Pinterest, interior, cinematic photo, ultra-detailed, ultra-realistic, award-winning, interior design, natural lighting",
        n_prompt:
          "longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality",
      },
    }),
  });

  console.log(startResponse);
  return <div>Replicate</div>;
};

export default RoomGPT;
