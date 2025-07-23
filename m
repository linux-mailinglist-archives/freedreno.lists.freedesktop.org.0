Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B2B0F0EB
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 13:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0083110E33D;
	Wed, 23 Jul 2025 11:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJdXaofc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0C310E33D
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:11:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9dPos015739
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j0VjeMPx+hhfBKfjETGJRw+SMh95RYSVHKRWrlXnn5U=; b=UJdXaofcZgDwAeKu
 407OxHvK8Hn4sEdJ/xm62+w+A/vqZJjj7WeKbRoDIKYBpH6yrBJ79INmCWRN/80H
 ZQiKvYfq7RnY9QSNnZpOSflOEXo85aHY/SxxUFxIIhsbUHhs8MOumIhNgU8JWR9h
 1K6fjbW9z4jH3vmktzwu61nA0KuCMCb+HxDbySZm4BcMVFWi04/zmBv0IDmKYY3z
 Nlrr1Zolhc610X7RjsFzLV+N7ph+fU4cQGUCai/dvfVeHiTJTi/ax9A3mMWH8Cd4
 bFU3MtqYgZPIxTDfJRI9pVGmpl71uwXOjBMiyxyQky6B/go1jjYinFO4R7eNdgTq
 FGgpXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vb8xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:11:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70708748fbaso3766106d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 04:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753269116; x=1753873916;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j0VjeMPx+hhfBKfjETGJRw+SMh95RYSVHKRWrlXnn5U=;
 b=uaQ2uyxbDLnHDHNR5NO9CB//7myHlPOusxjKrdzJVfHw9fuD9FlGl/gks+/1kRg+mH
 qcfnNYFNoYVBk6Y7ihcnZXqtkaFZCYx0ZDR6NSvwTucxddOkI9xLeWexNGRb/7uuLtYX
 UQQMKB2FPi8mypsmvPSXW7FvgCm0nlgA6AEO5MmRJ2cms+SgwbS4qo7mTAXjj6J1pFhP
 TThV5MjjSB3uBaAMibSaZfGeEcR0RqrAWfZ9ftRHx+XLhXTsp+EFrOydtFx/ANJ8YAZe
 McoZtuDchuwWm6K0cYegF9pCMAYEdi1E1bEYwoCuTC+9qxUUwISYs7q/lUkLRjwV9AfD
 XQnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE1VR7IH2reAF/2DurC/eHRKhZlAxARQ9HpQkFpcMnlI7GCozg2Ysq2vaLvuzHlgsWT0z0Vp7dCLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD4FOQhXrxeT7gK9mlx9rPw+gk1sgO4dHDValZpug65cgNDZdB
 U37QYYelOwnHZUnYWd6I84vAStRVliJShSpVI7qUG69Ewa3Bx0plVhkt9XVgwi4L71IDniqmUYH
 GpgMWzmJ6EXS1uEVXen7JJRdfZzetU5auBZ//zvLDgrJIAQ+qkf6cGNnJv3xcq/Cl+efAvbU=
X-Gm-Gg: ASbGncsIw+DHEp8BmJXj1kJ9bOCzfTXRZ9j2DX5oO4VB22Ux6U32Dc4fyoqSpDdr3Qp
 GT3EMMgJ+/18n8MX1Py/rX46A4ZyKpN9G8TQQx6DNPdP5P7G+QGPAVry0+3z2pV0nBWgD0BK6y1
 NL9a6d2NzO8HAhiRBsbYBcG9pyRIr7gzEIzgvL7DEpaPx/ncjQUnkPYUrU/TqsjzJY0U/hebR4g
 yibF0dvZ3GbNOcbRe5bDjiwehx3J+AU6qKt1ZhjP4HnOO2n1/m7i1l938aLCoEqTtlYNXYDeYhi
 9xnbK9IHOTRqKjqFRTJ0hPNNcb9NBgLlinss32ER7KClvRFRR9LtdSiDxH7AoSM1Ewh+x4ImjcR
 boroK71yHh5bjiHcLMatjb3egOC3UNbE4vmBq+X+NJDIPnNB9cfgA
