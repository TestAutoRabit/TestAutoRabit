trigger Forecast on User (before insert) {
for (user U: trigger.new)
{
u.ForecastEnabled=true;
}
}