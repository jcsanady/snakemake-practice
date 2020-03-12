rule three:
    input: "data/one.txt", "data/two.txt"
    output: "data/three.txt"
    run:
        val = 0
        for f in input:
            val = val + int(open(f, "r").readline())

        with open(output[0], "w") as out:
            out.write(str(val))

rule two:
    input: "data/zero.txt"
    output: "data/two.txt"
    run:
        for f in input:
            val = int(open(f, "r").readline()) + 2

        with open(output[0], "w") as out:
            out.write(str(val))
rule one:
    input: "data/zero.txt"
    output: "data/one.txt"
    run:
        for f in input:
            val = int(open(f, "r").readline()) + 1

        with open(output[0], "w") as out:
            out.write(str(val))

rule zero:
  output: "data/zero.txt"
  shell: "echo 0 > {output}"
