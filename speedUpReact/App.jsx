import { Routes, Route, Outlet, Link } from "react-router-dom"
import { About } from ""./components/About"
import React from "react"
import React, { Component, lazy, Suspense } from "React"


const Home = lazy(() => wait(1000).then(() => import ("./components/Home")));
const Store = lazy(() => wait(1000).then(() => import ("./components/Store")))
const About = lazy(() => 
  import ("./components/About").then(module => {
    return { default: module.About }
  })
)
function App() {
  return (
    <Routes>
      <Route path="/" element={<NavWrapper />}>
        <Route path="/" element={<Home />} />
        <Route path="/stoure" element={<Store />} />
        <Route path="/about" element={<About />} />
      </Route>
    </Routes>
  )
}

function NavWrapper() {
  return (
    <>
      <nav style={{ display: "flex", gap: "1rem" }}>
        <Link to="/">Home</Link>
        <Link to="/store">Store</Link>
        <Link to="/About">About</Link>
      </nav>
      <Suspense fallback={<h2>Loading...</h2>}>
        <Outlet />
      </Suspense>
    </>
  )
}

function wait(time) {
  return new Promise(resolve => {
    setTimeout(resolve, time);
  })
}

export default App;