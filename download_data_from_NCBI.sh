dowload data
https://www.ncbi.nlm.nih.gov/sra?term=SRP247443
# check the host name 
hostname
# check the disk usage 
df -ha|grep data5

#build a symbolic link from your home directory to a disk with enough space
#check the ncbi folder under my home directory 
mkdir /data/users/xzy50/ncbi
ln -s /data/users/xzy50/ncbi /home/xzy50/ncbi
### check the file type by using file commend, make sure the symbolic link is built
file ~/ncbi
# /home/xzy50/ncbi: symbolic link to `/data/users/xzy50/ncbi'


#using fastq-dump to download the SRR data
cd /data5/bigData/PRJNA605023/SRAfiles

/usr/local/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump -v SRR11031294
/usr/local/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump -v SRR11031293 
/usr/local/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump -v SRR11031292 
/usr/local/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump -v SRR11031291	

#SRR11031294 SRX7683561: GSM4298913: seedling_2; Arabidopsis thaliana; RNA-Seq
#SRR11031293 SRX7683560: GSM4298912: seedling_1; Arabidopsis thaliana; RNA-Seq
#SRR11031292 SRX7683559: GSM4298911: floral_buds_2; Arabidopsis thaliana; RNA-Seq
#SRR11031291 SRX7683558: GSM4298910: floral_buds_1; Arabidopsis thaliana; RNA-Seq


SRX7683559: GSM4298911: floral_buds_2; Arabidopsis thaliana; RNA-Seq
1 OXFORD_NANOPORE (MinION) run: 780,410 spots, 721.5M bases, 662.8Mb downloads

SRR11031291	
SRX7683558: GSM4298910: floral_buds_1; Arabidopsis thaliana; RNA-Seq
1 OXFORD_NANOPORE (MinION) run: 982,453 spots, 983M bases, 886.8Mb downloads

###  for pair-end files, have to use split argument to seperate the files
fastq-dump -I --split-files SRR390728
#Produces two fastq files (--split-files) containing ".1" and ".2" read suffices (-I) for paired-end data.
