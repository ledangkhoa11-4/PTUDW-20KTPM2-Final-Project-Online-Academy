function renderRating(selector){
	console.log(selector);
	let ratingDivs = document.querySelectorAll(selector);
	Array.from(ratingDivs).forEach((div) => {
		let score = div.attributes.rating_score.value;
		let roundScore = Math.round(div.attributes.rating_score.value * 2) / 2;
		let count = div.attributes.rating_count.value;
		let html = `<small class="rating-score mr-2">${score}</small>`;
		for (var i = 1; i <= roundScore; i++) {
			html += `<i class="bi bi-star-fill mr-1"></i>`;
		}
		if (i - roundScore == 0.5) {
			html += `<i class="bi bi-star-half mr-1"></i>`;
			i++;
		}
		for (; i <= 5; i++) {
			html += `<i class="bi bi-star mr-1"></i>`;
		}
		html += `<small class="rating-count ml-1  ">(${count})</small>`;
	
		div.innerHTML = html;
	});	
}
