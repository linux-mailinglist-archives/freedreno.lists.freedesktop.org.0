Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D1A9D0EF
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 21:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62B10E98C;
	Fri, 25 Apr 2025 19:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcEM6FEY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48610E98C
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:00:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwM5000440
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Kynr/LDxnO/0j5Svx4zTYeWD
 nbMxvk+4kjf7vw9ZD38=; b=EcEM6FEY80+DfBnp4YVx0uTH1I7C6OPuUN7ZxNBA
 1YT2X9/TsEMyD64lUtkGaWlM/+O9u8z9tH4LRi2J0YJGfl7LbDUOG6JWvagwzL4C
 5vbl6FBsYroOz37qdb4KEZl4QwXPKBEjdrJ5net3wxdGWIWgUl4WM5XYTeNd04kg
 za3H4oi//SMeeYVQMJAzSAHVQY7atWWUoZbNOD8bPRM3MMjbmrp6hZu/PO8SC8eq
 /+9Pus2z7vzqsiquXVVav9ry4EXLUpj8IbkAEdabFcerzs9/0AIhql7DC7MpQUcs
 AbaUB7v7LVjd4hx3Ybgmq01ywrB1ljPiCP/Z66la7/ItKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j0k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:00:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f184b916so61043996d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 12:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745607612; x=1746212412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kynr/LDxnO/0j5Svx4zTYeWDnbMxvk+4kjf7vw9ZD38=;
 b=u142GnR9201MFSU1ZuDhyjpV9yT37GxsaGXKB0G5+6DGQz/hXOK34B3Pe5hUaRr6uJ
 vMn6jgmpDzeG/jXUtXga6eBN1eMgNg1aXCIXX7nPeM2CQ2l+gMxjW8NEDBItnMVtcWgd
 QmYVsuC7FDnMJTlYZ3rQArnhdjQtY61068YiFUt8+0ISreQXtn+/xAJ+ejed62bG7Cge
 f2kFIXD8fQka4H3m13k+w6//d44yTJMDG/PjOBmJkKU5+gn5MrN6FtES5yrAJfIPEHUs
 +OZZEUgQ6ovEte9+k5D7+q33kfS1W3XOwO+AtB/5Lk6+1x+OKucR/bB3UODYw+2ZZBpx
 h6WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrbwxDf8OmptCcu43krv2flNs858oYqrNQpwbK0tgXktHxgDh/EqhPmyS7EDhnwRfsrKw3wERDxhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXePfLWeD9Y1lu6j/9hI4lVfYZYVDUIqTbuF7WXC5n14PiRiJq
 LZPBOTif9a9cF7BKTs+rDZDyaXU9m85JTaKZiufBqpVGHELzBb6wYzp88M2YCvG32v5d6VGPfB7
 +uQsa5+4PLd2vZKl8y2IXFHsgiCFGIf8DFXLLvmSOxSbo7y0B9DFmlJ7XzoLRfIxhC5U=
X-Gm-Gg: ASbGnctPtv8k7HTKD0PotUV8Y6KLb1cmJg/MwiwIL3RXS/EFkIASYE/QDqjWZdQRqju
 3vHO7C942LCJI/ye1tacZmyTehyR4E3KmN3vr8JcKZuBkUnirmYbRuL93sQTJZSiCIh40Y7uP/f
 L2YDxuILcjDHgLnms7m6Cd732NHBfRugtSmYzA1WrdX2zMlFv4qRZwxL6JBDd4q123ARGH9PmPV
 QWNo0uej3BS8vyLtkU8yCI9ip1OXBD2YYnPd3dJALq267opE8jMRbckqLI7yCZ8o9yZNsyVEtUe
 S9BHI5t2E+ol6vbdEOaZ5Z+fubWW1FdVmTRjJFTy4t8lFknLtrJNcNa5/Dl9EqrU5fgugu8ij0Q
 =
