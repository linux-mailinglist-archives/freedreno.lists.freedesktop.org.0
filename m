Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9269D122C3
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9432110E363;
	Mon, 12 Jan 2026 11:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJQHfpSe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfSWMMvt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B7110E363
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C820Gn141546
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=; b=fJQHfpSeuBqfKrpE
 +U76b0Y/C5CNDcOEO16jhYn7gsUWw5M5SyfoeD7RZz83e2GbkjBk5j9Z5HHNJq0o
 7SXY8gqctzhAjSqBIX1uxwTB1VkRfZVwnqkO/49Flw64eDiqYtgjK0BFoyrw+qU5
 uLhgS4+F58sOUhrT4B6gWwAUgjPQirB14Ky5Xo5Q3oc2udvaQ4YPgML0KFm1gbkV
 6ayXwkjzQjRphjlfI1zAc4ipzUfNMy0sSLvZtMj6AUB4FA1eOhiM6+cxP1KpLBaw
 wvFnFv/Mnde00HLfaZbenRF9mj66huix+rlXmnufKcypQY72FWCE0ME/1xGpPWVN
 CjQp0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytqm8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b196719e0fso210308585a.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768216097; x=1768820897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
 b=UfSWMMvtBaIVtaUz7oSq8DBiVw1ML9fLPuKkyvKg46+fxHqpjT2cmf0lxmzMw32zwI
 ErHVopYc6NBF4NmS7/HF5ft/oxmb6s8vXLszL9qk+Jdj83oA9HuIrxtrCjYh3KLjTYPm
 iTixKSVOXtFmZ5/wMQVxxxaK6E/o14AZuctLwJ+0d6+f1QHmvckyWq2OhbFlV8dxiDWu
 4x6Z2VautFUahhfisGDqVxGaGRZWAh1dhUdfiI8VpPL/USohqU6B0qCc02WcwSch7dKQ
 Vg39LoK3SAKR2PPWn8O0HjM1H2TAHVZZm359ZHKW9FQwE2LcIG73lOiOnklUXZn2dsR9
 Etcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768216097; x=1768820897;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
 b=WRHaZU/emwnwqaRjrc+SNhArdr9S2QHAepqwnYrjJ6T6m1lUC/+SJk5KP1VDBd6vba
 win3K8hNJzU13E2zzV5j8sLUNmu0smWgR1jz8f4d5KmdcMn9CZRtA54x2orUZsE7PyTy
 UCoCO691eBQaytWLQxUyXfRQwb4wKIZpZvmaHQl+du3swGiMH0LU6m5XrsICfbzeJwIm
 ZJHzn3DiVYlmBlEHkOpY70QagrXcXx8QpXTzUn5saw+X3S7FX1ISuyOABr8OSrLPaC2A
 yKZaPV52EPjXf/8WSkMC6Qj1RBIvbT1GuYD9QKwM1Koku38BzhvN4WO8NENt/GKmnTXo
 pYXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSbtkS7ZJ4QjZnheeHnFcn2U643Tg7SuOYmpRHvC59jkJk/u3YdgoRFgNh/ZaqiBLSKQhAnYMeSZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdJJ56KOQorqcVUOBzeMeSrScRcbHMFJJULeru2SUyUJjxTNvK
 5RN1L7ZM42VdZwAgMMSrYcvEr8aelFToLx5AwcSHh5s+Khn7U7gEwmCEY3rWmT/R+m8+w+2/9P1
 tHAljU9mcgnsKPhGFVcgrcjDbwX5A4WQc8uwBTvLQlmgdin+RyCLo0RMzKk0aGRmZuIA/NdU=
X-Gm-Gg: AY/fxX6V8WAo2HNUVjK68d0vi39GCocP87azIeiWDGiIvmvQDL2AXuNt3cTDGF21ewe
 HEFcpcGko8aT85jnkshFwkyV9/OEwS9iauZNVO5898ORp49bsIgiyBQgd7ByyHbqm9Ou1aCWUJ/
 KBCjLYdriCiVeD8gYMmB/XagM9naRrVxYEI6YIsn6WuRNz+wQu2+CuzzpFXDm6LmkSJ9w5vIbk4
 jrz28wJtJ48pX9gW3BROA2LUDPT38RkVJsdufvX1BfDyLAGNustwq2OzZd+n9+yUvbNHmQ+1vVW
 IcTW3crTdNz3+4mTbba2uR9s2govHjxQixtBIeYW3xRi3bcrKWmCpGV+qFHVcCxT/xMWCHJ48Sw
 SBC24fUbWAGb9U9UvYj8l9t2fw1D3KX/daWEsITrxuJhib/DI+GMEtm7Sx3FG7gASXpY=
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id
 af79cd13be357-8c3893fd199mr1758456685a.9.1768216097426; 
 Mon, 12 Jan 2026 03:08:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBH4pb5/3BYG/cAuJcv/xavCclwNEZZzBJQcWjCGzKwsMo2DvYPIaRbeYOzCTWmrWy3hc+mw==
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id
 af79cd13be357-8c3893fd199mr1758453385a.9.1768216096987; 
 Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8724197145sm173031466b.11.2026.01.12.03.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Message-ID: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UKNkoq8WrGOG6wx1T_V6-2U4P8pzf-E9
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964d622 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_A-17BlWpzFJNOduaeEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UKNkoq8WrGOG6wx1T_V6-2U4P8pzf-E9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfXyKDUAZQ6K7/S
 LPzFnj+iCUbdR835SSH9WO1b3Xe122GuqxU4zFyjVurHXAnot2Vr5iYS0im36AGhJfo62FT4pt0
 ECKwcSZCKvaMoSKSQIZ4FV5YsNuFLkNsXktWbFuGdWI2FtFa6z+AZTyr7bzuSgnInEqXIuJcMpH
 J4vMf7Vw/F7Ctt2qTYsG1JRzHbiySy23IQI3iQvJ2qPRCswj3lfdMj51gUzSrGbM4RXkYBec8Cz
 ouvCJjD4bD4pNXkhy+G5HJKS66RzooscOzOuRDAcSC+9kKiJ2TyGk1sf//EB6iS+cb3e68O4vDI
 NoMaQm6uV/3LUo8UsU1zAh7F2rP87QGvC5siKfow1oagpT6jGDUAMEf2KDPJX6fUwXwRCE3swiA
 03xsg5z5czLfIN9qofyIChAi/bENERkylwN7bx0W6mhF2iGjN54ou6cuudBIge9cFpBagatUvom
 jcdLXvYB1pweVl/+ldQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088
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

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..50d891493ac8 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);

Are you sure this is a correct heuristic?

Konrad
