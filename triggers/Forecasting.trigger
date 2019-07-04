trigger Forecasting on User (before insert) {
for (user U: trigger.new)
{
u.ForecastEnabled=true;
}
}