X-Received: by 2002:a05:6214:1d05:b0:6ed:1158:428b with SMTP id
 6a1803df08f44-6f4d1f90d04mr10767846d6.36.1745607608513; 
 Fri, 25 Apr 2025 12:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV/zQcAEoUhIcUkNwJorB5dQ/+HT+EzchzBf22nnLbvROjpmuT256JVRjN9I2KxR7k9bllog==
X-Received: by 2002:a05:6214:1d05:b0:6ed:1158:428b with SMTP id
 6a1803df08f44-6f4d1f90d04mr10760926d6.36.1745607604984; 
 Fri, 25 Apr 2025 12:00:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3a67csm694856e87.80.2025.04.25.12.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:00:04 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:00:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
Message-ID: <6kgxzonjqfmup7xvpddlk76w7zcnpf6c6x7isqy6plxk5los5z@hznswxtjoz4r>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-3-f1b5d101ae0b@linaro.org>
 <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
X-Proofpoint-ORIG-GUID: MAmfVgGWnfYfS05nlJC98i12dfXclMCY
X-Proofpoint-GUID: MAmfVgGWnfYfS05nlJC98i12dfXclMCY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfXxryn/+6WZk2F
 z3/DWaGVsMxIZBhth7B84PFQetWNZqyNDjHuKPtsS1wSot7k+wtavbtqGw/8haQ7yLmmBZwcpAx
 GnYCtifMGrOsrP50QTWGmbHsDkDtbuXoZCn5626wy4p2MamgSWzspgOxsIUsi0cJeY8+SUtoh8X
 nrP93V2s0bvAlQio6siiTuUtrNIF24B7E3iXiAqrQ1tboxbhk73i+Nq5WDwoQHMEEuF1mORwk5A
 w/Vz0L7M8EmEY28OF7ssOzgeiy8E9Gon1B4fpiXfdSmsZJ2737zUMD7xSqN7DLZKXUjQxvhIAId
 Tmejtw2A59zehSG4TwMbMbzRAOuC0ZoOrKqoN7XZk5HRMrJFQ2S7R21vxQUyUHw1vNegtZaujzO
 jxzsYW8f0LhLcESHpQwcRpNmhi5UIkQeiHGbJT1yPhgjsYJIVcPat4djJmr3ayjdGDqt8qpK
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bdbbd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=lXfSKzHXarEsLVuZBnEA:9
 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135
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

On Fri, Apr 25, 2025 at 11:34:18AM -0700, Jessica Zhang wrote:
> 
> 
> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > In order to support more versatile configuration of the display pipes on
> > SC8280XP, enable SmartDMA for this platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Hi Dmitry,
> 
> Seems like Abhinav's signed-off-by is missing for the patches that list him
> as author.
> 

Good point. I don't remember, why these patches mark him as an author,
but lack SoB. Googling doesn't point out any previous patches. I think
the easiest way to fix the issue would be for Abhinav to respond with
the SoB. Another option would be for me to reset the author.

> Thanks,
> 
> Jessica Zhang
> 
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > @@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	{
> >   		.name = "sspp_0", .id = SSPP_VIG0,
> >   		.base = 0x4000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 0,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_1", .id = SSPP_VIG1,
> >   		.base = 0x6000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 4,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_2", .id = SSPP_VIG2,
> >   		.base = 0x8000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 8,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_3", .id = SSPP_VIG3,
> >   		.base = 0xa000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 12,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_8", .id = SSPP_DMA0,
> >   		.base = 0x24000, .len = 0x2ac,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 1,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_9", .id = SSPP_DMA1,
> >   		.base = 0x26000, .len = 0x2ac,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 5,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_10", .id = SSPP_DMA2,
> >   		.base = 0x28000, .len = 0x2ac,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 9,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_11", .id = SSPP_DMA3,
> >   		.base = 0x2a000, .len = 0x2ac,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 13,
> >   		.type = SSPP_TYPE_DMA,
> > 
> 

-- 
With best wishes
Dmitry
