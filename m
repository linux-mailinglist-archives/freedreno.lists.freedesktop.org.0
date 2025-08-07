Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F4B1DBC9
	for <lists+freedreno@lfdr.de>; Thu,  7 Aug 2025 18:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4DE10E0E9;
	Thu,  7 Aug 2025 16:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQisyQxg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B818110E0E9
 for <freedreno@lists.freedesktop.org>; Thu,  7 Aug 2025 16:34:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D3UT024848
 for <freedreno@lists.freedesktop.org>; Thu, 7 Aug 2025 16:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=20XGyfXXNdGC7HQWVvn1/217ySdGWAG+LZsLEYNzAEc=; b=kQ
 isyQxgZ6iPc3Dqkz5PhDNE/kGLpDsQ1ExaMUJT8FuqRF88ggtnaVwPqFhtVZbLI1
 AVFcjII7mpAI2W74c7NZIgVunInTO6+H4l/3PPcbGd1zdz3+PjlV/nA9UhSC5Mfn
 K66TfR6SpTM4hMitkVKpZfTd5Z+z3qyQRfLDVSwYHmhLTIKrZ8aMHXXHhvzJdYeg
 nkGYgGCGfyMH7LIfj4GlSieIQ55NtSGy/+hdAdMUY/D6O44xp+jJMRhAoe7+4YQU
 r3gOOygXgCN6ziP3huRubTzWKdhWF8AQ9EAiGs34kSrN7CTFbkZ0/WnH7EIJNKzf
 IUEEUB+S4GlObvJ7EJ1Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1ew58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 07 Aug 2025 16:34:22 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-4357e99616bso1487506b6e.3
 for <freedreno@lists.freedesktop.org>; Thu, 07 Aug 2025 09:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754584462; x=1755189262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=20XGyfXXNdGC7HQWVvn1/217ySdGWAG+LZsLEYNzAEc=;
 b=qZEvmMZ3ex7witIeUU9sznKScwzKsNh/m9luNYB7XG6XOUoIuWSq6g+Heay/Tp4+0K
 5DhLnVNJhxGmtjI+4ppigwHOE5tOAYDcd6zb08HYyOHcOQ+stTKLzG4CYgPZtw28ufx3
 IKaKPXaHZ16WkWjRHoaoJFT+YdIAotucVgRQ6kDviDT2LlaFo0HwH7Pv3JfvkHoqpKPo
 BTM6vCpFEgKeEYptT7TGhDaeFrxjvXsxZA3vrgSaFNOKv200oHno5SDrLksTj6LenQn2
 heTCpGKAqBDhawUxHhgjl8ox9BOQxCB+z5XUPpmgwGhzhiPUnhfITtX3kipY2CmWqx5B
 ZsPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGlqpXNVIL2z3LG7Wxo365mWB5A/BbR08OKjLG6e1vpN4xVJ1ZRsb/5VPaVO2OJjE7QasSRJkqQHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8TrSzP3UOfVqpQhEM1MzrmhMfwktAhRe5+oFjF2v0NQMUCdj3
 xAZTWT9kIvNEJJ9R4p90cdpjx2SnpWRzQofsuxUrqsbcXZwbelVTj2Eg2oDPqp4CiCDpUTYpj/t
 fuBBneUiSNfHoguba5LPRU1rYrdg2+4dYsv5bAChxLBnlvNuDFdcltJf6B2LIMKBuoEVbSn4Ee+
 Lj37hKovVULQ87HwrETF5O256lvzgkyWBnXmzUDRvSn8fwjg==
X-Gm-Gg: ASbGncsxG8RUd4wZKffKmLabnYnhFw+QCsZzem2LGFwY/KcKh4/W2AMV8mGjfRqDVc0
 a5SMVfoejBXpHbLZfIN047D3AqIFyUmyVC5Y+Nj/uMucpre82XEXTK3KlwA9ftDVCle9B5KmsjY
 JsmF+jguKb+h10Ozb7luw4STul6SZoCbJiJmAR8hlADce6p8srReCu
X-Received: by 2002:a05:6808:4f62:b0:435:51e3:4c32 with SMTP id
 5614622812f47-435949944cbmr412529b6e.22.1754584461683; 
 Thu, 07 Aug 2025 09:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyYDpEiutargwcHztd1uMH+An3wIVt+BWQAJA5PusdGM4Ay+XwJsJLRnHeGzu24XnAc+azltF8a3XWtp0hOuI=
X-Received: by 2002:a05:6808:4f62:b0:435:51e3:4c32 with SMTP id
 5614622812f47-435949944cbmr412515b6e.22.1754584461239; Thu, 07 Aug 2025
 09:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250807131058.1013858-1-sashal@kernel.org>
