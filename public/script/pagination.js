const pg = document.getElementById("pagination");
const btnNextPg = document.querySelector(".next-page");
const btnPrevPg = document.querySelector(".prev-page");
const btnFirstPg = document.querySelector(".first-page");
const btnLastPg = document.querySelector(".last-page");


//RUN PAGINATION
// const valuePage = {
//   truncate: true,
//   curPage: 1,
//   numLinksTwoSide: 1,
//   totalPages: 100
// };
// pagination();




// DYNAMIC PAGINATION
function pagination(valuePage) {
    const totalPages = valuePage.totalPages;
    const curPage = valuePage.curPage;
    const truncate = valuePage.truncate;
    const delta = valuePage.numLinksTwoSide;
    let url = valuePage.url;
    url = url.replaceAll('&#x3D;',"=")
    url = url.replaceAll('&amp;',"&")
  const range = delta + 3; // use for handle visible number of links left side

  let render = "";
  let renderTwoSide = "";
  let dot = `<li class="pg-item"><a class="pg-link">...</a></li>`;
  let countTruncate = 0; // use for ellipsis - truncate left side or right side

  // use for truncate two side
  const numberTruncateLeft = curPage - delta;
  const numberTruncateRight = curPage + delta;

  let active = "";
  for (let pos = 1; pos <= totalPages; pos++) {
    active = pos === curPage ? "active" : "";

    // truncate
    if (totalPages >= 2 * range - 1 && truncate) {
      if (numberTruncateLeft > 3 && numberTruncateRight < totalPages - 3 + 1) {
        // truncate 2 side
        if (pos >= numberTruncateLeft && pos <= numberTruncateRight) {
          renderTwoSide += renderPage(pos, active, url);
        }
      } else {
        // truncate left side or right side
        if (
          (curPage < range && pos <= range) ||
          (curPage > totalPages - range && pos >= totalPages - range + 1) ||
          pos === totalPages ||
          pos === 1
        ) {
          render += renderPage(pos, active, url);
        } else {
          countTruncate++;
          if (countTruncate === 1) render += dot;
        }
      }
    } else {
      // not truncate
      render += renderPage(pos, active, url);
    }
  }

  if (renderTwoSide) {
    renderTwoSide =
      renderPage(1,"", url) + dot + renderTwoSide + dot + renderPage(totalPages,"",url);
    pg.innerHTML = renderTwoSide;
  } else {
    pg.innerHTML = render;
  }
 
  if(curPage == totalPages){
  
    btnNextPg.classList.add("disabled");
    btnLastPg.classList.add("disabled");
  }else{
    btnNextPg.classList.remove("disabled");
    btnNextPg.href = `${url}&p=${curPage+1}`

    btnLastPg.classList.remove("disabled");
    btnLastPg.href = `${url}&p=${totalPages}`
  }

  if(curPage == 1){
    btnPrevPg.classList.add("disabled");
    btnFirstPg.classList.add("disabled");
  }else{
    btnPrevPg.classList.remove("disabled");
    btnPrevPg.href = `${url}&p=${curPage-1}`
    btnFirstPg.classList.remove("disabled");
    btnFirstPg.href = `${url}&p=1`
  }
}
function renderPage(index, active = "", url) {
    return ` <li class="pg-item ${active}" data-page="${index}">
        <a class="pg-link" href="${url}&p=${index}">${index}</a>
    </li>`;
}
