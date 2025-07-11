Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF78B022C5
	for <lists+freedreno@lfdr.de>; Fri, 11 Jul 2025 19:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1210E3A9;
	Fri, 11 Jul 2025 17:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0hYY/nr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3802410E3AB
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:40:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAC0al023233
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bSezsz2wXgTichUOuspk0FPIeAlYJ0bxEsO1UFLnzmo=; b=Z0hYY/nrrlBJik1F
 7yVA9QtxJ/aLHlPP3bPTJNmgQW8BOtB00MfHuN+TPuQ25N6Xnxdg3IIMvQVUIdye
 8uYP/8m/HLTjESmX7YB5xmzsKbXegTBa6ZUTYPE9mZMjbGDu6zehHid3jjkpfaeU
 ING/wn9fJk2qWAPky4kOim61wZN/5CGU/hJ6nmaZsYdwzEpy6/guCmzDQ5C9KwmK
 FT98QK5OWkFLdIuXrn7Amezke6MP7jozasPWMiZk5Shh2/fNCcZ6w2dEd3FKLVT5
 42f/m3JjCzgarYVIdTxvlF0KjTGT4yxcKhxrd85NIZ1HL5ToHqPTbFsJZfl2TKUD
 O7llpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1adx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:40:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23dc7d3e708so14365215ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255644; x=1752860444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bSezsz2wXgTichUOuspk0FPIeAlYJ0bxEsO1UFLnzmo=;
 b=i1QISVnYt444edbOczRcI4yvH5xAqe3HPY0evvnVPetJQifDDvcCbSc9ry457XpKgX
 5KjIgy0nH/+zArnEOpHQilUMgvttr9jOpIAFJfcDhgo32nZGPw6sL+H0QtlGUzyNZCMQ
 qSvAoci2Naki+LoaKT5FAc/Ab67ExigkKfGEt1wm6XQTx45pi/0wOj/+CoHptuo/hgST
 IKhtwm/LVX8wBFNtFdGmdpe7L7cKGWXJDf8EXQpYSYKhidglBlUgoRYXnEaP1nG4y9Su
 dvjOuMbU4d3vGY7wNwzZ0MLo/mQpU7wt0C3gatKvpJDv5MPSii6Zu3IxBUUp+UuZTJSl
 FWdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9akRZynZxZNHgOvtibcpa03yID5AgTTxe3PJJ3xuzU8hUKrJBxnB8ZwBiBWakv0FzKIcP0nvvbmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlyE7aclh9Ac9A29/ZdOAI8yKn/vzUaZP/SlEx+/2gI1Tqj3Gu
 BQ3btA0iKUqJJ/eaqTl/n7F17o602Mq6JyES/uBV9bm+uj3i2/t38ACymbSki0aYuikEpzPkbJo
 PQ5du3vsMAWETGlqnUKlLn85As9Vt5LR7WhT0qjn46oiBhl+rRZihX0XPaSHGZ6RfkLHMXq4=
X-Gm-Gg: ASbGncujZ1Ub0unazoNKetzfbkyYCjSdv9ogrnObTtoLQ6IA345Q+2sJSBNx5FSLisr
 hQT9G8JsuyqKC1V0WlgZM373B+Jsg17b/HQl/wnVctQ+kt9D4P/mhw79J5ZRhbNR1i6vTFY5s+8
 muWaOp1qbJA9DkF49YnxUSJ0nNYkL74F0mLnMtHklClCmwIr7jcPoPyAYNVf0D69ngsIzIrnL4/
 PFwOflcNZTN7LlEdXeeqNCd/uJQnIJdcDrgUppd3H620aB4SbeYHJ8cXu4i5BHVhxf6/f/7VtmZ
 lbt0nWon25m565+L3DXFIQkSGCai7XoXuY7u+xgDUBWuuf8d9HYv9YWjOGAJgiTfvhOL9qF7Lcu
 TLILrb0ygkEGvyp8cI0dkYg==
