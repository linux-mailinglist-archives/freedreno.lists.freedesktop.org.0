Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B9B10DB9
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 16:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D859810E95A;
	Thu, 24 Jul 2025 14:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKqqmxhd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4EB10E95A
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 14:35:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9XOOn006573
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 14:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GJP5OrXYtaNIwr5c3QE7nQS8J5flRoXRt0htwVVshBo=; b=nKqqmxhdhfF6hIJl
 JlHtcuALY42H9cVgkN6/8wF1vLCv07fNq1T9kyur2pJBO1u+51WxEHVhzwD5Sy6s
 aeN7gXGM1t+h+ZEy4BoiLJMyWWdP3XEfUiUZrZXTBImWC7M62ZigRDh7bVq/fCkT
 CZlk/h8ggAd3NXqsY8kxC7Ceg/Ab7ZNtqzKXOTnNt4dn3NVSEFbSP/DO41BZnvEy
 2TET/tNm7pCgwYn1hqYYyNO8RXYoVpOMPJylEsQhrkUe2Wb5Z+zxL3urkZ8VSQfL
 HOhq3Gtegu4wXHwZ+hFdmEUaOQWh6LjCJfrJIlXL0Tf1ThQ9Qm6oG6z+BePA4bXh
 7Yphqg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qh2rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 14:35:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-75494e5417bso1208087b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 07:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753367753; x=1753972553;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJP5OrXYtaNIwr5c3QE7nQS8J5flRoXRt0htwVVshBo=;
 b=MAR+cDvLUoVK6Pi/r0KayYoV+7FvWYl8+WYDnfXgyyWEnKf2MV6pmpzqgl4U4RApUf
 N98KRYnKg33RL806rRMFf1NF8jOBgnZlMqhg17Vb+MdJuAotLM8YqmVrF3LthMfuA7oJ
 C469dr6tDs8JVqPZTyAb4kZz95WzAg0ZXqzlMPcaBNj5f74oCnIg8B5XuVuGyUujN32/
 sAdsK5NzXq7pWmilBEz1BhVopFO9Z8WjpLyQCTGvUvWZ7tclWKAQjbKTjj0iwDHRrYOW
 hDgJAMpbf3a4kcBtSZuUKmpbVcr+AYYQYzP0LVyyH3Q5qQkO70vwLvEPniA8jew6N5Dy
 ClYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW62ZLFYAQQ3wbnR7OxKJx8QaRKsZbTVIqiTzM8yaE4itCsckAHwKwXxYb+8DM5nzv/WwyYmc0e5Es=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE+nc7LlrK87t/BLdEeziymMA9DDlCu+1TirzSF2YOWML4Hulo
 zXHXZoeZfZPgtTRrPWZrZGynfeEiqDbaAEMJgHURa5isvdFSeIZzxYaUj49aufHenWlGTTC9cxN
 wcwAe7xvUhWyUZn0ByAzcP2vKsOjmTqupU0jb7i6U7VotpJepOwzYF/GtHqAljBnhy9dXcmk=
X-Gm-Gg: ASbGncusPSFzd/bZSKSWUsDRY4WvswET4A0LQcjRWFZG0zomb+yRa1i0dN6oOSspNPj
 OG+xM+0PuWxMaBMQK5RB0kM+CH+cbLSsvs0iqwuyFIQ5bX2EPYav30Q75AvDgVfMuDjDeYSIQ6U
 uPcMatyNmcDOXZTKgy8PBJyEhWBubVymyIBN28ZmTHuLns0n73F3GjVzw5AUwFRWtR720b1G3eF
 SLqXKsPTBHEltWf5OVyGdlPmFWT5XkkCzHWk3SiVF7ePtRqskd4c8uqROTbcATLDUvMACDmD6SQ
 tW4kLlAaVNOIvqwcOyB9/BtlsL/Z0DrupZdqVfMIukl410MnrGDDzfML3DMKOw==
X-Received: by 2002:a05:6a00:8b8c:b0:736:4c3d:2cba with SMTP id
 d2e1a72fcca58-761f0aae747mr2193512b3a.9.1753367753110; 
 Thu, 24 Jul 2025 07:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErsxD0US8xYnn5Y59yyRl45GxrphsiOAnuwC/zARlLpy5inA5mS3Yzry3LPCBjaE+Q2UR4zA==
X-Received: by 2002:a05:6a00:8b8c:b0:736:4c3d:2cba with SMTP id
 d2e1a72fcca58-761f0aae747mr2193469b3a.9.1753367752353; 
 Thu, 24 Jul 2025 07:35:52 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761ab41dfe0sm1775131b3a.0.2025.07.24.07.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:35:52 -0700 (PDT)
Message-ID: <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 20:05:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMSBTYWx0ZWRfXzFwjwdUtTJbV
 0KJuvqeZ/T5NhfZ3XZREBJ18r2HFqvJEht2Dwkcz3cs2JaZYFKpCVAR6kTTcIYwic3DSmZPo/vH
 tJz88lTRRzg3w0nb+NreHlCRfJvxUcQZsETtAACntGdXDBZ/HDHB/RnJFlSBhgRqkhul0PKwnll
 zLp8sGjWoCPzQjtd9Zsyt4MnHFuzJcYGK+Q0uUuYyqzHYAVLvDA6D1TFIbBAZadl16l7e1unti1
 ObGvu/qrV3liCkDVuxrqv5R+I05u1TdUwJxwKkAPbtfykJVgh/Ue83ffKXMGIb/jblqgXsw884o
 xnLqFm7D9hDLLRpUOa5HJfdu0wTOcOoDCLHo6ixxk9y6GgdlmYH7z2IUbp/xQ0Oc9pTEGW3y1uB
 PZrnR1H7mNFP31+u4ls4VegjgbGS/kXq+HFs3MRN3kO0VwhhAkOgonLEuB1LZVbPRWa5qhoz
X-Proofpoint-ORIG-GUID: MMN--r0Jc7wY_9FOcx783FL86mIIWpup
X-Proofpoint-GUID: MMN--r0Jc7wY_9FOcx783FL86mIIWpup
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688244ca cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240111
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

On 7/21/2025 6:05 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(2),
> +					.perfmode_bw = 10687500,

This configurations should be similar to X1-45.

-Akhil

> +				},
> +				{ /* sentinel */ },
> +			},
>  		},
>  		.preempt_record_size = 4192 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
> 
> ---
> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
> 
> Best regards,

