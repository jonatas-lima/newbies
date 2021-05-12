import sys
import os


def main():
    if len(sys.argv) < 2:
        print('passe o caminho para o diretorio')
        sys.exit(1)

    datafile = 'data.txt'
    directory = sys.argv[1]
    os.system('du -h {} > {}'.format(directory, datafile))

    with open(datafile, 'r') as f:
        lines = list(map(lambda x: x.replace(
            '\t', ' ').replace('\n', '').replace(',', '.'), f.readlines()))

        sizes = {"+10MB": [], "+200MB": [], "10-200MB": [], "-10MB": []}
        for line in lines:
            size = line.split()[0]
            if str(size).endswith('K'):
                sizes["-10MB"].append(line)
            elif str(size).endswith('M'):
                size = size[:len(size) - 1]
                if float(size) < 10:
                    sizes["-10MB"].append(line)
                elif 10 <= float(size) <= 200:
                    sizes["+10MB"].append(line)
                    sizes["10-200MB"].append(line)
                elif float(size) > 200:
                    sizes["+10MB"].append(line)
                    sizes["+200MB"].append(line)
            elif str(size).endswith('G'):
                sizes["+200MB"].append(line)

        print('Diretorios que nao excedem 10MB:')
        print_directories(sizes["-10MB"])
        print('\n')

        print('Diretorios que excedem 10MB:')
        print_directories(sizes["+10MB"])
        print('\n')

        print('Diretorios que excedem 200MB:')
        print_directories(sizes["+200MB"])
        print('\n')

        print('Diretorios que excedem 10MB e nao excedem 200MB:')
        print_directories(sizes["10-200MB"])
        print('\n')

        os.system('rm {}'.format(datafile))


def print_directories(directories):
    for d in directories:
        d = d.split()
        print('{}\t{}'.format(d[0], d[1]))


if __name__ == '__main__':
    main()
