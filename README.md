# Verifying a Multiprocessor Hypervisor on Arm Relaxed Memory Hardware

## Coq installation

We use `opam` to install Coq and other dependencies. To install `opam`:
  - Ubuntu:
  ```
  sudo apt install opam
  ```
  - Mac OS X:
  ```
  brew install opam
  ```

Then, initialize `opam` with the specific version `4.02.0`:
  ```
  opam init --compiler 4.02.0
  ```
If your `opam` has a different version, switch to `4.02.0`:
  ```
  opam switch --create 4.02.0
  ```
Then, use `opam` to install `coq 8.4.6` and `menhir 20151112`
```
opam install coq.8.4.6 menhir.20151112
```
Make sure `coqc` is in your system `PATH`, or add it manually:
```
export PATH="path/to/.opam/4.02.0/bin":$PATH
```
`.opam/` is usually in your home folder.

## Compile SeKVM artifact

In the root folder of this repo, simply run
```
make -j6
```
to check all the coq proof. Use a smaller process number if the compilation runs out of memory. The compilation may take a few hours.

The proofs are organized as below:
```
root/
    theorem2/  --- Theorem 2: when the kernel runs in isolation
    theorem4/  --- Theorem 4: when the kernel runs with user codes
    sekvm/
        wDRF/         --- Proofs that SeKVM satisfies the wDRF conditions
        Security/     --- Security proof of SeKVM
        {PTAlloc,PTWalk,...}/      --- Security-preserving layers
    certikos/  --- CertiKOS proof framework (pre-compiled binary)
```