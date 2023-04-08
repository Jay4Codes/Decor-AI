import React from "react";

const Contact = () => {
  return (
    <div>
      <section className="contact section">
        <div className="container">
          <div className="row">
            <div className="col-lg-4 mb-4 mb-lg-0 col-md-4">
              <h4>Contact Info</h4>
              <p>
                Lorem ipsum dolor sit amet, conse adipisicing elit libero
                incidunt quod.
              </p>
            </div>
            <div className="col-lg-4 mb-4 mb-lg-0 col-md-4">
              <h4>Address</h4>
              <p>
                3971 Wines Lane Houston, Texas 77036 <br />
                363 Detroit Street
              </p>
            </div>
            <div className="col-lg-4 col-md-4">
              <h4>Contact</h4>
              <p className="mb-0">info@example.com</p>
              <p className="mb-0">1800 667 3322</p>
            </div>
          </div>
          <div className="row">
            <div className="col-lg-12 col-md-12 col-sm-12">
              <div className="google-map">
                <div id="map"></div>
              </div>
            </div>
          </div>

          <div className="row justify-content-center">
            <div className="col-lg-8">
              <div className="text-center mb-5 contact-title">
                <h2>Contact us</h2>
              </div>

              <form id="contact-form" className="contact__form mt-5">
                <div className="row">
                  <div className="col-12">
                    <div
                      className="alert alert-success contact__msg"
                      style={{ display: "none" }}
                      role="alert"
                    >
                      Your message was sent successfully.
                    </div>
                  </div>
                </div>
                <div className="form-row">
                  <div className="col-lg-6">
                    <div className="form-group mb-3">
                      <input
                        name="name"
                        type="text"
                        className="form-control"
                        placeholder="Your Name"
                      />
                    </div>
                  </div>
                  <div className="col-lg-6">
                    <div className="form-group mb-3">
                      <input
                        name="name"
                        type="text"
                        className="form-control"
                        placeholder="Your Subject"
                      />
                    </div>
                  </div>

                  <div className="col-lg-12">
                    <div className="form-group mb-3">
                      <input
                        name="email"
                        type="email"
                        className="form-control"
                        placeholder="Email Address"
                      />
                    </div>
                  </div>
                  <div className="col-lg-12">
                    <div className="form-group-2 mb-4">
                      <textarea
                        name="message"
                        className="form-control"
                        rows="6"
                        placeholder="Your Message"
                      ></textarea>
                    </div>

                    <div className="text-center">
                      <button
                        className="btn btn-main"
                        name="submit"
                        type="submit"
                      >
                        Send Message
                      </button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Contact;
