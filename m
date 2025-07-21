Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0FAB0C7A8
	for <lists+freedreno@lfdr.de>; Mon, 21 Jul 2025 17:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04210E56D;
	Mon, 21 Jul 2025 15:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnE/Ixoq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A88810E56D
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jul 2025 15:32:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LEf4Jj012705
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jul 2025 15:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=pn4QShidMqpn8tDs9UtssL3GRxstixsRAQC0jJF8Fmo=; b=dn
 E/Ixoqunh/4e4liiC8GNUYkMSvstofwnRJYPMRH+ot8IcrhzfeEhSn6XG53V3VaF
 paxDShIe8evsGbaC7DvhTZui5KIryf9Cq1/q7CUae3gsmrCSfseG7Sm1zT3vBBAJ
 RJfhbszFRotVyt3Ydth/C3/LMrwt0kzy9MvcWRq8gGgX453WpC5+a6L76Mq83Ajf
 Pl10aEB4i8qumBkxLvjrqmCJl/F/ahgKZjqk2vHsbk3Rd4OZHQVM8K1Gp3KkUTjy
 zHvZpCgsHi0LSX1pIHwu81R7mf5LJI9fpwWIU9ye34+MoVVTAPoUqHMM+NW+j40/
 A0MYMq/t4TCmYzU9tymA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6g7tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jul 2025 15:32:27 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-41c03fb4e25so3376348b6e.0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jul 2025 08:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753111945; x=1753716745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pn4QShidMqpn8tDs9UtssL3GRxstixsRAQC0jJF8Fmo=;
 b=WQRY8ncWRp28K1do6nifuAd2tFTEWq8MGTOOnzup4lm8VkPJhggRGP/9MRkbRYZg/A
 8viI0X9WcD3fDAm0a/xHqAdeYpwmdKQJLTZUfy+DtFPbPeitHsG0zSvp6YFLOl4ofM/s
 f8i/ZVVr7VxtSoHfR+Ijx7mfRiBWXRdHnRW+y94bOVsdFgMy/zXmtRaCZgU3BjjBa9lH
 YQJQbqBdpHN3pFxyviLFDGL7bp0WtKf9PXWQL2aVLD2EvOkbLzHyMU+6AgSbGahgI8W/
 UdyZ2GcdO8AdNkMp313vFOUWFBrJRcxzCa/x9+iyluBQrOPo/vQWSttJqqXTGREcL0Ht
 5Vuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdWEIXGr7FrSodIytR57p2iDjPfVVsXc7qvfmM6bPRuuKXl6D2ilM7EQ42rOSO+7e2ALLFdtHAgqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLixgQcsMgNJWvNqZjwboifmk74g8/o4p6YKRiy57DurpWchDH
 sqVG+CLHe1jWl1AJ2i+IQadOMZ6XHt8nWoIH/SHQzrrigi25Rz5tD7t63tKsscj42/hnyL8EXV+
 dhRCotv0A2aKkBIKdP+YAWO88LwVHtkd4F2bpimAaM+5U/gVf/Fkj9uIroDA9B0M5vBzkabtujF
 GA4iSCHbVZ9yQti+LipqtFfE9xg0OKzMyPHDqR9e82aRZYfQ==
X-Gm-Gg: ASbGncu/DPaTfw8aw50NG6thKyiCcMVJoheOXRTcAcrXpNmhJcUBxUBAZP7SdBLzJao
 rTU/IJF9ecRC6vFRIPepF3MhjiMD8bieIrRG6uoNJsiXnk/6u35oC6SMHBGAyqOEjVDZLuwxW3x
 TKiLcz5nJy38nhzaXJ0MB4otlnmOL5csMY96o0I8MKfKYqR0QuM1aU
X-Received: by 2002:a05:6808:2188:b0:408:fef8:9c91 with SMTP id
 5614622812f47-424a5f062c0mr15809b6e.5.1753111945158; 
 Mon, 21 Jul 2025 08:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmpPuf5T41nLwP4XkGePTBbk6EOGPpBib0cg8PUK4HVB0Fg2tL8IgmfUbFnk7gM7ghiJnwfKPGqhCfNY7gmOY=
X-Received: by 2002:a05:6808:2188:b0:408:fef8:9c91 with SMTP id
 5614622812f47-424a5f062c0mr15776b6e.5.1753111944663; Mon, 21 Jul 2025
 08:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
In-Reply-To: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 08:32:13 -0700
X-Gm-Features: Ac12FXzvbzguxLYloc-GJtjClSoXedg9QfWcE1Vpl2vCkosZs7wDE7RbEQwae6M
Message-ID: <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687e5d8b cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=BW8Q5FgReVRllakMzg8A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: xrAf1AUE6Tn0Xh9WrmZWnjjtSiMzc2Hm
X-Proofpoint-GUID: xrAf1AUE6Tn0Xh9WrmZWnjjtSiMzc2Hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEzOCBTYWx0ZWRfX9dZcsWFWr4zA
 ZA/MPA6E0K2CKUuQ51k57ffQfX3sYXUk6xaZJBYd5zTUOADPeIiKnsWfIXTN8YlMSIyW06R8iSf
 VRSqI3T1e8zTJHAozBH5nhiQJqBtzOblxW/Y1oDrdxm3LfBnk5NXPqjpVgOXc8jdLGxCQtvTakC
 mAKLmnwvUgzPAmyFR8gkbyY39K4JUvaPhVffxUxojASGGOYRQ4hmsRddxmAvClZwy0UCoiUnv1N
 66R68zTLetgCipXdmxk780/ySbdgKoV3431cNPxuCqDO4vBsQDRAr5b8WHg84z1x1lGYjHddRuH
 TdZW2v4QmisoDD9y2zUs8vTPLsSLNiW5OGlvMuRElsUYtv0nv8oQqzs2ZPy/PZNvc4XM/M0Upx2
 h+/+XWjRE2KSNCq7oU3xU+NjSSmguZVGCJLdgh7Mu6EhPlENPLpSeJhm6fbm+iqQohlLJLxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210138
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

