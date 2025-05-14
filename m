Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD7BAB757B
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796B10E6F2;
	Wed, 14 May 2025 19:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5FV9cIq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E4010E6F2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:14:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuflK020112
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cEyZrO40PEn2gGFuwvOPBFUx
 osfxunWMlYajZudAZqs=; b=a5FV9cIqdn6EfDQqc2bxiPbCMCE8E5uUlrK5r3rK
 AdJCSbaI8TDtZ52l0ts6e8fe0qLmcSnTybOxe70G2+9UaiabkP0bTyElBYqnYWbH
 /euQ3Aqm6/P14HJsIOXZ5lb8BdPbSnZyqzyDCUOho/qdvumO4mzmq3E4AayE21BX
 Yul6sIvMUfT/x2Sl0Xebh/Le5JMQ8S5ixh5cC6d+q4yGxfYBapbw5E4BRSJfGW/Q
 htNPQ7hNnRcis/o0LdJ2+A8ZMfzUpyvpdcWkRvBu4Jxc6MhqPg8Yo2QsrmK4UF/B
 sa0oFl4ft4fx/sDbvge+gp+htE8pBlENIusOR/OGI09Khg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnkt2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:14:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c95e424b62so229835585a.1
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250046; x=1747854846;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEyZrO40PEn2gGFuwvOPBFUxosfxunWMlYajZudAZqs=;
 b=KRTihdCRJ9luMYrRQ2CklvCFVav6wiNM8h4je+91GtL3aHe2dIibdiv4ed74X4LHJT
 tawUyhaMUHDzReKVs/h3T4ycOf1SSHRSaZQ92t45CNGUAxTgPRMNKQx/eZfoQtbMZyuw
 n7ktOcyA/IWyzdc+o1e+ycpE4TrVRqn/PAQw10YIGGp/CTabdzs/cqaDOxfC7H6EU5MJ
 7AEKaeR2KSzktHhCIdR+WJ1Nx57ukJAFrTzVTvmq8jcI3rJss+lqUHJ28Eupj0R9fbmM
 Yf1r9rtagD1bUxU7jthfLvz8xpuvsLQQ2ps69CGO8MQSwFMeg+dhzixO8m51cRnT5iie
 +NSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLK6izo83srNIhD50MyT9RauElZRPhaIYgk1NMxJD6fkrAEKL1HEjV6FcCUMtS7MP1WrSv93l8MOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpaVqYb9JKIsmls231njYxY3oF2b92ChTLVyJ0gTwsPQYsYxJG
 GE4SU/547Ga1eq4wf3KIYBdTsvS+n8iK5NJXRBCmhTbA3fsB98gz7PKiAr+ytB4PRrJueRSNYIL
 LG7vCLxxj0jKNlU1vWMZEQHd+xJGE78ujghFCiuIZ62fI16T3mq896X9n5y7LvMVpGvk4gbs=
X-Gm-Gg: ASbGncspwCkI8l8XN9ITZL632iTMbgWmAlaAMeGGorMf2a7g4Eoj9ex1FpO3rweVda9
 0KdUDhB7eyhiBemVP9XbrqQJ8s1v4SYT+csnTNWSNo8dCbxkHYp9YJdqk0Pk/4j+JgNZZ9PX7CF
 LCPmQWVXeiPOv9oWwyn6nlhcDHdehONTL7HF9tsne08Mlavi8UlN9aLos24HYvACMvViOIwlBzl
 Uf5HmfCZqUOGh/I9QwFmdEho0HiZo0Xo0I1iBJ9X6YpNPGxlQ+wkJ3t2dHypE+0m8plOvbLe+Yj
 5HasOehvBsyZHkOcEHCJ4vynmHsW/cNAhPzEpgssDABmQKRbDJ7vXv19aWf45CqXTQoT/ZtEQm4
 =
X-Received: by 2002:a05:620a:690c:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7cd39e1a9b4mr108998785a.23.1747250045987; 
 Wed, 14 May 2025 12:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENQD6g+af8BVweLVGomGSmit4xW6yU7n1cZOKrGyOrGWd0BKRa1jc8t5a8tIHnfZ3HWev7hA==
X-Received: by 2002:a05:620a:690c:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7cd39e1a9b4mr108995085a.23.1747250045622; 
 Wed, 14 May 2025 12:14:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645dd25sm2380206e87.104.2025.05.14.12.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:14:04 -0700 (PDT)
Date: Wed, 14 May 2025 22:14:03 +0300
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
Subject: Re: [PATCH RFT v2 06/15] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Message-ID: <wdbyamwsp6bozskerzcrsj5wt57ntuc6nwsb5rlw6e7xdk4rlr@3fcr23w3qum2>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-6-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-6-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 38QPJs3NkDOwKt7ANAIWlIEQX1pvKffI
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824eb7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-dXeqa5UtyYKIXAyS0MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 38QPJs3NkDOwKt7ANAIWlIEQX1pvKffI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX3xhhPTaff/YD
 Gj+21QHGGuhFxHfIW9Z4qVD/tekJH+lNS6q8fy+T6xw3JiZDUE0UNi+OcxN1Ti45zAUpGmXH8b7
 qhgZ/owkbEfnwJeTWdulZf/pN4VXTFIzEJV3xsyi5cQfXnZiR01OMUf/SwW94LQbXMM/AAU8w4C
 l3320IBRkWGmh2Ic+ooYnG5cAvBipDT6W6Tt3kbhSWxYioemlS4SWNjVNUlsLjKX9SLGjH7LNaF
 u8RKS5qroJb1GafoUNJ/lle5eccP4Cj6dXEq9AQGDt/ZgFaMUrvyoH1MsBM04305SCQ7s0njnc7
 pgCC6N+msjjd2xRiEg2USBKUmomP4H0aWaeEEbxJvzu9nadr1aUWyh24+zQR25wDOT9p3XPjlcQ
 a+Kx/lU9i1vOjswfQ9aWGG5TFCg/itRBdaqoDS3EF//+vyKeRLFq7HjaEf9xptnl9K1SVgIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
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

On Wed, May 14, 2025 at 05:10:26PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> @@ -667,6 +660,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;

Nit: could you please move the assignment after the variable section? It
will be more readable this way. Or set it to 0 here and override later.

>  	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
>  	/*
>  	 * We subtract 13 from the highest bank bit (13 is the minimum value
> @@ -695,7 +689,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>  		  level2_swizzling_dis << 12 | hbb_hi << 10 |
> -		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
> +		  uavflagprd_inv << 4 |
>  		  adreno_gpu->ubwc_config.min_acc_len << 3 |
>  		  hbb_lo << 1 | ubwc_mode);
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
