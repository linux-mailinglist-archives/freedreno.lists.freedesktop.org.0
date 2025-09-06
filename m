Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB62B477ED
	for <lists+freedreno@lfdr.de>; Sun,  7 Sep 2025 00:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4C10E17B;
	Sat,  6 Sep 2025 22:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kW0gRatQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70C510E17B
 for <freedreno@lists.freedesktop.org>; Sat,  6 Sep 2025 22:05:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586Lbe4X023460
 for <freedreno@lists.freedesktop.org>; Sat, 6 Sep 2025 22:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=1/PCmJJWhMUmpNwL0kEscnsVt/EoNeL+XScU5aYT66k=; b=kW
 0gRatQAnw+hysDlLi43K0eBvYY5vC5Rtx9pMkoKoWugwHgq3NoesZRyvZIzG3gPb
 4U596JJo8eqsLMQ6yzf+d7Eg+Jx0sSMSdfrp0d1SeLnLyoHI5vKLqtcLJwFHBRXI
 P1d1U2vz/jK3/oPIukQT0mM3eBBhNrubbua/OwqRNV3EH34LvX28PJW96PSK5w1/
 ceIrTlxIxwg8/+Q/ue4wTNkegb5fWxJS5uPrqabrrNgSIAkgUq1s6m7SJ0TRb3jD
 WtzhLFNfzpCpdat/LENZx4iC8LtMpQ7wd06ecZONHnV0HZnWKH/R7fEdzJPQzDzc
 g2nu3t2amHi2zgxUK7cQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0h96q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 22:05:37 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-31597cdcd3bso1220072fac.2
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 15:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757196337; x=1757801137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1/PCmJJWhMUmpNwL0kEscnsVt/EoNeL+XScU5aYT66k=;
 b=b6CJ18hZVSEWazNqxV5pkOtrPBVP3Dqrtiz90+R1PmiaSojZ+W1YFeXPtt0TJjODrV
 svjEI1WIKqEkmcFyxaodXZYUxnu/sOoZuIvNIt4ydFsYF4Cq+sgIRxa+DBo4Y5BPJXmq
 Cym6YVv/Mx8kg7HlqfZyfGajJH5FcoUbo1ekdPAEVIgZ5c3guv726jo2WnnUIzK1bOVN
 LMXHzaOoVjUPwZE7wgcQJFbxu3l8vPP1NjsZYd234FfZBlceGqMjkm0Pj3gFZ9SeiGFL
 pn4q4QGVEFtx5dDnaSLOgsusbir0EcE51bClnoT4OXUgd+1DzvQ7Gq0zjNVZRE1adFqw
 7mYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpEiWKsIJEf3x90DfkSAqHc1pA/EtqdzXSCUeyDX23kEEKERC/iWzhqVzXloVbTw9Ye7o9s18M8m4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS9sdzNrqZ6fltYYde29S3AUVC3cWxNrxWZEOqrVIHNQT06dVC
 yxyXKmtlzbXlG5bzL8/+X6OroJImcCqb3wdB8hkOpjOWxZTv+LPPmMQ6RHuLWjkYSF2PduKBCrp
 6PMRGSw2zpIhGRKjpcnqkyqJGKRhthGZB7XjOBMfgu9j0SpEs/ke5fnMCUA1qPSB8YYE4eZyNYG
 HM29KrwyzaadZl3Nsus2AMgmyn9TakidHr19fNXpD9ooPbEQ==
X-Gm-Gg: ASbGncsiSC8y34fC3FT7b+KuirS8slLpJsGT45lU0GnGQkfF9KB6jlTX5Zcw3XL1RKy
 DeBGqsIWEq4MZ9IsnSYYJ9Of9YJGt6mDAnuTz+FiTSdPf0X86XkfbN1wBaEcVbnIYaxH9uw7RGg
 ZhqhEyRP0trn0M18xeLhuf16O1B/jAd5mI8PlJHiE/b6kUUur+vjAr
X-Received: by 2002:a05:6871:d3c2:b0:321:2772:dc1 with SMTP id
 586e51a60fabf-32262a68588mr1237563fac.9.1757196336626; 
 Sat, 06 Sep 2025 15:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWMtv3HLa4C5OnUjRIQpatVYtxNuxdgaMlVWrIMD7IQL2Dl+xRzcOBRy47dB0ODF3YQXR3eDuSqaKJhPR5OMA=
