#!~/miniconda3/bin/python
import sys
from collections import OrderedDict
import re
def count_fastq_atcgn(file_path, buff_sise=1024*1024):
    bases = ['A','T','C','G','N']
    ATCG_analysis = OrderedDict()
    with open(file_path,'r') as f:
        line1 = f.readline().upper()
        chr_i = re.split('\s',line1)[0][1:]
        ATCG_analysis[chr_i] = OrderedDict()
        print(chr_i)
        for base in bases:
            ATCG_analysis[chr_i][base] = 0
        while True:
            chunk = f.read(buff_sise).upper()
            if '>' in chunk:
                chrosome = re.split('>',chunk)
                if chrosome[0]:
                    for base in bases:
                        ATCG_analysis[chr_i][base] += chrosome[0].count(base)
                for i in chrosome[1:]:
                    if i:
                        #chr_i = re.split('\s', i[0:i.index('\n')])[0]
                        chr_i = i[:i.index('\n')]# get chromosome id
                        print(chr_i)
                        str_i = i[i.index('\n'):]
                        ATCG_analysis[chr_i] = OrderedDict()
                        for base in bases:
                            ATCG_analysis[chr_i][base] = str_i.count(base)
            
            else:
                    for base in bases:
                        ATCG_analysis[chr_i][base] += chunk.count(base)
            if not chunk:
                f.close()
                break
    return ATCG_analysis

def atcgn_to_csv(atcgn_analysis,save_path):
    save_path = save_path+"count.csv"
    with open(save_path,'w+') as f :
        header = "{:^21s}\t{:^8s}\t{:^8s}\t{:^8s}\t{:^8s}\t{:^8s}\t{:^8s}\t{:^8s}\t{:^8s}\t{:^8s}".format("ID","Length","GC","N","GC_ratio","N_ratio","A","T","C","G")
        f.write(header+'\n') 
        for chr_id,atcgn_count in atcgn_analysis.items():
            GC = atcgn_count['G']+atcgn_count['C']
            N = atcgn_count['N']
            Length = sum(atcgn_count.values())
            GC_ratio = GC*1.0/Length
            N_ratio = N*1.0/Length
            content= "{:^21s}\t{:^8d}\t{:^8d}\t{:^8d}\t{:^8.3f}\t{:^8.3f}\t{:^8d}\t{:^8d}\t{:^8d}\t{:^8d}".format(chr_id,Length,GC,N,GC_ratio,N_ratio,atcgn_count['A'],atcgn_count['T'],atcgn_count['C'],atcgn_count['G'])
            f.write(content+'\n')
    return save_path

if sys.argv:
    file_path = sys.argv[1].strip()
    res = count_fastq_atcgn(file_path)
    save_path = atcgn_to_csv(res,sys.argv[2].strip())
    print(save_path)