On Fri, Jul 18, 2025 at 6:50=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> If there is a flood of faults then the MMU can become saturated while it
> waits for the kernel to process the first fault and resume it, so that
> the GMU becomes blocked. This is mainly a problem when the kernel reads
> the state of the GPU for a devcoredump, because this takes a while. If
> we timeout waiting for the GMU, check if this has happened and retry
> after we're finished.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  4 files changed, 49 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.c
> index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d30b=
2d36ea5fb662241 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_=
gmu_oob_state state)
>         int ret;
>         u32 val;
>         int request, ack;
> +       struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gpu, =
gmu);
>
>         WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>
> @@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx=
_gmu_oob_state state)
>         /* Trigger the equested OOB operation */
>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
>
> -       /* Wait for the acknowledge interrupt */
> -       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, va=
l,
> -               val & (1 << ack), 100, 10000);
> +       do {
> +               /* Wait for the acknowledge interrupt */
> +               ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_=
INFO, val,
> +                       val & (1 << ack), 100, 10000);
> +
> +               if (!ret)
> +                       break;
> +
> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))
> +                       break;
> +
> +               /* We may timeout because the GMU is temporarily wedged f=
rom
> +                * pending faults from the GPU and we are taking a devcor=
edump.
> +                * Wait until the MMU is resumed and try again.
> +                */
> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
> +       } while (true);

It is a bit sad to duplicate this nearly identical code twice.  And I
wonder if other gmu_poll_timeout()'s need similar treatment?  Maybe
Akhil has an opinion about whether we should just build this into
gmu_poll_timeout() instead?

BR,
-R

>
>         if (ret)
>                 DRM_DEV_ERROR(gmu->dev,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/=
adreno/a6xx_hfi.c
> index 8e69b1e8465711837151725c8f70e7b4b16a368e..4e775ca757ce3649ac238d25c=
ebfd7eb693fda61 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -104,10 +104,25 @@ static int a6xx_hfi_wait_for_msg_interrupt(struct a=
6xx_gmu *gmu, u32 id, u32 seq
>  {
>         int ret;
>         u32 val;
> +       struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gpu, =
gmu);
> +
> +       do {
> +               /* Wait for a response */
> +               ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_=
INFO, val,
> +                       val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000=
000);
> +
> +               if (!ret)
> +                       break;
>
> -       /* Wait for a response */
> -       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, va=
l,
> -               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))
> +                       break;
> +
> +               /* We may timeout because the GMU is temporarily wedged f=
rom
> +                * pending faults from the GPU and we are taking a devcor=
edump.
> +                * Wait until the MMU is resumed and try again.
> +                */
> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
> +       } while (true);
>
>         if (ret) {
>                 DRM_DEV_ERROR(gmu->dev,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index f1230465bf0d0840274a6eb03a10c4df3a7a68d3..19181b6fddfd518e2f60324da=
1a7087458115e40 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -293,6 +293,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigne=
d long iova, int flags,
>                          struct adreno_smmu_fault_info *info, const char =
*block,
>                          u32 scratch[4])
>  {
> +       struct adreno_gpu *adreno_gpu =3D container_of(gpu, struct adreno=
_gpu, base);
>         struct msm_drm_private *priv =3D gpu->dev->dev_private;
>         struct msm_mmu *mmu =3D to_msm_vm(gpu->vm)->mmu;
>         const char *type =3D "UNKNOWN";
> @@ -345,6 +346,11 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsign=
ed long iova, int flags,
>                 /* Turn off the hangcheck timer to keep it from bothering=
 us */
>                 timer_delete(&gpu->hangcheck_timer);
>
> +               /* Let any concurrent GMU transactions know that the MMU =
may be
> +                * blocked for a while and they should wait on us.
> +                */
> +               reinit_completion(&adreno_gpu->fault_coredump_done);
> +
>                 fault_info.ttbr0 =3D info->ttbr0;
>                 fault_info.iova  =3D iova;
>                 fault_info.flags =3D flags;
> @@ -352,6 +358,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigne=
d long iova, int flags,
>                 fault_info.block =3D block;
>
>                 msm_gpu_fault_crashstate_capture(gpu, &fault_info);
> +
> +               complete_all(&adreno_gpu->fault_coredump_done);
>         }
>
>         return 0;
> @@ -1238,6 +1246,9 @@ int adreno_gpu_init(struct drm_device *drm, struct =
platform_device *pdev,
>         if (ret)
>                 return ret;
>
> +       init_completion(&adreno_gpu->fault_coredump_done);
> +       complete_all(&adreno_gpu->fault_coredump_done);
> +
>         pm_runtime_set_autosuspend_delay(dev,
>                 adreno_gpu->info->inactive_period);
>         pm_runtime_use_autosuspend(dev);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 9dc93c247196d5b8b3659157f7aeea81809d4056..f16556c6f2921708e740ecd47=
f5b4668e87700aa 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -179,6 +179,8 @@ struct adreno_gpu {
>         uint16_t speedbin;
>         const struct adreno_gpu_funcs *funcs;
>
> +       struct completion fault_coredump_done;
> +
>         /* interesting register offsets to dump: */
>         const unsigned int *registers;
>
>
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250718-msm-gmu-fault-wait-465543a718fa
>
> Best regards,
> --
> Connor Abbott <cwabbott0@gmail.com>
>
