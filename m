Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7BBFFDFD
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 10:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFFC10E8D4;
	Thu, 23 Oct 2025 08:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwXrVfJn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D1410E8D4
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6kbax007444
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K4NgzGTqEzB8dTS+vj4Q5OscJECbKhME9FM05+rA3pQ=; b=JwXrVfJnC5SxNroT
 GVflMBI3RAKRv0NmMCdJaWepOjMtALVL9U44IHHQeuH5eWAIDka1Dgcynx5pHyzE
 WllOeefifpEOemyV6kf1p9JYfyD64jX003N7sphlbqzsgU7N/RSMmCnmSYWg4MQS
 OrgxmNPg6zrQOLn6MMSgEyrwtWEfqjaKwGLfGP+1i97SD1uYEtxeD4pypUk6xnn5
 vnZnvC4j70Q0fuQBYXT2ac3I5QywqtnfY36RLNneIv7myopRelXimm7uoV64tvSo
 IcoMVpQSWSqmtlJCOSMKtpmol3quSrgUTvX69Q8SODTVWTwryzRwmdVpKj+ZhePx
 n6JP3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3447p24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e892b1c102so2171091cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761207761; x=1761812561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K4NgzGTqEzB8dTS+vj4Q5OscJECbKhME9FM05+rA3pQ=;
 b=rjddGY72FoIAdTR6hZD2WlAtGbT7G8ygpxrhqLmy2lu3vQp5cAT93JlfiybRYJqOlH
 /VC6yQKQKvKlap2B01ZWsOo1DJEILnvbcrQ5NZUYx4N0eCqNuo8gtB2rBE97UxMbaeh4
 SJBurRldHQYHLxYM8KwoDFrilFBoqYccR7WxxhK9/JV/1NrA+KPCRtPxnAO0MYZZTra+
 +Cr22TdvApy0N4nevmh+p9fpvgt170FfU5FWqLhvMDaAIwgmOSU7dWiuPim6frWFhE89
 uCddFdImu4tkOTVhLm0a8dO0SxAkoFFhvP7fSlso3JuX1Rv/Tt4Mm9SfRLlalUtuxpKt
 qmAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYWcvwZz+kcoc7qamfKBaWhrLBRZJn39wNVBTjRu4IBvClk1ztojIKV4v4ZMjidJ8G0fyQoP7gvDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeuClJUHTAZpM3yX56Cu7TpAbYqhWNuJuMqXqInhqWV8ACZgPe
 dIskqp085DsZcgYmblKCFj/pLSDdHle2ZcKYuJW2FImUGflMHG4dbHyWyU2umXuWUZMV7HM38z9
 6PT1t2al/ByBwUFXjVYH/52277/G36O0NTd3o4fsSUgFP3tUc086qocH1RTULs03dcxmXzLU=
X-Gm-Gg: ASbGnct0oXvMIAlRkWr2ZKJ4miYs1bsAJhIAR4Y7ondW9Ty0tKB3d9gxa36SWL1Rt6I
 CRWDGqTlplhJKvxyzHGBMZy2ro5a1h/1I3DHiZfxwsk8OVV77pd1ly7hllQJ+BdsGCkYHEZRNLA
 BQ2lGSuZVjDEiVEk+H3egv0BqCB8Y1J5m/iVJKzreHaaIUDBDAJGg9SmMDKFyDRASCVW57wHQl6
 hCMiOLowRW+2PoPkv1o3k3DgBTjOLgWDw2Q83vZGjrRDEZR7fbQCWLVOEUbtzFdtH6YGPHAcUKu
 1bIO7dNp1oTHhurRoFu2xnKKT4q6aZ0S2Z42ej5lqR6xFzpjnyyZZf+SV4FsVFb08FM9Pi0/fUJ
 mDuqzLm5edbad2/ObRrnVM2azYbKGqWPXkF7t6Xt5eY0NBC1T8kPSOvC9
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4e89d1f94eamr202274301cf.2.1761207761111; 
 Thu, 23 Oct 2025 01:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEoh9odwgEcJ5K/DIdlUh+JcVJr4l9Z1HO2TW/KV5jjqHxmPJPsVObSKYBvA63wzdqXFK5BA==
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4e89d1f94eamr202274191cf.2.1761207760689; 
 Thu, 23 Oct 2025 01:22:40 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f3348cfsm1093740a12.35.2025.10.23.01.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:22:40 -0700 (PDT)
Message-ID: <207f25e9-3685-4838-a384-e6bfe6f8c244@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WOduRWEXYQVqPcy8odeyTsJoWE3pKy8i
X-Proofpoint-ORIG-GUID: WOduRWEXYQVqPcy8odeyTsJoWE3pKy8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX4i2lpivcpDOB
 TgOeiukInMl8QpGitsGKYKRlN+pQf3r5hFy9wkoZm0om77HiNIMRKZ3zK/XUlj+rANkv7pclbWv
 XsRWoX5s2BmTAQ04tVtbsQG9is141Rgeal+XI54krLGgeauGtZ64RaaAByol18nYc37WJA+5g5y
 PYFZRBStNZqEKsMGBhHAZU+NsguvMVdgfzIMI2xWXzR61p5qU5BMXzPDr3zTzp/QYxl8YaG7Cm4
 Sjxtty2OOBhV0DyrdqBLCzQU1yVl2i0JKK61Z75utfKccai7fHFE0JUkK4D+YsfpJn+kaJqwhTa
 rWuUlCRszpLmaS6E9sSqE5F4dKKHZZ83HT6qCbX9xj6t8z7QWemX5BbVWh3jfb6eF9+qum4lzzE
 63415nQ/A+f+mTI/GBOPMkvzgOmR7g==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f9e5d2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=91DCyrf_GaaWAzlYtecA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On 10/23/25 10:06 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Build the NT37801 DSI panel driver as module.

Yes, we can see that's what happens in the diff below.

You failed to state the "why"

Konrad

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8cfb5000fa8e..537a065db11c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
>  CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
