<script>
    import { onMount } from "svelte";

    let events = [];
    onMount(async () => {
        getEvent();
    });

    let name = "";
    let date = "";
    let user = "/api/users/1";
    let participations = [];

    async function addEvent(event) {
        await fetch("http://127.0.0.1:8000/api/events", {
            method: "POST",
            headers: {
                "Content-Type": "application/ld+json",
            },
            body: JSON.stringify(event),
        });
        getEvent();
        name = "";
        date = "";
    }

    async function getEvent() {
        const res = await fetch("http://127.0.0.1:8000/api/events");
        events = await res.json();
    }

    async function deleteEvent(id) {
        await fetch(`http://127.0.0.1:8000/api/events/${id}`, {
            method: "DELETE",
        });
        getEvent();
    }
</script>

<h1>My Events</h1>
<form
    on:submit|preventDefault={() => {
        addEvent({ name, date, user, participations });
    }}
>
    <label for="name">Name</label>
    <input type="text" id="name" bind:value={name} />
    <label for="date">Date</label>
    <input type="datetime-local" id="date" bind:value={date} />
    <button type="submit">Add event</button>
</form>
<!-- Display event as cards-->
{#each events.member as event}
    <div>
        <h2>ID : {event.id} - {event.name}</h2>
        <p>{event.date}</p>
        <p>Participations :</p>
        <ul>
            {#each event.participations as participation}
                <li>{participation}</li>
            {/each}
        </ul>
        <form
            on:submit|preventDefault={() => {
                deleteEvent(event.id);
            }}
        >
            <button type="submit">Delete</button>
        </form>
    </div>
{/each}
