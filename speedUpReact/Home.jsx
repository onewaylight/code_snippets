import { lazy, Suspense, useState, useTransition } from "react";
import { lazyLoad } from "./lazyLoad";

const AdminData = lazy(() =>
  wait(1000).then(() =>
    import("./AdminData").then(module => {
      return { default: module.AdminData }
    })
  )
)

const AdminData = lazyLoad("./components/AdminData", "AdminData");

export default function Home() {
  const [isAdmin, setIsAdmin] = useState(false);

  const {isPending, startTransition} = useTransition();

  return (
    <>
      <h1>Home</h1>
      <button 
        onClick={() => {
          import("../sum.js").then(module => {
            alert(module.sum(2, 2))
          })
      }}>Add 2 + 2</button>
      <br />
      <br />
      <button 
        onClick={() => {
          startTransition(() => {
            setIsAdmin(prev => !prev);
          })
        }}
      >
        Toggle Admin
      </button>
      {isPending && "Loading"}
      <Suspense fallback={<h2>Loading...</h2>}>
      { isAdmin ? <AdminData /> : <h2>Not Admin</h2>}
      </Suspense>
    </>
  )
}