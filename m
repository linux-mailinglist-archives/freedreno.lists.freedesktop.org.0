Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97245BCE3A3
	for <lists+freedreno@lfdr.de>; Fri, 10 Oct 2025 20:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5D510EC72;
	Fri, 10 Oct 2025 18:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EixBlhDP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7194810EC71
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 18:26:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFaINn012113
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 18:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wux/efAeHzCjaBAhhspzOVq9mish0P7Dal7te3lz2Gw=; b=EixBlhDP/KgaxFaK
 wMFeMm1eHoIcmfag8ZS2MDWMvrIqIP+jR9UrlHyAQdju5mX0uR0ri0sRtqDTdD0d
 Tir++onkLRBk9Jd0WgwH2mWpHxsXm2n1jk/ukicezla1H1rMpPT3QT5FHFCKrIXe
 REQbAaw1Crwpe0rlQrGngL1wfhf5K7TXD/zFAQXVcHiIjint0eZR5cCf/qEDFWkM
 lZWCDDoRPOQJ6mdSGKI/ZIMh9PdArZeZmcCBDb0ecBms1qufA5gCnS4fAqGDZ6ne
 cPZoXWWSdhB3Q4A68Frgia6uqrPohyc/TnRauHcHGeh7rr0k+9oMdzv2L5qEbU3G
 f+OSoA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49q4x1gfc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 18:26:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8247c6738edso9103276d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 11:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760120817; x=1760725617;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wux/efAeHzCjaBAhhspzOVq9mish0P7Dal7te3lz2Gw=;
 b=WxdpRyyzmoG752cdLyAk9hCkIgPIq1sLQ1OhJrBTaiP2F/UCEA2l2AtcqfMF58mbQQ
 tuXn8zNcu1hRp6HciT7U07sHWWnrneTBdRrZoRJQXSVYnb6PTFiH1wRFJt4cFnwZxL98
 3P40rJaqgiYHqVHcIHKsYQ8+oKdJfSAIcgJHrfVGVCpic5QMhtE/PA4VGJ0gwyvMesB1
 H6FRUIcjwt+IuWChIhO8C8xZ6CQUHhgFY4Q8sUtkDb/CN+ZIekOu3VAOcgYv9HFVpSLo
 aq3w5/RsNhPozUGARPs1AaY1+2jNpr+irkhZB/hkx0EAe0oH4kSeHdRV4FxEWbP6seFS
 mNGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW87RWwlbrbjnqzK53rtIaI/lsgUHpVdOHdQ8fZOKXKu/Z63S7zCcvuh+XXymuu/RdHrwORz7AiRC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySYy1NJ6S40Zc5Dz0Flk4+Aj2koomOWVFcDqvSU07NvK+MUuOU
 EOovUBZRKQ4K65qweKY41bMEdpwp5CMCUJUKrifL72OeWZrYk41XEvdAOKv59KeQxlIUMmDBDOy
 zLbpeJ/Kl2QTBoOTNnZ/PVAeOmQ2jJf/ye3wox4alEWyxR9M36/+uO3LYPgAcUGm3cH5M9Vk=
X-Gm-Gg: ASbGncu0vLf5F2uYhFkiXMC4wCHcmXY3mN8xb5Fk1zugTASpw0FyC0fmLQqmEqSOaj3
 e4+CNuZAr2epqCt9dY0D/e8gTURzArRhTmD0jVYy1sqLln6oIbJCSUhV5KxsMDg+pDZnb/CfTaH
 O256fTB8UNWWYq+jwIiyJmGShlaJ8QEpLDN+2Ti9o6qOBLfwWsuqmJVhRq/aAOrmhP0TFbT3E8D
 CMe1r6T7Be054Gha25NUrqAotZRhg5if/K0s/gp89HVBmwM7/mOUgakYXuZ5Sry5n3yTZ15hPP2
 qS+9TPrHGp70ue2LrhVrSjPbBI/aZT5jLVDqxNsOscmuCcHWkPcyLrOvILvKXCvp51LDGD1UCkn
 DSYJCVtOgjhzfMrnz96NB1w==
X-Received: by 2002:a05:6214:4102:b0:773:84c1:396 with SMTP id
 6a1803df08f44-87b20ff9b56mr118583346d6.1.1760120816762; 
 Fri, 10 Oct 2025 11:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbv3DZ79BE34Kn/wUGZkuQspPjyI7j0FCaMJKAoltlhtem37CFBxGiGcrS2O8G/hsHNEwilQ==
X-Received: by 2002:a05:6214:4102:b0:773:84c1:396 with SMTP id
 6a1803df08f44-87b20ff9b56mr118582886d6.1.1760120816054; 
 Fri, 10 Oct 2025 11:26:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5235dccfsm2882274a12.9.2025.10.10.11.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:26:54 -0700 (PDT)
Message-ID: <3e098e06-0ee6-477b-8a52-7370ed37b36e@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 20:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm: Workaround IFPC counters bug
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MoAcFlgttWBIYrHqyi_wBSNn1YvhtK51
X-Authority-Analysis: v=2.4 cv=N4gk1m9B c=1 sm=1 tr=0 ts=68e94ff1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=3vACEWP1_XwkJBBmlSAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA5MCBTYWx0ZWRfX7cTzPTOuJwY6
 DZWU2j5B1W+J0CyquxLHIxLNt0JnhzN5OwRrgDlvn8FrT1TxmeTUe3gQ/Dr2nhVckDWEcKs1iR+
 Lr0QBB+3rHeG1HQTy12P6XE/cmFDpQy8n3c4C1km+tgNscSHeB28WDY3RyTDsTuzAcui5+p3c2y
 D5cx4zSNFcjcIHD6KJ+Gf/qsWqN/xWWGLzxhdpvYoTV8Ob3qjRiIRIfdhhQHGxBOWMGoSsD+p40
 b1iblzA9RKYvhdd0r9Q7/oNahSUG464+33thRaXM8xVg7vChHd/fqeMwkGGwFSbKaS93FmB+kCP
 wJ7WRVHD9DrRYYBWU3h4Gbj0XBoFE+ilR/6Q4yuUx0KIKdGR3x4Zdg0SJqb+GyHECu5W26RBLkJ
 JcdDHXSOCKodm1gAwLx4r/dozilSUQ==
X-Proofpoint-ORIG-GUID: MoAcFlgttWBIYrHqyi_wBSNn1YvhtK51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510100090
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

On 10/10/25 7:49 PM, Anna Maniscalco wrote:
> When keepalive vote is set to false IFPC will be re-enabled even if the
> perfcounter oob vote is set.
> 
> Workaround this by not setting keepalive vote when sysprof is active.
> 
> ---
> I have little confidence that this is the proper solution hence why
> this is an RFC.
> 
> Hopefully something better can be found.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index afc5f4aa3b17334027f3c20072cc3f059a9733b7..975b91e2c439f659b7f716cff87f73d389641d91 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -191,7 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> -	a6xx_preempt_keepalive_vote(gpu, false);
> +	if (refcount_read(&a6xx_gpu->base.base.sysprof_active) <= 0)

This returns an unsigned type, so you can just do:

if (!refcount_read(..))

Konrad

> +		a6xx_preempt_keepalive_vote(gpu, false);
>  
>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>  
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251010-ifpc_counters_fix-8bd4470e6351
> 
> Best regards,
