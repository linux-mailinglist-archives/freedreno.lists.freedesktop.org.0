Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3686C646B1
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 14:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6C510E3C7;
	Mon, 17 Nov 2025 13:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkHdYpKy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ppvt3Aic";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D41D10E3BC
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:41:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2KCc3916355
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=; b=NkHdYpKySJIqD62B
 iLM+aTqSWr/EqWltK4xwbCyZRhPw79ywpwhzIYfQUQOVrggF6baAGuIz2nuKN4Al
 ElZ5P9UDAuMxgiLjfCZN1Bha9R7xshmZvHhdG6jRngHrtmjnarTjgAn5BGJPHurq
 uXGRvhAw/ceWxizANbFEQ/SZxs629YCGC2lPy3KUxEGQa02XFtEsyxn8PdQBc6cz
 4Be6WFPzuAeDt7BeEGsYkiibpbAZ/no1LZUlTZsqq4EdPNQnvoGpv8EDdYNE9nRt
 xi3YNM1zxuxUsL7eU6tsw+EcCc/447db+NioZVYy1rs/EzX7NA5qW1XQMvvxvfhk
 749AIg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx8e5g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 13:41:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8804372387fso14832796d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763386905; x=1763991705;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=;
 b=Ppvt3AicG5BZZdd2w5bin9Mw/O10B+aA35JQLXfyrcbQl3m8HQaSyq7zvss1c5d9e7
 q1vK7iwimQTdK1cTBzd0bBMIkdNCI/kNhOY1tShPkXOIL/p5NVcilSlQRE+pVRTYnuYU
 +wIInIOTXSYUO6PeJLv0wAkM4bt1cbILRIYY1Qw957dUPJ5ev6EaQPIlLBEhX3TaeMR0
 o1I1dtXaecLnK7KT8Z88S7vK9juEwAThko92NlI0NYAEFcZj3KUMPI3GRn39Atkw8ykV
 E/g8IOKK63Rz8LrsFXQRX80cZybVbTFX68dLLdZOzNOEuP0Lm8MhcPeNGnlpbZt8Da67
 xbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763386905; x=1763991705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=;
 b=RVscErHsUF7CoIIggcvxnX7o+jo6njG5XNGN8w6NTUJd4e4ldtTstIuUFQVo6wcUl4
 7kD1+xHzKTnqa37z2XhskVTlf6w4IOm3aZil+rFSuqwaWPbXgEHRLOde7WJqxdSzCC1V
 zXk3S4kUvx5n2WdsqFU643psXS+1cUXgEgZ/igcHEoxiFoaYXImd4sQGKAofFU6xFysW
 HZyj+lih31F7jKFZuG9GFrp6d6gpHLMw8kdupiZDf8YP/8mZt4Y9EFz78Mx4xTlmmB5w
 8ro+Go9UsgeE7pkaGDdepifrBthzhwkc+sucQbljxkXUFbDRey6ZguQEgg+3lU6lB8YG
 uCxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOsMpkQWZ0WJpcvgi79FbYxgdznTIdMWjh8STA3nq7sSHCR1Rgt/13psxga5cyX8wJqmcOZeQW/x8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG9n8DWiCvaIiGYlNmTddGsNn+layZOvXwbCcjCIh6P5+Bdt6X
 47b4EHsqTveWwE/Hw5xD/JgiOffh6/9hq0zG17eERoO+RmZT+dnCKE6XVtYlBK3TZkINLYguS9S
 oueZvrWFgOGa0essjhZSo6VjK2a3CPKRXeOEEBPC22ApMxgELIn/Fhau7nem1LG5mzKNg4cg=
X-Gm-Gg: ASbGncuDE+FuKf6XFzQfNpBTjfTU4Wl7LZhi5o7UAc1lffzbAK5c8MWYTtrkw9e0PBd
 N3Xeni6hjmSPYAl1h6chzz11m+oP5zY9W7t9SfLOuFgwCBDmd/HNrAIR0WGWi1/RDF2k7p6s77d
 FeXEscpe4VUsjEmzDBghkVea+FgafAiO9ghVsVZVDTiKmlrO1kaAeGDA2ka1J5jT/VxGN0Madmz
 9jRvF8CFnynFLtvIgC3lk88W3bDih+UHGOuGDR1EVhSJhtVHE9iQjbnTpkLiemDFdifO2dtgDt7
 3uKsr4SgwztLzAkSXl7rAXpxV3jLvybJbgw+CUa7JvV/vKLruUywQcpDQJpExm/HVEOkwPhJz7C
 GdKijstTkoPss04dtRVdUduzlGl5X0l6t7aNVtANi6aJTIC6KnspkdDDz
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4ee1588686emr42334491cf.11.1763386904652; 
 Mon, 17 Nov 2025 05:41:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXjeOnWOqKRzGv7+Ux5gt6tTZvyWI1wBlvFc4rLJ5C0QkL7YdbAjBn/AYTf8fPgd9jvCo6gw==
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4ee1588686emr42334251cf.11.1763386904241; 
 Mon, 17 Nov 2025 05:41:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81296sm1103136466b.6.2025.11.17.05.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:41:41 -0800 (PST)
Message-ID: <d7bcc255-b922-4ae9-af70-5757f17100c2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Alok Tiwari <alok.a.tiwari@oracle.com>, jordan@cosmicpenguin.net,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
 marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Cc: alok.a.tiwarilinux@gmail.com
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LOEtRi7bb8M62ZioaIjmktdM4yyS3spP
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b2619 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=73rUxmhrSfcUVL-5kvkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: LOEtRi7bb8M62ZioaIjmktdM4yyS3spP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExNiBTYWx0ZWRfXz9JV1laVT7jB
 q+yEu535pvQtRlF4LM9MtFzzzZBTCui8NFjNRfAghX7XZiVY3c6QjnnzYFjoOJS9f9v+TTpIfAK
 Qx8SUMdt7o3QXPFQgSvrN5wKdtG1FIwt/aazcPk2Mq6iMC76zEIz/UPMfpQjd67f3agBchJ9uDe
 z9LPXpSa0Pw5jNIQ5HyTEPRye4wuEiYx/lFguVfsScCeoQkedXCci/MO2mTVQOKZO6p1Lf5rF5g
 Yz9DPiv29NP2w8Zv7zM6S8nXBioUDPv/FcN873vyZK2anO0+CxlNbqtI0ivGP4va6EZ1ogvcMVd
 VMSMDeHt+u+cbYKhYGfnWbeMSAECZ9n3aVev0QTC8w6lxqBHFw+Liqs/tH0cU4VztkDGjqUJjNu
 ZjuxXAucYmnXW7YuL3nhcDmZqnqRpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170116
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

On 11/17/25 2:25 PM, Alok Tiwari wrote:
> Currently, a6xx_show() dereferences state before checking whether it is
> NULL or an error pointer.This can lead to invalid memory access if state
> is invalid.
> 
> Move the IS_ERR_OR_NULL(state) check to the top of the function before
> any use of state.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

container_of doesn't do any dereferencing of the pointer, it only does
ptr arithmetic which is ""fine"" with a random/null value

Konrad

>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 4c7f3c642f6a..e408e1d84ade 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		struct drm_printer *p)
>  {
> +	if (IS_ERR_OR_NULL(state))
> +		return;
> +
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu_state *a6xx_state = container_of(state,
>  			struct a6xx_gpu_state, base);
>  	int i;
>  
> -	if (IS_ERR_OR_NULL(state))
> -		return;
> -
>  	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
>  
>  	adreno_show(gpu, state, p);
