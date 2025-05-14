Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9DAB75D8
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA5810E07F;
	Wed, 14 May 2025 19:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCUubKSw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472A110E07F
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:25:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvn5030360
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=guHnDjTo7eaE/yughOao688D
 Svp7ZoZj4rGyk6Vz4vg=; b=BCUubKSwIOu6HQnrADk5Mgq6zf5I997Ecg93/dmd
 xd1QBGAMiLWOXQ1bqg/HCb24sbvcH+e9XL7EU38I7WpU4Nir5OBKVfE4pOi3fY6d
 du7y5imUF/1Q/Q25GZt3Qr4hWnb9idQAu+vUT51+yoryQ8QAPxd8p4qX6iLnLNnI
 BbVc9HIiTqReQ/R0PfLN+0D8f8VSdfG579608VqC9EWvsUMFfQ2Qp/muTlahieWg
 nAoIbPnEGB5puSTqSF9xeiVrBQbuPUGVNUJ+nvyNBvhkpgKAlAfRtYub1ZS2T5Bi
 dGlKA20ShaX/St5TEZyci0yr4FyBD5YWDGITJdQA44ACdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuv3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:25:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c793d573b2so16296885a.1
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250722; x=1747855522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=guHnDjTo7eaE/yughOao688DSvp7ZoZj4rGyk6Vz4vg=;
 b=XbdRQyN3mt80s0+jR03pjsW8uTE+GVCxrQXlnS/lTj3UBmzpOxUF+9tMUrLUVtrGVU
 vHEMf+PcNuD0QBIq6bUuByjafHJxU0EWhvcT5fVp7XfZGYW8FJtrbx1YFmAh9sV5ERXe
 DGcAs6b914l5oH5vbN6Xx7dJ/U5qA+1dHRDXRi7RH4uA7oy4bzSiOFbqfHtytze2MieC
 i/c4Ro/F6Pjx7HDlCT/9xAldcivJIhCgVj/hUoBKdQJ+9wosj7BrQkAiSrQvnrUGv/08
 Ayb7b4JCSq4OtPFNQKr+nZL8oMkRAzXcmx0l+Jik9iTSh2LFlUWcuI5ukRFqXVFvwMjz
 mBaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8hqiXL3DRXuE1MUlnzZx6vgJgGvyXK2hGBlt+OnAPHSYURkBlMOk4ura3zK52wYY8IRgfcJXicN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRcb1im2mMG9VeMEiit1ahjMFKAMQiYyLOSxWdzP7V0AxNbvQ5
 EhzvG+7LwuNbcODI/PB8fQk48WzL9qh0yh4OPCYfHYkgMUnJ4YXbb/8op/sic0OPpCmicdEHKZo
 HIzhndNmfQJeMOdXfP/IXr/TGEzWTmXV/2t6k52VmmhDsrfG8tRWQPPV41JpT9JCgUzQ=
X-Gm-Gg: ASbGncuMJScg8arAA+wsAQ0GVAfTnPilsfHt27EbXuVHSjF8AfkOGYrUcq9i4P/6b0b
 kCTykZsRVK9sbMqeu/7+fQxBQJxHkmpWSG/9gvufhOZafehHRkNEfVhvdjvE/gvFdaQcoxl6cPj
 5qZ8ACPJd2KqJPidliH9INDS9duO2UyDpowAB/WiRKA6Ebd5Bg1Jb98UTdpALuYKgvwF46Xar3f
 BUPVJhZS9ySLQzn3ZETxK5XpU7zs0/56Ak7+16as12ntcvvbVS7Xi0HLVai9Kejr3neUUtJjqVT
 /jUuD02dWkyQYd63YD9jYM/ABvHTp81n/ekHHsSVSA0JUNPJjxr7n4M0izky8bl7ZigP2CdJF8U
 =
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7cd287defa6mr638171585a.8.1747250722287; 
 Wed, 14 May 2025 12:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYspBX7D3lylLVnQVlBe+b6tLYtEGKb07awj3O663BvMry8yeZxkF53c9zpzvl/w4Clu/Ag==
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7cd287defa6mr638167385a.8.1747250721720; 
 Wed, 14 May 2025 12:25:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2333073e87.211.2025.05.14.12.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:25:19 -0700 (PDT)
Date: Wed, 14 May 2025 22:25:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC RFT v2 15/15] drm/msm/a6xx: Warn if the
 highest_bank_bit value is overwritten
Message-ID: <wb46vfuegw2d4mj6pqx6o5my7ii4fhkrzrgte4hvey5ywiszpt@oe3qsptmanuu>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eHdgxIB39qR3O_L7HtCudFxgQ9wuh7xD
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824ee23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hUL5GJU7K_37AAI6negA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfXxx9Kr/18+2QR
 +q5nsrwHfF3/BARYLUSk5Rn65eN0R/3vu1FAUs9nFIPytSZ6BrvaeCjL6PixnycMXq867fE3nPy
 +3cS9RDi1h/vgu9vFWtuqEx6n9Jae8dY+qKGdj+aFgN/uDocXX7+fNdJlSvuYoN/1vTq1zpkeNa
 qInCsqYSX1N0kW3lzhUcrEFD04lhwLhvzzjPGSsvV7a/bm9ij1mCu7OS3qssfoUpLiJxfUj+LnW
 mDjwAzKUoeteue2X9BcJHXn/vTjKP3svBnsrTp07b3JsBe4cPPFOWKq+zBJ+e4PLhri0SVxXGGQ
 KcmvvtLtNl3SoWCeMxPSrFUNf4RiXDilRTw5lVR7yfx+Zzn1CFuH6wZKytkuW900qhwIdDKhys9
 iDmWwfPEj3EOwDKlGXDVZgMBW/7jskHkN5LrUqOBHsv0cDC+KjDUXQXJdPGa8sVyLEUR13sM
X-Proofpoint-GUID: eHdgxIB39qR3O_L7HtCudFxgQ9wuh7xD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=989 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140177
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, May 14, 2025 at 05:10:35PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation to resolve the issue of hardcoding HBB, throw a warning
> if the value is being overwritten in the GPU driver.
> 
> The HBB value is directly correlated with the memory configuration.
> On platforms where more than one is supported, the value must differ
> for proper functioning of the hardware, but it also must be consistent
> across all UBWC producers/consumers.
> 
> On platforms supporting only a single DRAM setup, the value may still
> be wrong, or at least inconsistent.
> 
> Print a warning to help catch such cases, until we declare full trust
> to the central database.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index eaf468b67f97ff153e92a73a45581228fcf75e46..ab812338739568d5908ca439e5c53e230a02de5d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -637,6 +637,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (adreno_is_a702(gpu))
>  		cfg->highest_bank_bit = 14;
>  
> +	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
> +		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
> +			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
> +

This really should come in an earlier patch...

>  	gpu->ubwc_config = &gpu->_ubwc_config;
>  
>  	return 0;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
