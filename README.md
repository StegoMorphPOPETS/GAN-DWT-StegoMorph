# GAN-DWT-StegoMorph

This is a novel approach to digital image steganography using image morphing. The algorithm GAN-DWT StegoMorph is a combination of a conventional approach to Haar DWT applied to morphed images generated through a CycleGAN implementation. Its goal is to bring improvements in regard to image steganography security and robustness.

The following files and folders are of significant importance to running the algorithm:

## CycleGAN.mlx
In this file, there is the CycleGAN implementation. It uses the 'train' variable, which can have the value true or false, to determine whether or not it is necessary to do the training of the network. Due to the size of the trained model, it is mandatory for a first use to also train the network. It is unfortunately a time lengthy process that can take several hours.

## DWT folder
In this folder we can find 3 files:
### dwt_encoding.m
This is the Haar DWT implementation file. Currently, it uses the inputs from the **samples** folder, as those images are the ones used in the report. The message, as well as the cover object, can be changed arbitrarily. In this file we also calculate the PSNR, MSE, SSIM, and the maximum embedding capacity of the resulting stego-image. The resulting stego-images are saved in the folder **stego_images**.
### compression_analysis.m
In this file we have the script used to calculate the PSNR of the stego-image after compressing it to various levels of quality percentage. The input of the script may be changed arbitrarily, as well as the quality level at which we compress the image. We have selected levels 90%, 70%, and 50%, but any level shall produce valid results. The compressed image is over-written every time we analyze a new image or we use a different compression level. However, if we would change the name of the generated compressed image so as to save all results, we would be able to find all of them in the **compressed** folder. However, due to not wanting to visually compare the compressed images we only have one image in the folder.
### histogram_analysis.m
In this file we generate the histograms and calculate certain statistical features as named in the report, so as to compare the statistical quality and resistance to attacks of the GAN-DWT StegoMorph resulting stego-images compared to DWT-applied only stego-images. It is always important to make sure that the two inputs, the stego-image and the cover image, are paired and correspond to one another.

## celeba folder
In this folder we have the fragments of the CelebA dataset used in this research work to train and generate morphed images. The names of the subfolders are quite self-explanatory as to what the purpose of the images contained is.
As such, there are two subfolders: **train** and **test**. Each of these has two more subfolders, **female** and **male**, denoting the two domains of facial images used in the project. 

## models folder
In this folder we find the trained model of the network after the training process, as well as the **generated** folder in which the generated morphed images are saved.
