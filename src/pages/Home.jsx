import React, { useRef } from "react";
import { Controller, Scene } from "react-scrollmagic";
import Sequence from "../components/Sequence";
import art from "../assets/images/miniature.png";
import art2 from "../assets/images/miniature2.png";
import sofa from "../assets/images/sofa.png";
import sofa2 from "../assets/images/sofa2.png";
import wall from "../assets/images/wallart.png";
import wall2 from "../assets/images/wallart2.png";
import Fade from "react-reveal/Fade";
import "./Home.css";

const Home = () => {
  const ref = useRef();

  return (
    <div>
      <div className="banner">
        <p className="banner-title">Re-Imagine Your Dreams</p>
        <Controller>
          <Scene duration="200%" triggerHook="onLeave" pin>
            {(progress) => (
              <div
                style={{ height: "100vh", position: "relative" }}
                className="seq-images"
              >
                <Sequence ref={ref} progress={progress} />
              </div>
            )}
          </Scene>
        </Controller>
      </div>

      <Fade bottom cascade>
        <section className="portfolio marketplace">
          <div className="container">
            <div className="row mb-5">
              <h1>Marketplace</h1>
              <div className="col-10">
                <div
                  className="btn-group btn-group-toggle "
                  data-toggle="buttons"
                >
                  <label className="btn">
                    <input
                      type="radio"
                      name="shuffle-filter"
                      value="all"
                      checked="checked"
                    />
                    All Products
                  </label>
                  <label className="btn">
                    <input type="radio" name="shuffle-filter" value="design" />
                    Miniature Arts
                  </label>
                  <label className="btn">
                    <input
                      type="radio"
                      name="shuffle-filter"
                      value="branding"
                    />
                    Furniture
                  </label>
                  <label className="btn">
                    <input
                      type="radio"
                      name="shuffle-filter"
                      value="illustration"
                    />
                    Wall Arts
                  </label>
                  <label className="btn">
                    <input type="radio" name="shuffle-filter" value="photo" />
                    Sofa Sets
                  </label>
                </div>
              </div>
            </div>

            <div className="row shuffle-wrapper portfolio-gallery">
              <div
                className="col-lg-4 col-6 mb-4 shuffle-item"
                data-groups='["design","illustration"]'
              >
                <div className="position-relative inner-box">
                  <div className="image position-relative ">
                    <img
                      src={art}
                      alt="portfolio-image"
                      className="img-fluid w-100 d-block"
                    />
                    <div className="overlay-box">
                      <div className="overlay-inner">
                          <h5 className="mb-0">Miniature</h5>
                          <p>Design</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                className="col-lg-4 col-6 mb-4 shuffle-item"
                data-groups='["branding"]'
              >
                <div className="position-relative inner-box">
                  <div className="image position-relative ">
                    <img
                      src={wall}
                      alt="portfolio-image"
                      className="img-fluid w-100 d-block"
                    />
                    <div className="overlay-box">
                      <div className="overlay-inner">
                        <a
                          className="overlay-content"
                          href="portfolio-single.html"
                        >
                          <h5 className="mb-0">Wall Art</h5>
                          <p>Development</p>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                className="col-lg-4 col-6 mb-4 shuffle-item"
                data-groups='["illustration"]'
              >
                <div className="position-relative inner-box">
                  <div className="image position-relative ">
                    <img
                      src={sofa}
                      alt="portfolio-image"
                      className="img-fluid w-100 d-block"
                    />
                    <div className="overlay-box">
                      <div className="overlay-inner">
                        <a
                          className="overlay-content"
                          href="portfolio-single.html"
                        >
                          <h5 className="mb-0">Sofa</h5>
                          <p>marketing</p>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                className="col-lg-4 col-6 mb-4 shuffle-item"
                data-groups='["design","branding"]'
              >
                <div className="position-relative inner-box">
                  <div className="image position-relative ">
                    <img
                      src={sofa2}
                      alt="portfolio-image"
                      className="img-fluid w-100 d-block"
                    />
                    <div className="overlay-box">
                      <div className="overlay-inner">
                        <a
                          className="overlay-content"
                          href="portfolio-single.html"
                        >
                          <h5 className="mb-0">Chair</h5>
                          <p>Design</p>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                className="col-lg-4 col-6 mb-4 shuffle-item"
                data-groups='["illustration"]'
              >
                <div className="position-relative inner-box">
                  <div className="image position-relative ">
                    <img
                      src={art2}
                      alt="portfolio-image"
                      className="img-fluid w-100 d-block"
                    />
                    <div className="overlay-box">
                      <div className="overlay-inner">
                        <a
                          className="overlay-content"
                          href="portfolio-single.html"
                        >
                          <h5 className="mb-0 ">Miniature</h5>
                          <p>Seo</p>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div
                className="col-lg-4 col-6 mb-4 shuffle-item"
                data-groups='["design","photo"]'
              >
                <div className="position-relative inner-box">
                  <div className="image position-relative ">
                    <img
                      src={wall2}
                      alt="portfolio-image"
                      className="img-fluid w-100 d-block"
                    />
                    <div className="overlay-box">
                      <div className="overlay-inner">
                        <a
                          className="overlay-content"
                          href="portfolio-single.html"
                        >
                          <h5 className="mb-0"></h5>
                          <p>Design</p>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </Fade>

      <section className="section service-home border-top primary-section">
        <div className="container">
          <div className="row">
            <div className="col-lg-6">
              <h2 className="mb-2 ">Primary Features</h2>
              <p className="mb-5">We offer a wide range of features</p>
            </div>
          </div>

          <div className="row">
            <div className="col-lg-4">
              <div className="service-item mb-5" data-aos="fade-left">
                <h4 className="my-3">Theme Picker</h4>
                <p>
                  This feature provides users with a creative and personalized
                  experience to select the best theme that reflects their taste
                  and personality.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5"
                data-aos="fade-left"
                data-aos-delay="450"
              >
                <h4 className="my-3">Marketplace</h4>
                <p>
                  Implementing an AR-enabled virtual marketplace for e-commerce
                  would require a robust AR platform using computer vision and
                  machine learning, and a secure e-commerce system integrated
                  with payment processors and shipping providers.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5 mb-lg-0"
                data-aos="fade-left"
                data-aos-delay="750"
              >
                <h4 className="my-3">Panaroma View</h4>
                <p>
                  A panoramic view feature allows users to capture a wide-angle
                  view of a room in a single image, providing a comprehensive
                  visual overview of the space.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item"
                data-aos="fade-left"
                data-aos-delay="750"
              >
                <h4 className="my-3">3D Builder</h4>
                <p>
                  Software tool that allows users to create and customize
                  virtual rooms in a three-dimensional space, with features such
                  as walls, floors, ceilings, furniture, lighting, and textures
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5"
                data-aos="fade-left"
                data-aos-delay="950"
              >
                <h4 className="my-3">Cost Forecasting</h4>
                <p>
                  Detailed room-specific cost breakdown. Interactive cost
                  calculator for quick estimation of renovation costs
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5 mb-lg-0"
                data-aos="fade-left"
                data-aos-delay="1050"
              >
                <h4 className="my-3">Prompt Generation</h4>
                <p>
                  This feature allows users to input a prompt specifying their
                  preferred interior design style, and the app will generate a
                  fully furnished room with the requested design in just two
                  lines of code.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Home;
