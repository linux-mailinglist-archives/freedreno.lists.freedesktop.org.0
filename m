Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C3AB7587
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E2E10E064;
	Wed, 14 May 2025 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmK1PI8Y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394E910E064
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvNo002539
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vh7H0yLxNzQIQl3kX5HeQXht
 XXVVGd4YVC324hHcq88=; b=BmK1PI8YpbDEFywyps9bUzBkXATRBOuoq1qk0J1k
 8HDMFeHYixJV+zUoheAkidxTdW0/TLoprYNSVsRGQJEmYwU4d1vXhwCu+jdaixZI
 dVxajHBskTn4upXzTrA+83Spo8PMXNqtD6qHolFpKpxBOy0NZgvww0Sn7Rm8OLYK
 BpHt9A/2Hq9236dbMEJgGIpKjDIRETNPf01wt7MYN14GwzxjrM7FIce2JgKf9lHB
 /+WJmtdtlKHPxUj72Au/adN37tYcYIlaMomwVITGXokwF3THnN+VLoWScIcaWxVs
 B9nNh+S+BPhhfbrDNVa6J1tZ84TaQUaPMt15S4ZODgi7aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3tkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so24967485a.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250099; x=1747854899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh7H0yLxNzQIQl3kX5HeQXhtXXVVGd4YVC324hHcq88=;
 b=VM42nvqu49jPyCAMfczstGTdxGx74SdaucGEqnP0vf/YdAqnknbm60Z8TNBNQMBs+G
 rxCGKY7xmWQKU6ZI4FwHyjLaj7XwYRDblgnP3RhVWTqCa5jE/c2oxpQ9oJgpE6JcakQn
 uN2pq5TrZ7fgJRoyR8JNzzU0n2M2v68+OmtKwTi/IvexpOoVKzn4T1ujNX3I9yL817dh
 0JSyah095N5dHRwdYJspLmCQB8pUBezpDj02nLQYfHdgzEq9VgxMMO7M9PX4hnr+lxm1
 kcDlQNt7+ILZWuP+XFgJ25b8N7H5C1yo5uO1qE5SpIBxBqjvbBKBwlyqdVC5SbKwkGV5
 7IdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyGq2sFZfyiK6UPTLdUmkkoGUkgZaUATIlBYri+t2Mm4cAadz+WcvkK5trWzCk3BSWHwVPxaWwR4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3BAUansNO+KRfVe5NXEOjARh/8QLFOdEeoZdKvOWSazWvbYVt
 R2aKxka+S21JbacHkHTNn+fjxsVLIgJxkZtRlrCs5rDHZBDAxRwtWNYMUKFEWgxmv9WhQrPrz5n
 jOIDx+e912BEkSrv/gWOQ1CzHfQwpbslPAmLCHbj+fa4GAIIEe26ANyDSTf89uFIKGaA=
X-Gm-Gg: ASbGnct/noegjEuBP61D4qyYxnHJownfgFOnuqv3wH9xl9SEgRmluU0T4Ht+MIEQIO0
 1MpjA15RAV8s3grVtxFplTAPKqR1ED4TXiyDcpU7qwKXJ70aUXNzgKSSNSzvAeKrNtqrPtky+Ex
 xdZjj157lS21H3lP7Snmewje5PAwTbJRLvpwasHXaZxg1Rzi/EcyGulqe6zOkZ3t0TSmX9IkgZE
 ShFN0AvC9AGFKGWlj9dMamznjAsa++483qRGyvg276zS1tiLouNfdTTkeqNMkjXOjPz7mCmnIp/
 ZQOG4/+TqLEYq9rnYOEP1tXkq8+6K5TP/KAMZDfSN0uN3TMcuNIneGLudTtNadBjSFlGWa+zrVo
 =
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id
 af79cd13be357-7cd287f8e29mr760419485a.8.1747250099354; 
 Wed, 14 May 2025 12:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW1uLW0kicqfgbHoNdFUn95rpD1RDFnA/XLJvVUD+FX4xES0n5KnnFI6QYVl2bk5Get+Fxgw==
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id
 af79cd13be357-7cd287f8e29mr760414185a.8.1747250098844; 
 Wed, 14 May 2025 12:14:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bee73sm2349244e87.162.2025.05.14.12.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:14:58 -0700 (PDT)
Date: Wed, 14 May 2025 22:14:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX/b3Io8PowM1Q
 0k+EOAsHAKx991e+nNDANDIUcxX/3CWdHKAcMpGbG6BhQ4dKr/LJp5SRgsaL031FBv7CoG0uVys
 xPRy0XO+FNlchikLc2GYdT7qtkW/vScBC4rePYjhEUtMiEJf6nHqLTAlwvk//bIMtBG0idqw7TR
 +BPk4XdUJz5lP15BLjI4oybpATGshcz8SfxY0ZahYlrEE+xphmQ2ToehvFPTof5p46VK+dv1cO1
 y5K7ey4v2ruc+bcU0VMc5txrXr8sx3T95QY5Gqei5R9o8qZSAityPO0+zXHSN6cIayJoQYFCY5q
 Z84GYx4qOGA5dgmYI4tZznQhZo6pSwxY14aH87XFvyK68L8xYttOV78P3+1R5sISMJTfpPxiVnJ
 UhhDiQsYr4+0AR5FsTGl6p6NBBcoarRXpFfRtrxwuZNOx4KKIWyKXXyA2JuYdoKStdmdjlVG
X-Proofpoint-ORIG-GUID: Kb71VGG2qVdnPiq0cePKombsx8z8mB-Y
X-Proofpoint-GUID: Kb71VGG2qVdnPiq0cePKombsx8z8mB-Y
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824ebb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yx7l2LZIIY2QNE-vfc0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140175
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

On Wed, May 14, 2025 at 05:10:27PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd49f2889be13c9780d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);

I'd really prefer if the function came in this patch rather than being
added at some earlier point. I understand that you want to simplify
cross-tree merging, but I think we should also simplify reviewing.

>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>  	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
