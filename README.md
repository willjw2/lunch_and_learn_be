<div align="center">
  <h1>Lunch and Learn API</h1>
</div>


## Learning Goals
[Project Spec](https://backend.turing.edu/module3/projects/lunch_and_learn/)

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Setup

1. Fork and clone the repository
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:create`

## Where to get API keys
- [Edamam API](https://developer.edamam.com/edamam-recipe-api) for recipe search
- [Youtube API](https://developers.google.com/youtube/v3/getting-started) [Search Lists Endpoint](https://developers.google.com/youtube/v3/docs/search/list) for video search
- [Unsplash API](https://unsplash.com/documentation) for image search

## Endpoints
<details close>
<summary>Get Recipes for a Particular Country</summary>
<br>

Request:
**GET** `/api/v1/recipes?country=#{country_name}`

Response:
```json
{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
        },
        {...},
        {...},
        {...},
        {etc},
    ]
}
```
</details>

<details close>
<summary>Get Recipes for a Random Country</summary>
<br>

Request:
**GET** `/api/v1/recipes`

Response:
```json
{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Fairy Kale Ending - Bai Flavor Life",
                "url": "https://www.drinkbai.com/recipes/smoothies/fairy-kale-ending",
                "country": "Malawi",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Malawi Style Refried Beans",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "Malawi",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
        },
        {...},
        {...},
        {...},
        {etc},
    ]
}
```
</details>

<details close>
<summary>Get Learning Resources for a Particular Country</summary>
<br>

Request:
**GET** `/api/v1/learning_resources?country=laos`

Response:
```json
{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples landmark during daytime",
                    "url": "https://images.unsplash.com/photo-15281..."
                },
                {
                    "alt_tag": "five brown wooden boats",
                    "url": "https://images.unsplash.com/photo-..."
                },
                {
                    "alt_tag": "orange temples during daytime",
                    "url": "https://images.unsplash.com/photo-156..."
                },
                {...},
                {...},
                {...},
                {etc},
              ]
        }
    }
}
```
</details>

<details close>
<summary>User Registration</summary>
<br>

Request:
**POST** `/api/v1/users`

Body: <br>
```json
{
  "name": "Athena Dao",
  "email": "athenadao@bestgirlever.com"
}
```

Response:
```json
{
  "data": {
    "type": "user",
    "id": "1",
    "attributes": {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```
</details>

<details close>
<summary>Add Favorites</summary>
<br>

Request:
**POST** `/api/v1/favorites`

Body: <br>
```json
{
    "api_key": "jgn983hy48thw9begh98h4539h4",
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
}
```

Response:
```json
{
    "success": "Favorite added successfully"
}
```
</details>

<details close>
<summary>Get a User’s Favorites</summary>
<br>

Request:
**GET** `/api/v1/favorites?api_key=#{User_API_Key}`

Response:
```json
{
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Recipe: Egyptian Tomato Soup",
                "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                "country": "egypt",
                "created_at": "2022-11-02T02:17:54.111Z"
            }
        },
        {
            "id": "2",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "recipe_link": "https://www.tastingtable.com/.....",
                "country": "thailand",
                "created_at": "2022-11-07T03:44:08.917Z"
            }
        }
    ]
 }
```
</details>
