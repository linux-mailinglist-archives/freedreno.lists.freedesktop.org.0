Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94285B1CF73
	for <lists+freedreno@lfdr.de>; Thu,  7 Aug 2025 01:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ABE10E7CF;
	Wed,  6 Aug 2025 23:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4NhXMfZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B754010E7CF
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 23:38:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576ETLn7006525
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 23:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Ac6klSnA9Mr53PX86rTjqGkchVoRjSTOCtS4mQwGPtg=; b=B4
 NhXMfZIY3KWm6jV5nbmTTOhsPk0QXzDg9ZDqfcFXdh6wYO/uesBS/3C2wsO83bFJ
 rP68H2+u/of4suW5za0If4n+6E9fC7Uaz34XB5Nzc1ipssLt297je78LzE60wx2K
 RwQ2yF9S1SQVMo+D9/J6HWQeu7grns/0tAe7jy082gJUhvMZVhAyhUQEFBxP5OGO
 iZ/jvb8vHLNklSATXeRZSX3kxIe/db8E4vKpF1bPsU5gK0MSdNVpGNP8ttjSaUlw
 UAW9C/yH6s/mbvPMflLUBFBeBOI78k4GtNJ/Ha0/IWIDPFioZATiGhx4zX3GiRJ9
 CRuq4Np6lHjjALpAKTlg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u21anj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 23:38:32 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-40ab2c50f7cso1673252b6e.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 16:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754523511; x=1755128311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ac6klSnA9Mr53PX86rTjqGkchVoRjSTOCtS4mQwGPtg=;
 b=VLjhZLkVhv1xmzqHDZHCpqSvsr1TwMrLIuUlBQd37x3f8VBnEvO1YjDr/27HsdO5wd
 PxiSDJ/TCtiiPmNuYqkh/qANMyFAIaCAZB8WnjrGQkxpRQ9UgIvVxDQa48Gm+pFoRhJ6
 htkPjeiLL1bBQo/x/vtPAn7GD2QPQm9oi10wa45Fch5ybPB1zmAcT+Hf+Rf9wFEhFzgw
 rA5R/+0DYnVFs8HJmV+yTp1QH6BaERL8tz3wKm3c5QwzKkRsGRkHfV9LZDGXUbywRj2J
 34W0ZlMut0NISAFJvTUdZ7+htkEpsAVBgccegOL5dlUmTq88mbI7YtRpxRm0N7Gzz+gU
 o7Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOaj/HN3Lkxyg/vYs9+qHhzjMadnyDPk2PQEC40vye5HstXywGrEO74DKxJqemUCvx+GEY2bcm0ec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/w6wbKcS2s20z2qVPrcw9t+lLl2FaXLEq92IeBkstZGPTcOD2
 PtxhKHuCAdQA2YWKOo/qynjWAkTkpmJHilD65nvCEKKlMmkRbZNGY8L6nOtUIjNuadYKG+qU7kh
 O6KFBKntymX8XJnqxGHP1QzNCeP/6LwxFFBwETIH+lrT+QqtFqcB13HQiN9gYTSO4CjMWouBTsU
 EwuJrFCTKH/QPOVu/bRulFnEfzLgGgqlmQ3epHQ0ZoEFsBfA==
X-Gm-Gg: ASbGnctMy0ToavtMYjvKpwC560UvGEti56wV71/riYN7nkp+IiNERlzmCLmOUq+p46A
 jONTmR+l6pjYUI1qg2ky62xwJIzBHewfH5+5aw9JvWxJg7mYqfdCVWRx58WFQco36yItVZnN1A2
 h9IMWTs6N5lIpwh2F4x8ei0bGi63/i71t72hx4cQKjhzj1gOz8pEeH
X-Received: by 2002:a05:6808:188e:b0:407:a0ea:a233 with SMTP id
 5614622812f47-43587d4aefbmr1086827b6e.10.1754523510880; 
 Wed, 06 Aug 2025 16:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEajvgQwj0cA40SDmJZi443/ZvRJrXgIh9b0IEiCevFL8xUX1afj5QQsW7XjUX+4Vja9Yolv8KBFejgkt9sl+0=
X-Received: by 2002:a05:6808:188e:b0:407:a0ea:a233 with SMTP id
 5614622812f47-43587d4aefbmr1086811b6e.10.1754523510491; Wed, 06 Aug 2025
 16:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250805225557.593192-1-sashal@kernel.org>