X-Received: by 2002:a05:6214:202e:b0:6fa:d9de:a3fc with SMTP id
 6a1803df08f44-70700722b9bmr33142776d6.34.1753269116006; 
 Wed, 23 Jul 2025 04:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAliv5sNvk+3b+28VgVbpH434Z10+GwNfxjx4Yw8Dl6zlfkQH4ukDRejh6Shv9GMsLPiMb9Q==
X-Received: by 2002:a05:6214:202e:b0:6fa:d9de:a3fc with SMTP id
 6a1803df08f44-70700722b9bmr33142086d6.34.1753269115418; 
 Wed, 23 Jul 2025 04:11:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c54asm2285330e87.100.2025.07.23.04.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 04:11:54 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:11:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
Message-ID: <rr6zxamm5oqebfc3zq7qzfjt327owlsjvh3todjzfzkqn6cd2b@sgsrdg7kfqa4>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
 <CACSVV0346j2y-1Jkj=wasekYy5syax_E495AQZv0bvrrqwCSRw@mail.gmail.com>
 <f1070069-7220-4351-845a-2929d1e65a71@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1070069-7220-4351-845a-2929d1e65a71@oss.qualcomm.com>
X-Proofpoint-GUID: f-ULKVEQu4DfpcgAEfyAOg7nq4Byv3Ih
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880c37d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wNNrqZBiHP9T-vZZJccA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfX1Y8c+HyOXb1E
 1om2wI45I54uGCtmMvwaTxWif7xj4SKopDpAWWRNmlvcrAWRxzpR7NW3tmPp9EroH6JeD3+xxXt
 zqGlVDlJ7jzGXYFEdIISdC+PIyun1/viIDBkwg1BMsotcvhg1gGgbi/s+J1p0l+XXR5qJQE5R2m
 szz90rZjoVm2BiBNncRc4xchBfeTmF1k9F4PGHF0KHva5pCPRL6IrP1iAbB/fqIn8ddsdcz3X4F
 S1N6BE9E6yOwH/MQ28+9r7BNmKJWbz3nTZqXWgL1pYrMNw5N80+/uQyw/fgeCJ+dxlZg4R3hbdX
 cxM5JmCHhd6xuquWCcUc6rmXp3N+bzwi+pfge5QclQ+K4RPWtF3Nymz3+AKrSvznajNThfka/uQ
 LXVo0hTg2vXfg3nSeJFhLjzWfnSqgSMGhm4LWuP0cKa5wfepGN3iGI7/WVqxBcEQVctaDHAZ
X-Proofpoint-ORIG-GUID: f-ULKVEQu4DfpcgAEfyAOg7nq4Byv3Ih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230094
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

On Wed, Jul 23, 2025 at 02:35:31AM +0530, Akhil P Oommen wrote:
> On 7/22/2025 10:56 PM, Rob Clark wrote:
> > On Tue, Jul 22, 2025 at 6:33 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, Jul 20, 2025 at 05:46:06PM +0530, Akhil P Oommen wrote:
> >>> Since the PDC resides out of the GPU subsystem and cannot be reset in
> >>> case it enters bad state, utmost care must be taken to trigger the PDC
> >>> wake/sleep routines in the correct order.
> >>>
> >>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
> >>> Additionally, GMU firmware should initialize a few registers before the
> >>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
> >>
> >> s/KMD/the driver/
> > 
> > IMHO for gpu things "KMD" makes sense, to differentiate between kernel
> > and user mode (UMD).. this is perhaps different from other areas where
> > there isn't a userspace component to the driver stack
> 
> Ack
> 
> > 
> > BR,
> > -R
> > 
> >>> GMU firmware has not initialized. Track these dependencies using a new
> >>> status variable and trigger PDC sleep/wake sequences appropriately.
> >>
> >> Again, it looks like there should be a Fixes tag here.
> 
> Ack. I guess it is not a bad idea to backport this one too.

