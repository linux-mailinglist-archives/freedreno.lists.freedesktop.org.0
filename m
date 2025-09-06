Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC49B47681
	for <lists+freedreno@lfdr.de>; Sat,  6 Sep 2025 20:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04A10E166;
	Sat,  6 Sep 2025 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHrzSljn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D68C10E03C
 for <freedreno@lists.freedesktop.org>; Sat,  6 Sep 2025 18:56:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586EQkaF018028
 for <freedreno@lists.freedesktop.org>; Sat, 6 Sep 2025 18:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZBadVXj3Q8VcKxqT6ZVVuFSs
 Ahvpg9kD+kwZrFZMdNI=; b=bHrzSljnjF72+ruJYJwyQHL3pG4UX3ioW9g4EbaJ
 /2VZZ3jQZPZ5PbAlOrObCT0b7stJhli43PRwUSobQAjnyib2Wrb1QH3i46AeS6DY
 yKCjLFt6Sf8qVtCvuMcaZCsq6VoDAVPL99hKtIlK3KbseuJi1iLGNVNZoSp2/V6e
 qTbdI03SxLVLNe0uPb2tDWjY+n7fS63isjIKfHWRmcEjWJNP3c9BT/H/rhK6uI0h
 8WxL++bQoHFZRY42yhNS29LeDzlR9hieu0hcu7uhSF4Kx/lB9Osb1DBuBLi8kHbF
 +fEshDCYnG6DO+TxKkN6j77LbpMjhCgdq9iTgwOhsfHqTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws151v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 18:56:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f91cdf14so34555251cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 11:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757184958; x=1757789758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBadVXj3Q8VcKxqT6ZVVuFSsAhvpg9kD+kwZrFZMdNI=;
 b=CagzIyfM5HYpq1niC+wTH+NssLA54OM924/9VF/x6eDFjD/tn0qgWdtPNr86eovwBb
 VxSS6QzEHnU2FVld6IZjOZYwBvdp5XrSpQpEJyPy7DHAK5mj46Kyk9RSlM8Iy+YZ/Y4t
 ljKbwfa8VlSL3/zPQ8jj6YT3QY32cZ3SkldLFnjI5ru/sY97rcGslVx0aE+iIpThp0nB
 JkouIHnMVn5C5Q1UkiY+/SGdDbI7bXCn0ZdrlJyO18yT3Wqt9rWqiSCvNB6w30MA/LJJ
 TZD7QsdNAdfU9SjF+uk8uDpwzi9TpUBKFNI2O1ApT8SVDWD4KwgmX+wzl8zHjz5jMWpi
 uM8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcU7zVxzwd+o0kS9aORdtQFjYfcHBAxuD/y0cxUynR/CkpRMq/PAwzptO1J0ezZiF6h11ylHhutbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7+BjoWgreqmvBUWyGGUbITKRtqKTg3anvO5/MUiuCgz0XQY3U
 Auaoxmp7r1h2KpRB0vMjYc1kfsocZfXKhUKNjgkfb/g5ZDceZwctNJ893L4r2vmnwyNEUgUoDn/
 pgigWmYUkzBCpcNEoDVBu2mPOGahsD4uRt6656KiX3LvncxtNpgEKICs7VITQdPfh4piQLrvrKB
 dnkRo=
X-Gm-Gg: ASbGncvjEyhJp/cmfx1YHlupCWtqpfhnErJKmPIzdTPcygsFoYhrKWvYobDRUhfpDPq
 rykGpH1Q/JXO6Za4ly4d/6J5PtzSQlEcbQ8+9RgOVfAo3Irc1l1kuR2dD33albFUrCdOYj7bQwP
 uLmNw5WHs5oQskPSmo2V27PNbX10JmYGd27t40BE38vODSEFMA6GHTW4IAs9icfmxlztRktsDY8
 OjKVLOrUO1cNyFpnqpBicRnTMd+GSusslK23f9+aeu+BjqLO1pXGZJjZJKKyQhJkZt8ukVfJSAb
 lSG26XciHA4SG/Xrf++D5u3k50ohgHL5ed8ji/+ML/tIOYfpTARUSv3RNZkhZIBTrJzVC6TblNw
 Q2nOjJSfTygIrUG3EH1Iyiw/w6MDhkNgMwkYAfHblaDeNff9yfVY5