In-Reply-To: <20250805225557.593192-1-sashal@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 16:38:19 -0700
X-Gm-Features: Ac12FXzyXnGkvSc4Rh5FVrwgztoGD-i80tBzbFVH33Tmk6r1gudt7__afChJygA
Message-ID: <CACSVV02Z=4Saw=-MA6zz-Dsye8T=AcARWs1AhUbWnyA8sY7fdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix objtool warning in submit_lock_objects()
To: Sasha Levin <sashal@kernel.org>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, 
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 5UFx-iTz7q7TFYH7k4fdardVRrkd_ehl
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=6893e778 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=QLtsSAfmF_M2AFDG84kA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: 5UFx-iTz7q7TFYH7k4fdardVRrkd_ehl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX6tHzofjPM3DV
 PpN4ZeWxNfrrOhdfTUQagIG0g6PgAsDECNS/a909BpLO+yVOuZEoUB8mxVJ7z/GWff+mKSrZU/K
 KIzSlHmymEyBQ1h+NdkSmaYza0F2lBwEmfgbLqq+8foKtqacZLbp1oCZAyMYkFGk1JvlxPovpYB
 gyVNdf1GjooGkKO1ani/IWjksoDlTb+dVbPgsMEbOyT7pK0ChsiYU6Ql14Y1PomXsWjEPfw6QEn
 Rhx2+ScY2ebv7/DM2+fZElhnCC+V0l7R24PLKpeAUAqxvsi92R23IP/FlacKylW+2EJWFXjdbdB
 KfzPBy27bFD4hX0lLEvVGCPVZgt51/Pa+/2T1bE0i825GoTWA6RMGritSR8NEpSr6Mn76pPfG2U
 xaYl2Vro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
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

On Tue, Aug 5, 2025 at 3:56=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> Restructure submit_lock_objects() to use a single loop with break
> statements to fix objtool warning:
>
>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>   sibling call from callable instruction with modified stack frame
>
> The drm_exec_until_all_locked() macro uses computed gotos internally
> for its retry loop. Having return statements inside this macro, or
> immediately after it in certain code paths, confuses objtool's static
> analysis of stack frames, causing it to incorrectly flag tail call
> optimizations.

Maybe we should instead just split out a separate
submit_lock_objects_vmbind() and restore the error path 'goto error'
instead of returning from within the loop?  Ie. basically revert
submit_lock_objects to the way it was before commit 92395af63a99
("drm/msm: Add VM_BIND submitqueue"), and then move the rest into a
new fxn (with 'goto error' instead of 'return ret'?  In retrospect the
vmbind case is kinda just shoehorned into the existing fxn.

I can type up this version if you have better things to do.

BR,
-R

> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 43 ++++++++++++----------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 5f8e939a5906..253347b6e328 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -276,46 +276,41 @@ static int submit_lock_objects(struct msm_gem_submi=
t *submit)
>  {
>         unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
>         struct drm_exec *exec =3D &submit->exec;
> -       int ret;
> +       int ret =3D 0;
>
> -       if (msm_context_is_vmbind(submit->queue->ctx)) {
> +       if (msm_context_is_vmbind(submit->queue->ctx))
>                 flags |=3D DRM_EXEC_IGNORE_DUPLICATES;
>
> -               drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> -               drm_exec_until_all_locked (&submit->exec) {
> +       drm_exec_until_all_locked (&submit->exec) {
> +               if (msm_context_is_vmbind(submit->queue->ctx)) {
>                         ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1)=
;
>                         drm_exec_retry_on_contention(exec);
>                         if (ret)
> -                               return ret;
> +                               break;
>
>                         ret =3D drm_gpuvm_prepare_objects(submit->vm, exe=
c, 1);
>                         drm_exec_retry_on_contention(exec);
>                         if (ret)
> -                               return ret;
> -               }
> -
> -               return 0;
> -       }
> -
> -       drm_exec_init(&submit->exec, flags, submit->nr_bos);
> -
> -       drm_exec_until_all_locked (&submit->exec) {
> -               ret =3D drm_exec_lock_obj(&submit->exec,
> -                                       drm_gpuvm_resv_obj(submit->vm));
> -               drm_exec_retry_on_contention(&submit->exec);
> -               if (ret)
> -                       return ret;
> -               for (unsigned i =3D 0; i < submit->nr_bos; i++) {
> -                       struct drm_gem_object *obj =3D submit->bos[i].obj=
;
> -                       ret =3D drm_exec_prepare_obj(&submit->exec, obj, =
1);
> +                               break;
> +               } else {
> +                       ret =3D drm_exec_lock_obj(&submit->exec,
> +                                               drm_gpuvm_resv_obj(submit=
->vm));
>                         drm_exec_retry_on_contention(&submit->exec);
>                         if (ret)
> -                               return ret;
> +                               break;
> +                       for (unsigned i =3D 0; i < submit->nr_bos; i++) {
> +                               struct drm_gem_object *obj =3D submit->bo=
s[i].obj;
> +                               ret =3D drm_exec_prepare_obj(&submit->exe=
c, obj, 1);
> +                               drm_exec_retry_on_contention(&submit->exe=
c);
> +                               if (ret)
> +                                       break;
> +                       }
>                 }
>         }
>
> -       return 0;
> +       return ret;
>  }
>
>  static int submit_fence_sync(struct msm_gem_submit *submit)
> --
> 2.39.5
>
