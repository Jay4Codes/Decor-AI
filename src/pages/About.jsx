import React from "react";
import Fade from "react-reveal/Fade";

const About = () => {
  return (
    <Fade bottom cascade>
      <section className="section banner-2">
        <div className="container">
          <div className="row">
            <div className="col-lg-10">
              <h2 className="cd-headline clip is-full-width mb-4">
                We provide
                <br />
                <span className="cd-words-wrapper text-color">
                  <b className="is-visible">brand identity</b>
                  <b>design solutions</b>
                  <b>great services</b>
                </span>
                <br />
                towards our clien
              </h2>
              <p className="mb-5">
                We build clean, appealing, and functional interfaces which
                comply with the latest web standards.The point of using Lorem
                Ipsum was popularised. Lorem ipsum dolor sit amet, consectetur
                adipisicing elit. Natus, quasi?
              </p>
            </div>
          </div>
          <div className="row">
            <div className="col-lg-4" data-aos="fade-right">
              <h4>Modern Design</h4>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum,
                dolores.
              </p>
            </div>

            <div
              className="col-lg-4"
              data-aos="fade-right"
              data-aos-delay="450"
            >
              <h4>Clean Code</h4>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum,
                dolores.
              </p>
            </div>
            <div
              className="col-lg-4"
              data-aos="fade-right"
              data-aos-delay="650"
            >
              <h4>Fully Responsive</h4>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum,
                dolores.
              </p>
            </div>
          </div>
        </div>
      </section>
    </Fade>
  );
};

export default About;
