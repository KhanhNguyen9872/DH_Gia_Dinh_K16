<template>
   <main>  
        <div class="menu">
            <h2 class="menu-title">Taste Our Foods & Enjoy</h2>
            <div class="menu-carousel">
                <div class="menu-item">
                    <router-link :to="{name: 'ProductDetail', params:{id}}">
                        <img :src="product.image" alt="Pumpkin Spice Juice">
                        <div class="menu-item-info">
                            <h3>{{product.name}}</h3>
                            <p>{{product.description}}</p>
                            <p>{{product.price}}</p>
                        </div>
                                      
                    </router-link>
                    </div>
            </div>
        </div>  
    </main>
</template>

<script>
export default {
    // nhận giá trị từ cha props:['bientruyen']
    props:['product'],
    data() {
        return {
            id : this.product.id
        }
    }
}
</script>

<style>
.menu {
    text-align: center;
    padding: 40px 20px;
    background-color: #fff;
}

.menu-title {
    font-size: 32px;
    margin-bottom: 20px;
}

.menu-carousel {
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    position: relative;
    max-width: 100%;
    animation: slideIn 1s ease-in-out;
}

.menu-item {
    position: relative;
    flex: 0 0 25%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    margin: 0 10px;
    overflow: hidden;
    transition: transform 0.3s ease;
}

.menu-item img {
    width: 100%;
    transition: transform 0.3s ease;
}

.menu-item-info {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.7);
    color: #fff;
    text-align: left;
    padding: 20px;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.menu-item:hover .menu-item-info {
    opacity: 1;
}

.menu-item:hover img {
    transform: scale(1.1);
}

.menu-item-info h3 {
    font-size: 18px;
    margin: 0 0 10px;
}

.menu-item-info p {
    margin: 0;
    color: #ccc;
}

.menu-navigation {
    position: absolute;
    top: 50%;
    width: 100%;
    display: flex;
    justify-content: space-between;
    transform: translateY(-50%);
}

.menu-navigation i {
    background-color: rgba(0, 0, 0, 0.5);
    color: #fff;
    padding: 10px;
    border-radius: 50%;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.menu-navigation i:hover {
    background-color: #fcb034;
}
</style>