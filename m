Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D0B04CEC
	for <lists+freedreno@lfdr.de>; Tue, 15 Jul 2025 02:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D29610E11E;
	Tue, 15 Jul 2025 00:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgUwGKpF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEAC10E105
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 00:31:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EKhVG1007513
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 00:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=rnWWSbqyVPN78Z8y5QMVj8G1tTsX+qJi/k8zbVH/95E=; b=Qg
 UwGKpFM6pGFgwuXYzYWR7HqPmzzi3rx7A5CthiwYTuMJlJiV4LrbHOfooHRQScl2
 8JxBTgYse/tvM0f066IhNrPMr15v4Hj5sPdDbK+5mUxfqRCbG2S4YZcGuYkMHlGY
 Zng4NOYL/3sJfff6e1A5MWwaDmN3ELtXm125lUJlq9y5FdydcBcoQkXl+PEagNCn
 7L4uwjIIa+ytk70peZfbo6P3BlPe4vTA8sqxPrW61ooNo00IG91odp1MLv7Cletf
 mtKghUn1yo5Ib9flW+5PrCuZzZsZeOXwJBK7Hq/x2a6sbS8YwFiUx4NpXQM/JzuU
 318dLvQqsyLKVnbTowSw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbe8eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 00:31:38 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-41bb68aad9aso124569b6e.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 17:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752539498; x=1753144298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rnWWSbqyVPN78Z8y5QMVj8G1tTsX+qJi/k8zbVH/95E=;
 b=SuGTRLWvES1Kpi/sIfSeTtkwGqSrjN2CxTckiSwZuY+mT3FlPSMr6zYtcEf7ULDxtM
 aAOKH14ZdoK2UiC4HNhtPDPPjwWReR6apsE8bFKtN1surrQ35ULyCsK0eD04neXMcpDz
 5PPrJqy+ALPoO3WJnQd1U/hazMQGw5eW9YkA7jdgksUEU7hOaK+XopxgnXQQZIr9cIb+
 WpmWuPg/JJ/fiK9XOfmipesxgDMUYGv0E0GF7gMBu1416BIlGEkfVWwEKpe5ju51t6OS
 NFXxuVt9DOdkPNYGkCz3VyBiC8/VWEf0rLxzhaXek526lIyXDOyjhtwigdvma+t/+/qf
 dTUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt7qCDs6AxWrzPVsFoxo69lXPHH2rVOtA31/PiqhkvEy5j1u8mnGzNN7XnLG2Tykr3PDvbW+fhqW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMOTlGny0TYWlro15XcvtbibrhPMFLg4xyQcfqrZSvl1Wg5xAV
 CRsdDqdeyJEzGq2EQM3YrF3cVTxiBIgWEQc3uiFbkFunCzDDgXH0DrJ9FYSnz54co7P08P9NGtz
 HK5VNyHD6up6zM+32HuSBUD9en/UbIAwtklQNSqOcIb0iwd44+9bK1D0JB2Fqk+5FX9wxmvsz0e
 E/A2gJgiFr+15GSMlDNfbd2eZWcQBWDQv682NfrphHRdJizg==
X-Gm-Gg: ASbGncuRYUulWmHoI36V2/1GTnmB86PcoEv35sGcw8VXY3YYA7/5pXho1XrI9li5VYq
 V+g1pgp3CjXWvy944XBW8M1F+40XGOnmOmmf5htNjpyagPiXE+IMMPsnbJTREuYMnTOOE3PlsVq
 Azx0GTcGMXllnhPpqqjGzMcj2qyhNYYk1OqU0yVohFNVce+J1iK9PZ
X-Received: by 2002:a05:6808:1b20:b0:41b:2876:a93b with SMTP id
 5614622812f47-41b7a364efcmr1243726b6e.6.1752539497900; 
 Mon, 14 Jul 2025 17:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVe0q7vgkIseEjo0dk13NCUfajh6E6wM7UZk0jmXnLOcEYFwaSqyd5OwR2la8d/TxAac8+t4HrvknpzfBER2Q=
X-Received: by 2002:a05:6808:1b20:b0:41b:2876:a93b with SMTP id
 5614622812f47-41b7a364efcmr1243707b6e.6.1752539497369; Mon, 14 Jul 2025
 17:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250714230813.46279-1-mcanal@igalia.com>
