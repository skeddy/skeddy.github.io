const daysE1 = document.getElementById('Days');
const hoursE1 = document.getElementById('Hours');
const minutesE1 = document.getElementById('Minutes');
const secondsE1 = document.getElementById('Seconds');
const newYears = "23 Jul 2022"
function countdown() {
    const newYearDate = new Date(newYears);
    const currentDate = new Date();
    const totalSeconds = (newYearDate - currentDate) / 1000;

    const days = Math.floor(totalSeconds / 3600 / 24);
    const hours = Math.floor(totalSeconds / 3600)%24;
    const mins = Math.floor(totalSeconds / 60) % 60;
    const secs = Math.floor(totalSeconds) % 60;
    daysE1.innerHTML = days;
    hoursE1.innerHTML = formatTime(hours);
    minutesE1.innerHTML= formatTime(mins);
    secondsE1.innerHTML= formatTime(secs);
}
function formatTime(time) {
    return time < 10 ? `0${time}`: time;
}
setInterval(countdown, 1000);
countdown();