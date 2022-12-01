```ts

interface FactorStructure {
    id: number,
    factor: string,
    name: string,
    code: string
}

const [factorLists, setFactorLists] = useState<FactorStructure[]>([]);
const [factorList, setFactorList] = useState<FactorStructure>(null);

//...

setFactorList({ ...factorList, name: 'hi' });
setFactorList({ ...factorList, code: 'C123' });

setFactorLists(factorLists => [...factorLists, factorList]);

//...

handleChange = ( event: React.ChangeEvent<HTMLInputElement>) => {

    setFactorList({
        ...factorList,
        [event.target.name]: event.target.value 
    });
}