Please add cc:stable to the patches that need to be backported and make
sure that all Fixes are at the start of the series.

> 
> >>
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 30 +++++++++++++++++++-----------
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
> >>>  2 files changed, 25 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> index 3bebb6dd7059782ceca29f2efd2acee24d3fc930..4d6c70735e0892ed87d6a68d64f24bda844e5e16 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> @@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
> >>>       if (ret)
> >>>               DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
> >>>
> >>> +     set_bit(GMU_STATUS_FW_START, &gmu->status);
> >>> +
> >>>       return ret;
> >>>  }
> >>>
> >>> @@ -528,6 +530,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> >>>       int ret;
> >>>       u32 val;
> >>>
> >>> +     if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
> >>> +             return 0;
> >>> +
> >>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> >>>
> >>>       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> >>> @@ -555,6 +560,11 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >>>       int ret;
> >>>       u32 val;
> >>>
> >>> +     if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
> >>> +             return;
> >>> +
> >>> +     /* TODO: should we skip if IFPC is not enabled */
> >>
> >> Is this a question or a statement?
> 
> It was a reminder to myself which I forgot to revisit later. Will
> addresss this in the next revision.
> 
> -Akhil.
> 
> >>
> >>> +
> >>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
> >>>
> >>>       ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
> >>> @@ -563,6 +573,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >>>               DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
> >>>
> >>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
> >>> +
> >>> +     set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
> >>>  }
> >>>
> >>>  static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
> >>> @@ -691,8 +703,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
> >>>       /* ensure no writes happen before the uCode is fully written */
> >>>       wmb();
> >>>
> >>> -     a6xx_rpmh_stop(gmu);
> >>> -
> >>>  err:
> >>>       if (!IS_ERR_OR_NULL(pdcptr))
> >>>               iounmap(pdcptr);
> >>> @@ -852,19 +862,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
> >>>       else
> >>>               gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
> >>>
> >>> -     if (state == GMU_WARM_BOOT) {
> >>> -             ret = a6xx_rpmh_start(gmu);
> >>> -             if (ret)
> >>> -                     return ret;
> >>> -     } else {
> >>> +     ret = a6xx_rpmh_start(gmu);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     if (state == GMU_COLD_BOOT) {
> >>>               if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
> >>>                       "GMU firmware is not loaded\n"))
> >>>                       return -ENOENT;
> >>>
> >>> -             ret = a6xx_rpmh_start(gmu);
> >>> -             if (ret)
> >>> -                     return ret;
> >>> -
> >>>               ret = a6xx_gmu_fw_load(gmu);
> >>>               if (ret)
> >>>                       return ret;
> >>> @@ -1046,6 +1052,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
> >>>
> >>>       /* Reset GPU core blocks */
> >>>       a6xx_gpu_sw_reset(gpu, true);
> >>> +
> >>> +     a6xx_rpmh_stop(gmu);
> >>>  }
> >>>
> >>>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> index b2d4489b40249b1916ab4a42c89e3f4bdc5c4af9..034f1b4e5a3fb9cd601bfbe6d06d64e5ace3b6e7 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> @@ -117,6 +117,12 @@ struct a6xx_gmu {
> >>>
> >>>       struct qmp *qmp;
> >>>       struct a6xx_hfi_msg_bw_table *bw_table;
> >>> +
> >>> +/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
> >>> +#define GMU_STATUS_FW_START  0
> >>> +/* To track if PDC sleep seq was done */
> >>> +#define GMU_STATUS_PDC_SLEEP 1
> >>> +     unsigned long status;
> >>>  };
> >>>
> >>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >>>
> >>> --
> >>> 2.50.1
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
> 

-- 
With best wishes
Dmitry
