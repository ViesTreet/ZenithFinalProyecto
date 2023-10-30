<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>

<!--Css-->
<link rel="stylesheet" href="/csspremiun/style.css">
<!--boxicons-->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
    <nav class="sidebar close">
         <header>
            <div class="image-text">
			<span class="image">
                   <a href="/dashboard"><img src="/imagesproyecto/logo.png" alt="logo"></a> 
                </span>

                <div class="text header-text">
                    <span class="name">Zenith</span>
                    <span class="profession">Bienvenido</span>
                </div>
            </div>
            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">


            <div class="menu">
                        <li class="search-box">                  
                                <i class='bx bx-search-alt-2 icon' ></i>
                                <input type="search" placeholder="Search">
                        </li>


                    <ul class="menu-links">
                        <li class="nav-link">
                            <a href="/dashboard">
                                <i class='bx bx-home-alt icon' ></i>
                                <span class="text nav-text">Dashboard</span>
                            </a>
                        </li>
                    </ul>
                    <li class="nav-link">
                        <a href="/proyectos">
                            <i class='bx bxs-folder icon' ></i>
                            <span class="text nav-text">Proyects</span>
                        </a>
                    </li>
                 
                    </li>
                    <li class="nav-link">
                        <a href="/premiun">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">Premiun</span>
                        </a>
                    </li>
            
            </div>

            <div class="bottom-content">
                <li class="nav-link">
                    <a href="#">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>

                <li class="mode">
                <div class="moon-sun">
                    <i class='bx bx-moon icon moon' ></i>
                    <i class='bx bx-sun icon sun' ></i>
                </div>
                <span class="mode-text text">Dark mode</span>

                <div class="toggle-switch">
                    <span class="switch"></span>
                </div>
                </li>
            </div>
        </div>
    </nav>
  
        <section class="home">
            <div class="pricing-table">
                <div class="details">
                    <h2>Elige el paquete zenith que desees</h2>
                    <p>Estos son los planes que tenemos para ti</p>
                </div>
                <div class="grid">


                    <div class="box basic">
                        <div class="title">basic</div>
                        <div class="price">
                            <b>$24.99</b>
                            <span>per month</span>
                        </div>
                        <div class="features">
                            <div>1 CPU</div>
                            <div>500 gb STORAGE</div>
                            <div>2 Users Allowed</div>
                            <div>Sends up to 2 GB</div>
                        </div>
                        <div class="button">
                            <button>Learn More</button>
                        </div>
                    </div>


                    <div class="box professional">
                        <div class="title">Professional</div>
                        <div class="price">
                            <b>$49.99</b>
                            <span>per month</span>
                        </div>
                        <div class="features">
                            <div>1 CPU</div>
                            <div>500 gb STORAGE</div>
                            <div>2 Users Allowed</div>
                            <div>Sends up to 2 GB</div>
                        </div>
                        <div class="button">
                            <button>Learn More</button>
                        </div>
                    </div>

                    <div class="box ninja">
                        <div class="title">Ninja</div>
                        <div class="price">
                            <b>$99.99</b>
                            <span>per month</span>
                        </div>
                        <div class="features">
                            <div>1 CPU</div>
                            <div>500 gb STORAGE</div>
                            <div>2 Users Allowed</div>
                            <div>Sends up to 2 GB</div>
                        </div>
                        <div class="button">
                            <button>Learn More</button>
                        </div>
                    </div>


                </div>
            </div>


        </section>

    <script src="/jsproyecto/script.js"></script>
</body>
</html>