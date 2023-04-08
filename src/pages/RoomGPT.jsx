import React, { useState } from "react";
import FileBase64 from "react-file-base64";
import ImageSlider from "react-image-comparison-slider";

const RoomGPT = () => {
  const [image, setImage] = useState("");
  const [selectedImage, setSelectedImage] = useState(null);
  const [previewImage, setPreviewImage] = useState(null);
  const [newImage, setNewImage] = useState("");
  const [prompt, setPrompt] = useState("");
  const [loadingTime, setLoadingTime] = useState(0);
  const [submitClicked, setSubmitClicked] = useState(false);

  const url = "http://127.0.0.1:8000/login/ml-model/";

  const handleImageUpload = (event) => {
    const file = event.target.files[0];
    setSelectedImage(file);

    const reader = new FileReader();

    reader.onload = () => {
      setPreviewImage(reader.result);
    };

    reader.readAsDataURL(file);
  };

  const requestOptions = {
    method: "POST",
    body: JSON.stringify({ image: image.base64, prompt: prompt }),
  };

  const handleSubmit = () => {
    if (!image) {
      alert("Please upload an image");
      return;
    }
    callApi();
  };

  const callApi = async () => {
    try {
      const res = await fetch(url, requestOptions);
      const data = await res.json();
      console.log(data.image);
      setNewImage(data.image);
      setLoadingTime(parseInt(data.loading_time));
    } catch (error) {
      alert(error);
    }
  };

  // const handleSubmit = (event) => {
  //   callApi();
  // };

  // const callApi = async () => {
  //   try {
  //     const res = await fetch(
  //       "http://127.0.0.1:8000/ml-model/",
  //       requestOptions
  //     );
  //     const data = await res.json();
  //     console.log(data.image);
  //     setNewImage(data.image);
  //     // setLoadingTime(parseInt(data.loading_time));
  //   } catch (error) {
  //     alert(error);
  //   }
  // };

  return (
    <div>
      <div className="avatar">
        {previewImage ? (
          <img src={previewImage} alt="preview" />
        ) : (
          <>
            <label>Upload Image</label>
            <FileBase64
              type="file"
              multiple={false}
              className="image-upload"
              onDone={(file) => setImage(file)}
            />
          </>
        )}
      </div>
      <input type="text" onChange={(e) => setPrompt(e.target.value)} />
      <button
        className="btn btn-main"
        name="submit"
        type="submit"
        onClick={(e) => {
          e.preventDefault();
          setSubmitClicked(true);
          handleSubmit();
        }}
      >
        Submit
      </button>
      <img src={newImage} alt="newImage" />
      <div style={{ width: 700, height: 450 }}>
        <ImageSlider
          image1={previewImage}
          image2={newImage}
          onSlide={() => {
            console.log("sliding");
          }}
        />
      </div>
    </div>
  );
};

export default RoomGPT;
