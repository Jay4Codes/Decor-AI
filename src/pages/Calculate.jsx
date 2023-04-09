import React, { useState } from "react";
import "./Calculate.css";

const Calculate = () => {
  const [type, setType] = useState("");
  const [space, setSpace] = useState("");
  const [bhk, setBHK] = useState("");
  const [area, setArea] = useState("");
  const [cost, setCost] = useState("");
  const [paint, setPaint] = useState("");
  const [amount, setAmount] = useState("");
  const [desc, setDesc] = useState("");
  const [loadingTime, setLoadingTime] = useState(0);
  const [submitClicked, setSubmitClicked] = useState(false);

  const url = "http://127.0.0.1:8000/login/price-cal/";

  const handleSubmit = async () => {
    var formdata = new FormData();
    formdata.append("carpet_area", area);
    formdata.append("bhk", bhk);
    formdata.append("select_space", space);
    formdata.append("type_of_project", type);

    var requestOptions = {
      method: "POST",
      body: formdata,
      redirect: "follow",
    };

    fetch("http://127.0.0.1:8000/login/price-cal/", requestOptions)
      .then((response) => response.text())
      .catch((error) => console.log("error", error));
  };

  return (
    <div style={{ marginLeft: "20px", paddingTop: "120px" }}>
      <form className="contact__form">
        <label>Type of Project: </label>
        <input
          type="number"
          onChange={(e) => setType(e.target.value)}
          required
          className="form-control m-3"
        />
        <label>Select Space: </label>
        <input
          type="number"
          onChange={(e) => setSpace(e.target.value)}
          className="form-control m-3"
          required
        />
        <label>BHK: </label>
        <input
          type="number"
          onChange={(e) => setBHK(e.target.value)}
          className="form-control m-3"
          required
        />
        <label>Carpet Area (in sq. ft.): </label>
        <input
          type="number"
          onChange={(e) => setArea(e.target.value)}
          className="form-control m-3"
          required
        />
        <button
          type="submit"
          className="btn btn-main"
          onClick={(e) => {
            e.preventDefault();
            setSubmitClicked(true);
            handleSubmit();
          }}
        >
          Submit
        </button>
      </form>
      <div className="plan">
        <div>Cost: {cost}</div>
        <div>Paint: {paint}</div>
        <div>Amount: {amount}</div>
        <div>Description: {desc}</div>
      </div>
    </div>
  );
};

export default Calculate;