X-Received: by 2002:a05:6871:d3c2:b0:321:2772:dc1 with SMTP id
 586e51a60fabf-32262a68588mr1237553fac.9.1757196336218; Sat, 06 Sep 2025
 15:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
 <wbuvnhcxh4flicbgipuql2otwv7oqkol2pmdyvschpudshejy4@euajhp2sgnyq>
In-Reply-To: <wbuvnhcxh4flicbgipuql2otwv7oqkol2pmdyvschpudshejy4@euajhp2sgnyq>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 6 Sep 2025 15:05:25 -0700
X-Gm-Features: Ac12FXzoeNcl08d0t96E15SNDUE2_YRICbqiF8-49-FMLSx8fhvFR-OuUPBSy8w
Message-ID: <CACSVV035P-xBFd7=MjCSKoyfp79_ztEoBEEaDc9HYPtZgVQAbw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Sync GPU registers from mesa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: PvmoaunD0rkPyNEk3BvPtJzomJLSHQ5I
X-Proofpoint-GUID: PvmoaunD0rkPyNEk3BvPtJzomJLSHQ5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX7zR6Kloec7OQ
 c5kwQMLsPq6hSYPTrplWh1PaJaVEv42WJSGQaPHgg27bZ+UHD27QLl80jIqnpQH2231P4iF1Cv4
 BoOAZwbyvdrXRQHk9LBe8WWiWEelv3JsfjLWQDIP7hWNw2R3xP6X3mWnOeF6OGoJ0N7mY8wcjcT
 oPvsy4YTyIZiTr1J2IqA+vxKWNMUPyzXu8ztx1aON4hcnfNBaAWN/9PDzo3qIKTAGMBOHcrAdi9
 zzK3NOAob+IxPZvLeW2ues0POt2N7MEyy0hejEEKZ7HWAjFe5gLCdhAHLZc5VYbWRl+8I6LbAkr
 czaONvXWOajO2RaWxIs2nBsEULTOaaekWIeUpkFT1BHK8fF5yc3soggq6WMIT97lN3Zu9ROwuYY
 noasu26M
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bcb031 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=V2sgnzSHAAAA:8 a=xoiZakKlt4UH7s2WbAAA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Sep 6, 2025 at 11:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Sep 06, 2025 at 10:05:40AM -0700, Rob Clark wrote:
> > In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> > fix a7xx GPU snapshot.
> >
> > Sync from mesa commit 76fece61c6ff ("freedreno/registers: Add A7XX_CX_D=
BGC")
> >
> > Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  19 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   5 +-
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
> >  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
> >  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
> >  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
> >  7 files changed, 524 insertions(+), 497 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 2e2090f52e26..3f5c4bcf32cc 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -247,8 +247,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6x=
x_gpu,
> >        * Needed for preemption
> >        */
> >       OUT_PKT7(ring, CP_MEM_WRITE, 5);
> > -     OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> > -     OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> > +     OUT_RING(ring, lower_32_bits(memptr));
> > +     OUT_RING(ring, upper_32_bits(memptr));
>
> Could you please comment, why are we droping all these accessors?

We redefined these addresses as reg64 so there is no longer HI/LO
regs.. which works better for the c++ builders in userspace but means
these accessors no longer are generated.

I suppose we could perhaps make gen_header.py generate legacy hi/lo
regs from the reg64 for the "legacy" C builders..

BR,
-R

>
> >       OUT_RING(ring, lower_32_bits(ttbr));
> >       OUT_RING(ring, upper_32_bits(ttbr));
> >       OUT_RING(ring, ctx->seqno);
> > @@ -278,9 +278,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6x=
x_gpu,
> >                */
> >               OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
> >               OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
> > -             OUT_RING(ring, CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> > -                             REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
> > -             OUT_RING(ring, CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0));
> > +             OUT_RING(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> > +             OUT_RING(ring, 0);
> >               OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
> >               OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
> >               OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
> > @@ -1320,14 +1319,14 @@ static int hw_init(struct msm_gpu *gpu)
> >
> >       /* Set weights for bicubic filtering */
> >       if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gp=
u)) {
> > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0)=
;
> > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> >                       0x3fe05ff4);
> > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> >                       0x3fa0ebee);
> > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> >                       0x3f5193ed);
> > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> >                       0x3f0243f0);
> >       }
> >
>
> --
> With best wishes
> Dmitry
