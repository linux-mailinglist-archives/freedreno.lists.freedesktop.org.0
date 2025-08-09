Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D9B1F1AC
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EF410E204;
	Sat,  9 Aug 2025 00:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdaISzC6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB77E10E204
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:38:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EkD8x008382
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PTg6UPUR4TJzotk+aFNe0dYyDOUiRVQtN/7jSRoavTs=; b=LdaISzC6Mk0H1f3L
 7wMT0DTVRifFjawkSDKdtlKTtj9B5XZw3HSXv3Qh036YEhFB9Gk6oRvW9wDquURO
 opBBDh8NxQOpZinl0H7xKsxepoD8guczKynrt0ZcqcOdWLA0bz1qlru7VV5X4ggR
 XAAdsAW/428KfD22FTODzhwf4ugbT3kl2aXmzPaoKkBFCfVQRpabZcB/NyZqCdog
 6GuYU7Ia+UgQ06g2Kre+QDz7pB3BsiVxTDYg/N63eBkpU8f5ncGBoJwLBjEUfBu1
 GgaA34FlsmBS43Y2UVpaZDHBxwLrTB2VFFvMlYUFAiGTrVqIvEuJyNs9NY6uxzvg
 XYQYBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u28kce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:38:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4af117ffc70so67143461cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699908; x=1755304708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PTg6UPUR4TJzotk+aFNe0dYyDOUiRVQtN/7jSRoavTs=;
 b=ZFlt9NtD3F7u8NuSYBopblsj7WeKKkk8e3NeHC8hCInu3aLwriNaB8DaKD2wcyFAHU
 ZKzl/21vWniDOoHWf7aa2SP7aGtORy29vJ/sLMlD4jRJfatcXp7Ex7fxact2U2dJZwQq
 4OSbzfVqD9OHOjirVx8DkjuaRj6EeDP28K5555s90eOlNJoH5tNesVHJKUQKO7gUOIBV
 M434U4LGzoXQxF41g62+io8eBa6XnJb4omGnSvMzb951Q8WrQq3NkKmYXxLCL/WnHDIE
 pwIDwTpYpjaM/hI2/7GAAbL2o3K3C6NYX+uY+kjxEyIzqA2hO4UWm6L1uUsEyg5TI5Q6
 KXaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCY794sOE31JHvCjtD4dKEprdU09IcdW5CAtTZjIl88oqAKCAY6blbNSNpT35+7u9YHB3fv2O8Eeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy29bR7nCqb8/Y5Rq3n8l0sl6W/9Dfy4PSoLP+uKVS9LzukUHWp
 Abyw6BiT5d/OWvjffc3iZUxbhJ076KosKpOjA0T+cqkruytUzhilWSyrZpJ/U5+j6pyA3JLQqJe
 FMRWVIqSzda2gMbJLTANondN4YfCKJ4kdhw+lXdB+GxxQZfYmSnX5P834RismurS23TE4MPk=
X-Gm-Gg: ASbGncvHTJanJ8piUG62KYIUyh15oq+3FFDEoTf6/o6oivQln+m7Sk6eVHoLmmpbcgm
 iPnDqCZ9NG+k+QZ7FqhhQLkUx7J6pIwl45xrWT+pfbdxU77CCS+B3mp4ESTUgXfeF/fyHCdmAdO
 2yuUWU/t+uREtQGpRXQSH5DiGbY1uDIQ+xtKaprgN14Cvs3A1hZX6Q305fyABgyrfVCMCHakpOT
 SPP+22qgIaSdUnW3D1TJMQV+ry/wWErUNn4gKtJfPu3Rmh5iyklTwiXFal6y6EypxKR5DoDQ5Pz
 WQUZN4PKjqXq2Iamiwda+PnD5xmKVpLVAaAhNlt7MdZydtx0hs6iVvIA1oA1W8cLMSJZ10HLnux
 ilnkeYA4X30UrnoR7vK6beCSR2k6WvsRUHV/1siO1HiA=
X-Received: by 2002:a05:622a:4088:b0:4b0:8e0a:f095 with SMTP id
 d75a77b69052e-4b0aed6b5a1mr75846281cf.26.1754699907719; 
 Fri, 08 Aug 2025 17:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt0Zzzi3J4BDnMVp/K7JP6Y2aCQjHuVGq6KrsN8qluameirnzlp9r1HdWb2M0KJC5/NMX4mA==
X-Received: by 2002:a05:622a:4088:b0:4b0:8e0a:f095 with SMTP id
 d75a77b69052e-4b0aed6b5a1mr75845831cf.26.1754699907027; 
 Fri, 08 Aug 2025 17:38:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cc9af8413sm13671e87.28.2025.08.08.17.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:38:24 -0700 (PDT)
Message-ID: <200ee7f2-ac66-4619-9401-220dc578f8d4@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:38:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] drm/msm/dp: fix HPD state status bit shift value
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dj28M_BWbcLpfhV3Xqq77lEzFPBC1_nr
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68969885 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tINfiVESruKu4bDgj1EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Dj28M_BWbcLpfhV3Xqq77lEzFPBC1_nr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX1RwBdCm1Ta0M
 MZx7M2L4jgzGVOGuKbqe7zHowIdPcYLOUMnMEFzdIRdkewrEjOKqPLmnbcsw96KSeXzc0bVKnHK
 xoSgVDbvJ4HF+WgGb4S7NO0mm07mpmCt9DoKfA9gAnLg7z6ARv3X6aXcWwLkdnp0p/RZDkhqvsD
 ARXvQFa0aGaBdPDhrBhUUu+3a/FppPwPjN3El/S9rBYtsZ7OKM9EJStcwa6pxY2KNTh6AO7KC1r
 vQ9uTPfTrYbbtig7kSTjDspylwT74HaIudJFDyoAPJLG4N5S5KDMHwRGd/PBGJy5+r2lVJ4tWmu
 EDMxAEX3YyKU/VmEpQCDKnPmUD1tYyBdZ8RmvNLVVvCdDvb0HVhz35+OMYeCSCPJnGr4Ojd2fDq
 F26Oen2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/08/2025 03:35, Jessica Zhang wrote:
> The HPD state status is the last 3 bits, not 4 bits of the
> HPD_INT_STATUS register.

Then the mask is incorrect too. Also, I'd suggest using 'most 
significant' instead of 'last'. The latter one might be confusing.

> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_reg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 7c44d4e2cf13..b851efc132ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -69,7 +69,7 @@
>   #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
>   #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
>   #define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
> -#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
> +#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
>   
>   #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
>   #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)
> 


-- 
With best wishes
Dmitry