X-Received: by 2002:ac8:5d91:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4b5f8467913mr33200341cf.64.1757184958523; 
 Sat, 06 Sep 2025 11:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0q6LYwp7XVK/CoJjAl4rMPEW6+vPupVUdTnPMLr7cWeFfZ0htils1UjwNfk68K1j5RCHU/g==
X-Received: by 2002:ac8:5d91:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4b5f8467913mr33200141cf.64.1757184958027; 
 Sat, 06 Sep 2025 11:55:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfbfa8sm2534700e87.96.2025.09.06.11.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 11:55:57 -0700 (PDT)
Date: Sat, 6 Sep 2025 21:55:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Sync GPU registers from mesa
Message-ID: <wbuvnhcxh4flicbgipuql2otwv7oqkol2pmdyvschpudshejy4@euajhp2sgnyq>
References: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hl5ldHdqgM9jeP0qQx3m5koeTR_8-yRn
X-Proofpoint-GUID: hl5ldHdqgM9jeP0qQx3m5koeTR_8-yRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXyHQKtRikewD6
 kN4xqW0xXGG+lQQO+ryItkFIEny27bKvuMin1dyfla+zFOyfGHeqmjo8cz4vBbl4KIpsPvXySCa
 EYF6Wl1xJvo7LHPnCOuu1n7ifB4OJ/YrJXGcjZDOyXqZ5xb5YpmJTTSUu9c08ttm8438r2iVjq4
 XC8h+WH4tZGS+i2OZ7x0SJGUrbyOuXfUTVQnqwrMUCARn/wvnsPfah0ghVxtgrknOW8sZ93KO/j
 csBufjX/lStQQuFI6eRroTw+X38SWMtt5MGgo/JSdj0sgpAjFr/21OUKrJZOk7m0DCHk+btzync
 HzeU/h7gJ5CCb+j5LTQILNG87HB9aQ82WaieNDqsEi5kVT3Ye/Jze3IKV8RGPrxwfLp7duGthrJ
 iNvU2DtP
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bc83c0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=PNsBLs71VRkgtwFNylsA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Sat, Sep 06, 2025 at 10:05:40AM -0700, Rob Clark wrote:
> In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> fix a7xx GPU snapshot.
> 
> Sync from mesa commit 76fece61c6ff ("freedreno/registers: Add A7XX_CX_DBGC")
> 
> Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  19 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   5 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
>  7 files changed, 524 insertions(+), 497 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2e2090f52e26..3f5c4bcf32cc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -247,8 +247,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  	 * Needed for preemption
>  	 */
>  	OUT_PKT7(ring, CP_MEM_WRITE, 5);
> -	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> -	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> +	OUT_RING(ring, lower_32_bits(memptr));
> +	OUT_RING(ring, upper_32_bits(memptr));

Could you please comment, why are we droping all these accessors?

>  	OUT_RING(ring, lower_32_bits(ttbr));
>  	OUT_RING(ring, upper_32_bits(ttbr));
>  	OUT_RING(ring, ctx->seqno);
> @@ -278,9 +278,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		 */
>  		OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
>  		OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
> -		OUT_RING(ring, CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> -				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
> -		OUT_RING(ring, CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0));
> +		OUT_RING(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> +		OUT_RING(ring, 0);
>  		OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
>  		OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
>  		OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
> @@ -1320,14 +1319,14 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	/* Set weights for bicubic filtering */
>  	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
>  			0x3fe05ff4);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
>  			0x3fa0ebee);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
>  			0x3f5193ed);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
>  			0x3f0243f0);
>  	}
>  

-- 
With best wishes
Dmitry
