# Base Rails

## Standard Workflow

 1. Set up the project: `bin/setup`
 1. Start the web server by running `bin/server`.
 1. Navigate to your live application.
 1. As you work, remember to navigate to `/git` and **commit often as you work.**

<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
  <div class="container">
    <a class="navbar-brand" href="/">
      Nosh
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsible-nav-links" aria-controls="collapsible-nav-links" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

  <div class="collapse navbar-collapse" id="collapsible-nav-links">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Menu
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a href="/restaurants" class="dropdown-item">
              Diets
            </a>
            <a href="/restaurants" class="dropdown-item">
              Restaurants
            </a>
          </div>
        </li>
      </ul>
    </div> <!-- .navbar-collapse -->
  </div> <!-- .container -->
</nav>

<!-- old search>

 <div>
    <form action="/find_restaurant" method = "post">
      <div>
        <label for="diet_check">Select your dietary needs</label>
        <div>
          <%a=1%>
          <%Diet.pluck(:diet_name).each do |diet|%>
            <input id = "diet_check" type="checkbox" name="<%=#diet%>" <%=# "checked" if @diets.include?(diet) %> />
            <%=diet%>
            <%a=a+1%>
          <%end%>
        </div>
      </div>

      <button>
        Find restaurants
      </button>
    </form>
  </div>

  < old search -->

    <div>
    <form action="/restaurants">
      <button>
        Reset list
      </button>
    </form>
  </div>
