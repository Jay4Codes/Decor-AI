import React, { forwardRef } from "react";
import { Skeleton } from "./Skeleton";
import ImageArray from "./ImageArray";

const ImageSequence = forwardRef(({ progress }, ref) => {
  const newImages = ImageArray();

  let index = Math.round(progress * 1 * (newImages.length - 1));

  if (newImages[index][1] !== undefined) {
    if (newImages[index][1] === "loading") {
      return <Skeleton width="100%" height="100%" />;
    } else {
      return newImages.map((item, i) => (
        <span
          ref={ref}
          key={i}
          style={{
            display: i !== index ? "none" : "block",
            height: "100%",
            width: "100%",
            backgroundImage: `url('${item[0] ? item[0].src : null}')`,
            backgroundSize: "cover",
            backgroundPosition: "center",
          }}
        />
      ));
    }
  }
});

export default ImageSequence;