In-Reply-To: <20250807131058.1013858-1-sashal@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 09:34:09 -0700
X-Gm-Features: Ac12FXxMSsMGvIgYDAvLfpHDoBnkFhjLk_774zLTck_kXTKHSm6n5z-AQjQuJmY
Message-ID: <CACSVV03b+tAN4o9kFFaNVJrcO6OgaCSmajL-LpvCd_wDzWPSBQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix objtool warning in submit_lock_objects()
To: Sasha Levin <sashal@kernel.org>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, 
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX55nGP+V5gLrd
 g2m6B8BveUD8f318WV4kqpOtyBvqJfrf3E5ddL6LWOGhXb3sy7bllsE2UXs7kWOaWtqzjNGojUH
 R988rD0Dd601bm0N0W2/O+1/j1e520OUlcUGNoPBe71HF2DNE5inY3/x3rV7HrrKLDU4GtREsZ6
 jMbIEs+MMy0NZaLtp6znV86RUc7wvgXU6/DvSThWbj2FZIvVcugDth4JNluMQs5plb4HksTHRYj
 jQ+vS3qme4Sxgf9tSzRZgm0sIjAdyCYHFN9lkC986Bt1EftFVrugtneBRMCDj8H434U7E567drZ
 Fj7J6aDeeDC+4W+btckaig+63EeIYynt95SVYl/cR7dSoMIGMC/FZhVFNFz10Tpl/1YwSFn5P8X
 wyAFq3CQ
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6894d58e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=J1DvxoY-jygCTqRSKsMA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: rqiLSfOFj--ymAD3Y1Nhu1xft64QlCs1
X-Proofpoint-GUID: rqiLSfOFj--ymAD3Y1Nhu1xft64QlCs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Thu, Aug 7, 2025 at 6:11=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> Split the vmbind case into a separate helper function
> submit_lock_objects_vmbind() to fix objtool warning:
>
>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>   sibling call from callable instruction with modified stack frame
>
> The drm_exec_until_all_locked() macro uses computed gotos internally
> for its retry loop. Having return statements inside this macro, or
> immediately after it in certain code paths, confuses objtool's static
> analysis of stack frames, causing it to incorrectly flag tail call
> optimizations.
>
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks, I've pushed this to my staging branch for msm-fixes

BR,
-R

> ---
>
> Changes since v1:
>  - Extract helper submit_lock_objects_vmbind() instead of refactoring
>    single loop
>
>  drivers/gpu/drm/msm/msm_gem_submit.c | 49 +++++++++++++++-------------
>  1 file changed, 27 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 5f8e939a5906..1ce90e351b7a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -271,32 +271,37 @@ static int submit_lookup_cmds(struct msm_gem_submit=
 *submit,
>         return ret;
>  }
>
> -/* This is where we make sure all the bo's are reserved and pin'd: */
> -static int submit_lock_objects(struct msm_gem_submit *submit)
> +static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>  {
> -       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
> +       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_=
DUPLICATES;
>         struct drm_exec *exec =3D &submit->exec;
> -       int ret;
> +       int ret =3D 0;
>
> -       if (msm_context_is_vmbind(submit->queue->ctx)) {
> -               flags |=3D DRM_EXEC_IGNORE_DUPLICATES;
> +       drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> -               drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       drm_exec_until_all_locked (&submit->exec) {
> +               ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> +               drm_exec_retry_on_contention(exec);
> +               if (ret)
> +                       break;
>
> -               drm_exec_until_all_locked (&submit->exec) {
> -                       ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1)=
;
> -                       drm_exec_retry_on_contention(exec);
> -                       if (ret)
> -                               return ret;
> +               ret =3D drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> +               drm_exec_retry_on_contention(exec);
> +               if (ret)
> +                       break;
> +       }
>
> -                       ret =3D drm_gpuvm_prepare_objects(submit->vm, exe=
c, 1);
> -                       drm_exec_retry_on_contention(exec);
> -                       if (ret)
> -                               return ret;
> -               }
> +       return ret;
> +}
>
> -               return 0;
> -       }
> +/* This is where we make sure all the bo's are reserved and pin'd: */
> +static int submit_lock_objects(struct msm_gem_submit *submit)
> +{
> +       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
> +       int ret =3D 0;
> +
> +       if (msm_context_is_vmbind(submit->queue->ctx))
> +               return submit_lock_objects_vmbind(submit);
>
>         drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> @@ -305,17 +310,17 @@ static int submit_lock_objects(struct msm_gem_submi=
t *submit)
>                                         drm_gpuvm_resv_obj(submit->vm));
>                 drm_exec_retry_on_contention(&submit->exec);
>                 if (ret)
> -                       return ret;
> +                       break;
>                 for (unsigned i =3D 0; i < submit->nr_bos; i++) {
>                         struct drm_gem_object *obj =3D submit->bos[i].obj=
;
>                         ret =3D drm_exec_prepare_obj(&submit->exec, obj, =
1);
>                         drm_exec_retry_on_contention(&submit->exec);
>                         if (ret)
> -                               return ret;
> +                               break;
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