X-Received: by 2002:a17:903:1a0b:b0:23d:ed96:e2b6 with SMTP id
 d9443c01a7336-23dee2a09c6mr60377085ad.44.1752255643664; 
 Fri, 11 Jul 2025 10:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdn8HQaoW/XQ9oZfpcgpjf8lK7LzxLVyZK79thkB/L5CABuXts7BBynHCZ1AX8U9kj0TvvpQ==
X-Received: by 2002:a17:903:1a0b:b0:23d:ed96:e2b6 with SMTP id
 d9443c01a7336-23dee2a09c6mr60376615ad.44.1752255643074; 
 Fri, 11 Jul 2025 10:40:43 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42ad295sm50602615ad.81.2025.07.11.10.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 10:40:42 -0700 (PDT)
Message-ID: <fdc5c2a6-1df8-41b6-b0c4-5557f8e5d720@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 10:40:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix build with KMS disabled
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250709140838.144599-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250709140838.144599-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=68714c9c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Mfb-Jb5ACYakjZQR0UMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEzMCBTYWx0ZWRfXxlUd3MHwlUZ8
 cZzIBSsgczcSU0BEMQCd+qDmzqLbK9Onu6p9b9DmeUCJj0nHm3NkkJfXT40xkrY8J6OLXF2p7TP
 +YU/Y02VkyAbkTrQV8VuVYHr+NC31ion2QRyN+cZYTnHFqwGSrSopsjYe6AJ9ieP2Cs4HJ9Swnf
 qKJfQaDYZ70LnH6eTgbNVBYTpQm3Run+STFMOEwBfhFdsiOIDSxWFV9MphmQXuWSGLrDBFT+kSH
 b0oc+Cr+mcMtnrYIZynli+YOiOsupcIxN8bsGdwjGFr+ZnW8y60ha+9pD45jNPwHd/ombiUR2kp
 656+bij9HZa8ddjRDvFD8AtUZ8HJMvEHTtMgSHOZJm1JauanmnwRgpYzUU1Dyk/bW1bZsMygY44
 Pd3ygH8+yKrp5xs3n5nKlgHUdfkxYMyPM5EpahuSjvgFVQmaGwFCWM9yKDAcKMyTMOJH5x2n
X-Proofpoint-GUID: OPszPrytmW3xcBEhdZjq-MwRsYuyVJtY
X-Proofpoint-ORIG-GUID: OPszPrytmW3xcBEhdZjq-MwRsYuyVJtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110130
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



On 7/9/2025 7:08 AM, Rob Clark wrote:
> When commit 98290b0a7d60 ("drm/msm: make it possible to disable
> KMS-related code.") was rebased on top of commit 3bebfd53af0f ("drm/msm:
> Defer VMA unmap for fb unpins"), the additional use of msm_kms was
> overlooked, resulting in a build break when KMS is disabled.  Add some
> additional ifdef to fix that.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 98290b0a7d60 ("drm/msm: make it possible to disable KMS-related code.")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/msm_gem.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 33d3354c6102..c853ab3a2cda 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -96,7 +96,6 @@ void msm_gem_vma_get(struct drm_gem_object *obj)
>   void msm_gem_vma_put(struct drm_gem_object *obj)
>   {
>   	struct msm_drm_private *priv = obj->dev->dev_private;
> -	struct drm_exec exec;
>   
>   	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
>   		return;
> @@ -104,9 +103,13 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
>   	if (!priv->kms)
>   		return;
>   
> +#ifdef CONFIG_DRM_MSM_KMS
> +	struct drm_exec exec;
> +
>   	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
>   	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
>   	drm_exec_fini(&exec);     /* drop locks */
> +#endif
>   }
>   
>   /*
> @@ -664,9 +667,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
>   
>   static bool is_kms_vm(struct drm_gpuvm *vm)
>   {
> +#ifdef CONFIG_DRM_MSM_KMS
>   	struct msm_drm_private *priv = vm->drm->dev_private;
>   
>   	return priv->kms && (priv->kms->vm == vm);
> +#else
> +	return false;
> +#endif
>   }
>   
>   /*

