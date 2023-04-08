import React, { useRef } from "react";
import { Controller, Scene } from "react-scrollmagic";
import Sequence from "../components/Sequence";

const Home = () => {
  const ref = useRef();

  return (
    <div>
      <Controller>
        <Scene duration="200%" triggerHook="onLeave" pin>
          {(progress) => (
            <div style={{ height: "100vh", position: "relative" }}>
              <Sequence ref={ref} progress={progress} />
            </div>
          )}
        </Scene>
      </Controller>
      <section className="portfolio ">
        <div className="container">
          <div className="row mb-5">
            <div className="col-10">
              <div
                className="btn-group btn-group-toggle "
                data-toggle="buttons"
              >
                <label className="btn active ">
                  <input
                    type="radio"
                    name="shuffle-filter"
                    value="all"
                    checked="checked"
                  />
                  All Projects
                </label>
                <label className="btn">
                  <input type="radio" name="shuffle-filter" value="design" />
                  UI/UX Design
                </label>
                <label className="btn">
                  <input type="radio" name="shuffle-filter" value="branding" />
                  branding
                </label>
                <label className="btn">
                  <input
                    type="radio"
                    name="shuffle-filter"
                    value="illustration"
                  />
                  Web Development
                </label>
                <label className="btn">
                  <input type="radio" name="shuffle-filter" value="photo" />
                  Photography
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
                    src="images/portfolio/1.jpg"
                    alt="portfolio-image"
                    className="img-fluid w-100 d-block"
                  />
                  <div className="overlay-box">
                    <div className="overlay-inner">
                      <a
                        className="overlay-content"
                        href="portfolio-single.html"
                      >
                        <h5 className="mb-0">Painting</h5>
                        <p>Design</p>
                      </a>
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
                    src="images/portfolio/4.jpg"
                    alt="portfolio-image"
                    className="img-fluid w-100 d-block"
                  />
                  <div className="overlay-box">
                    <div className="overlay-inner">
                      <a
                        className="overlay-content"
                        href="portfolio-single.html"
                      >
                        <h5 className="mb-0">Web app</h5>
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
                    src="images/portfolio/3.jpg"
                    alt="portfolio-image"
                    className="img-fluid w-100 d-block"
                  />
                  <div className="overlay-box">
                    <div className="overlay-inner">
                      <a
                        className="overlay-content"
                        href="portfolio-single.html"
                      >
                        <h5 className="mb-0">Business </h5>
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
                    src="images/portfolio/5.jpg"
                    alt="portfolio-image"
                    className="img-fluid w-100 d-block"
                  />
                  <div className="overlay-box">
                    <div className="overlay-inner">
                      <a
                        className="overlay-content"
                        href="portfolio-single.html"
                      >
                        <h5 className="mb-0">Portfolio</h5>
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
                    src="images/portfolio/6.jpg"
                    alt="portfolio-image"
                    className="img-fluid w-100 d-block"
                  />
                  <div className="overlay-box">
                    <div className="overlay-inner">
                      <a
                        className="overlay-content"
                        href="portfolio-single.html"
                      >
                        <h5 className="mb-0 ">Modern web</h5>
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
                    src="images/portfolio/7.jpg"
                    alt="portfolio-image"
                    className="img-fluid w-100 d-block"
                  />
                  <div className="overlay-box">
                    <div className="overlay-inner">
                      <a
                        className="overlay-content"
                        href="portfolio-single.html"
                      >
                        <h5 className="mb-0">Agency web</h5>
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
      <section className="section service-home border-top">
        <div className="container">
          <div className="row">
            <div className="col-lg-6">
              <h2 className="mb-2 ">Core Services.</h2>
              <p className="mb-5">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Necessitatibus, totam ipsa quia hic odit a sit laboriosam
                voluptatem in, blanditiis.
              </p>
            </div>
          </div>

          <div className="row">
            <div className="col-lg-4">
              <div className="service-item mb-5" data-aos="fade-left">
                <i className="ti-layout"></i>
                <h4 className="my-3">Web Development</h4>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Iusto, earum.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5"
                data-aos="fade-left"
                data-aos-delay="450"
              >
                <i className="ti-announcement"></i>
                <h4 className="my-3">Digital Marketing</h4>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Iusto, earum.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5 mb-lg-0"
                data-aos="fade-left"
                data-aos-delay="750"
              >
                <i className="ti-layers"></i>
                <h4 className="my-3">Graphics Design</h4>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Iusto, earum.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item"
                data-aos="fade-left"
                data-aos-delay="750"
              >
                <i className="ti-anchor"></i>
                <h4 className="my-3">Branding Design</h4>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Iusto, earum.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5"
                data-aos="fade-left"
                data-aos-delay="950"
              >
                <i className="ti-video-camera"></i>
                <h4 className="my-3">Video Marketing</h4>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Iusto, earum.
                </p>
              </div>
            </div>
            <div className="col-lg-4">
              <div
                className="service-item mb-5 mb-lg-0"
                data-aos="fade-left"
                data-aos-delay="1050"
              >
                <i className="ti-android"></i>
                <h4 className="my-3">App Design</h4>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Iusto, earum.
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
