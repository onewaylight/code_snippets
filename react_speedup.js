import { Routes, Route, Outlet, Link } from "react-router-dom"
import Home from "./components/Home"
import Store from "./components/Store"
import { About } from "./components/About"
import React, { Component, lazy, Suspense } from "React"


const Home = lazy(() => wait(1000).then(() => import ("./components/Home")))
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
        <Route path="/store" element={<Store />} />
        <Route path="/about" element={<About />} />
      </Route>
    </Routes>
  )
}