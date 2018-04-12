var elements = document.querySelectorAll("span[id^='c']");
for (var i = 0; i < elements.length; i++) {
    elements[i].onclick = function func1(event) {
        var elements = document.querySelectorAll("span[id^='c']");
        for (var i = 0; i < elements.length; i++) {
            elements[i].style.backgroundColor = "white";
        }
        event.target.style.backgroundColor = "silver";
    }
}