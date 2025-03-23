<script>
    import { onMount } from "svelte";

    onMount(async () => {
        getUser();
    });

    let user = "";

    async function getUser() {
        const res = await fetch("http://127.0.0.1:8000/api/users/1");
        user = await res.json();
    }
</script>

<h1>My profil</h1>

<!-- Display event as cards-->
<div>
    <h2>Pseudo : {user.pseudo}</h2>
    <p>Email : {user.email}</p>
    <div>
        <h3>My events</h3>
        <ul>
            {#each user.events as event}
                <li>{event}</li>
            {/each}
        </ul>
    </div>

    <div>
        <h3>My participations</h3>
        <ul>
            {#each user.participations as event}
                <li>{event}</li>
            {/each}
        </ul>
    </div>
</div>