In-Reply-To: <20250714230813.46279-1-mcanal@igalia.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 17:31:26 -0700
X-Gm-Features: Ac12FXyhqSGe2MJwwTijBSGs8N0ketRONbFjQxi_2j2xnDRBqZcf9njzSpvOAUE
Message-ID: <CACSVV02kLAg9t31HNCy5zL3xAJ3j2MRp9zn1P1FiVE0tz5SMyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove unused global fault counter
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAwMyBTYWx0ZWRfX65iy237oEw+S
 m5lQmGLj5/mui80pqs6ltPCaKz6aAtgkue57cdasFafrVivCuRKCn/4RL3IawwTz88+JZEHPSZ0
 e1dY1IfEiQbPn3YJytC8I0MlD4uLCUresvT9bEN8RWZBlBfxM+0ZRpUo01FOUlVrC0Ww9HJNKs0
 uCSWXYPYD7MUXhaI2+POTI0DoEplYvGs/vnkGEU4/CMZO67d2ptaOvVFEq9ND6bwZixCW7Imsq1
 UWETqHpAKT4mUIBFpnVFgL6VSroz9fdYkLZfIXjzC17HEIWg0cuYcoQCu99MKS7fuzV+SU6rIf0
 L7ZP22z4vfsIxIRpNMVaB3WJu8k4r26ob+65oyDHb7OHXpswhgJG+elCrdALM+dKP775LPVtt1O
 /goRgGU5BpUBwT/eIGTeoQI0Fi5GRMzZ86QBkuLTVLvaR9MC7UeqcN8Qqk1PgmD7ihoXpcyN
X-Proofpoint-GUID: xesn0GjeAU4zWCyqrL7JHX5tEY5jkvdf
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6875a16a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=V2sgnzSHAAAA:8 a=m9oiR8dIFG-smg8RVMEA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: xesn0GjeAU4zWCyqrL7JHX5tEY5jkvdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150003
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

On Mon, Jul 14, 2025 at 4:08=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> The global fault counter is no longer used since commit 12578c075f89
> ("drm/msm/gpu: Skip retired submits in recover worker"). Additionally,
> with commit eab7766c79fd ("drm/msm: Remove vram carveout support"), all
> supported devices now have a defined virtual memory address space, which
> eliminates the need for a global fault counter.

Hmm, I think commit 12578c075f89 ("drm/msm/gpu: Skip retired submits
in recover worker") was wrong, now that you point it out.  We could
still have situations where we get a fault after the faulting process
has ended.  In that case get_pid_task() would return NULL.

BR,
-R

>
> Hence, remove the global faults counter. While here, s/unusuable/unusable=
.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +----
>  drivers/gpu/drm/msm/msm_gpu.c           | 23 +++++++++++------------
>  drivers/gpu/drm/msm/msm_gpu.h           |  6 ------
>  3 files changed, 12 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index f1230465bf0d..5bb00b9c998a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -416,10 +416,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm=
_context *ctx,
>                 *value =3D 0;
>                 return 0;
>         case MSM_PARAM_FAULTS:
> -               if (vm)
> -                       *value =3D gpu->global_faults + to_msm_vm(vm)->fa=
ults;
> -               else
> -                       *value =3D gpu->global_faults;
> +               *value =3D vm ? to_msm_vm(vm)->faults : 0;
>                 return 0;
>         case MSM_PARAM_SUSPENDS:
>                 *value =3D gpu->suspend_count;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index c317b25a8162..3d5a76d2901c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -463,6 +463,7 @@ static void recover_worker(struct kthread_work *work)
>         struct drm_device *dev =3D gpu->dev;
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_submit *submit;
> +       struct msm_gem_vm *vm;
>         struct msm_ringbuffer *cur_ring =3D gpu->funcs->active_ring(gpu);
>         char *comm =3D NULL, *cmd =3D NULL;
>         int i;
> @@ -482,20 +483,18 @@ static void recover_worker(struct kthread_work *wor=
k)
>
>         /* Increment the fault counts */
>         submit->queue->faults++;
> -       if (submit->vm) {
> -               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
>
> -               vm->faults++;
> +       vm =3D to_msm_vm(submit->vm);
> +       vm->faults++;
>
> -               /*
> -                * If userspace has opted-in to VM_BIND (and therefore us=
erspace
> -                * management of the VM), faults mark the VM as unusuable=
.  This
> -                * matches vulkan expectations (vulkan is the main target=
 for
> -                * VM_BIND)
> -                */
> -               if (!vm->managed)
> -                       msm_gem_vm_unusable(submit->vm);
> -       }
> +       /*
> +        * If userspace has opted-in to VM_BIND (and therefore userspace
> +        * management of the VM), faults mark the VM as unusable. This
> +        * matches vulkan expectations (vulkan is the main target for
> +        * VM_BIND)
> +        */
> +       if (!vm->managed)
> +               msm_gem_vm_unusable(submit->vm);
>
>         get_comm_cmdline(submit, &comm, &cmd);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index b2a96544f92a..88d8ddef616b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -226,12 +226,6 @@ struct msm_gpu {
>         /* does gpu need hw_init? */
>         bool needs_hw_init;
>
> -       /**
> -        * global_faults: number of GPU hangs not attributed to a particu=
lar
> -        * address space
> -        */
> -       int global_faults;
> -
>         void __iomem *mmio;
>         int irq;
>
> --
> 2.50.0
>
