import React from "react";

export const Skeleton = ({
  count,
  width,
  wrapper: Wrapper,
  height,
  circle,
  margin,
}) => {
  const elements = [];

  for (let i = 0; i < count; i++) {
    let style = {
      margin: margin,
    };

    if (width !== null) {
      style.width = width;
    }

    if (height !== null) {
      style.height = height;
    }

    if (width !== null && height !== null && circle) {
      style.borderRadius = "100%";
    }

    elements.push(
      <span key={i} className="skeleton" style={style}>
        &zwnj;
      </span>
    );
  }

  return (
    <span>
      {Wrapper
        ? elements.map((element, i) => (
            <Wrapper key={i}>
              {element}
              &zwnj;
            </Wrapper>
          ))
        : elements}
    </span>
  );
};

Skeleton.defaultProps = {
  count: 1,
  width: null,
  wrapper: null,
  height: null,
  circle: false,
  margin: 0,
};
