Events.on(Person, "change", function(person) {
    person.email = "HELLO FROM EVENTS";
});
