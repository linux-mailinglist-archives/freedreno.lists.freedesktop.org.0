Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A54D1EC0A
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 13:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABBB10E60D;
	Wed, 14 Jan 2026 12:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvGWSc+M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKdyYJ/g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FAF10E5CA
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:21:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E65xXu1688437
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=; b=lvGWSc+MdI+XfEAl
 O0tX2sTXTqZIrLDL8P5OkdFw+MwRsZyDEmsrVgvhr1nLT7F0LjOv8GUeD2+U4jKO
 Imjo1oMDeFUgeQo/JEQitkGDHQdBWjsZO+eK95RRxNmNaePE6FLlXayJbNI7+fE3
 53QM2wRTOsmCcpL+QqP5Zm3SENpt0fK/zkkStwMvuoa0R4VXqITHwdcgrkEjcsRG
 1WoCB+AcrCPGOG0uZ41d9jny9bGwSqUgcCB/42d3kEnO1Jf5exxs0puMvbeljbKC
 CWYwmHTORpuTbe0x1tgAqLbhpcnFoe3A2c8b56eZj13lB2eFIZcM7Aii0EijV5zB
 e1rNVQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnsybakgb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:21:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0a0bad5dfso46976035ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 23:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375306; x=1768980106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
 b=jKdyYJ/gDwXoGgt6Z8LAdEuO/rjPO8GJNRveSyeeHBZHRNEV1XkCfWYotx+sXZxF90
 w+0jBXDA5YS3VPzDyTQahIR9pLASQ2wvQ8hwhB1YK/c922LwHDOytUDA0/eTP2EQdJiT
 x2gb3UOEHt9HFbR1tO8cyeX5F3mQ3Xk2NbXs1iIQH0j0gd5nOf2LjKCGyQtyOzKHfhFq
 Mg/EiCFJJCCf+50LlH8C/h9dIBoI7m2RkVgPS6PDZD0Kvk/F96fScoY7AWbLwRN3RQzH
 WEzlMn/0dECmxU92fk9i/0nYfLhTui/GY4acNZtJL+blvJxlBjSxVcqPYrKR8ExZeIBl
 8b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375306; x=1768980106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mGua2V69u9ZPUxAilzeukZAAVkpOgN6IHQHMHMdlgeM=;
 b=thgb11Gth/KQ7fU/zKRBrs0dUT8qSZbPOsVUaCqUP96mBTxTZXoguo2gMR+RwgYkf1
 JielOGzjoi5CJOUvOTEKJ2UK0WpzDeMGCQeKJgScMNrVIjXe4rRHjjp801Ug4EZBTUfj
 TrL5KP2ELLiUo/gdLWuFjApkc3BHltIM2A2RyJs0uVoajJCIUAN6yF6y10WZeMdcAdtf
 0H5q4XHwr7DCLBTXCS8OioqfyVU5U4xJuoN0jjI4Qzyoa708WpMZwALY3zbzsWPmJln7
 KFOcO+flzp7QePnhIZLcBPXvdZp+LREUynKkJ4caNwXuyRO5dqRxv5uWE8SK5UYfQaO2
 Hbtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyG+0tcUSu0FfiqLqDQVtPTJF7GLDtMXjnfHO78LWXr+tBkvgIlZRNLB3Wsx0Ll8vxiyy5mlKbGhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlurLSW/kGwO0qwR37fkbqn8U2z1BgfswyYqBmBNhHFr9fKIr7
 s3qT9UH9CCLzjBDFeKnXQiIlqsP8TJw1MqezHhbZsoQXXI6YCanpZuQzGtZ15X65tYx/kI7XtcU
 iBASNPIwlsiIOUzGW2QhAhXxAt6zyIH2NOz3l7JpVySInaEE7AHmvlZ8Utb2AmczYtOItP90=
X-Gm-Gg: AY/fxX4+51Kr7s9QC3VlEjAtjL6OL/xTxcmYuYYVQp6Xk79b4Byb3IeQqSLMlsDDWvl
 cOyQu7dC0Z9p7R3mOHCeVIo7AZlhRpvxmWO4bJfmihenIV/T1byqpmzNXzNnXaUJVRQpEjO5/aI
 +NZ2JprVoXVKmmAMU2WhloCc77MgcXFWkPsnP/7xK159CFXtIUoU8y3k3eMk0DJtSpBYzNDtkei
 Qi2+AYgSwxMy8zvN8gZWgwz6m+uiJuT2gRdduK1Uzeao4QdyhrUJWBeZSN21eUCDtcHN1JVRce+
 sddJk24UCAWWedQRI8hbVTdnjHy7grH5pdNQPbudbKMeeqFbKpNXww/mJZEHtm72d4m8dfcaVFs
 5NSDjGpKKXA4I25ElibqRjfrD+hWwLoeTO7bh4fANO08N
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id
 d9443c01a7336-2a59bb74387mr12706355ad.20.1768375306033; 
 Tue, 13 Jan 2026 23:21:46 -0800 (PST)
X-Received: by 2002:a17:903:19e8:b0:29d:7b9b:515b with SMTP id
 d9443c01a7336-2a59bb74387mr12706145ad.20.1768375305597; 
 Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c48cc3sm220685455ad.39.2026.01.13.23.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:21:45 -0800 (PST)
Message-ID: <4eb4818f-115b-d0af-cfc8-109984190f5d@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:51:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc length
Content-Language: en-US
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
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HE6QAzrPUuNDg4B1NzSm4iLABigpYY27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NiBTYWx0ZWRfX3H+6k9chMWZc
 8Sv3H+iXEbBfulaMSYqGraU+XYn4hHtuAJ73pbemzqnI5qOw6+JhJvNBb7z92eq1+TKOJl0F3yw
 bhnc1oQvW/pifX8/96+s6TDYeVevtxCKAVDFB/7aPuTMf1n+FoxHeBXqR2iHF/OZaaTb9gX52nc
 nDmYqv+B+yuU42hDQFdiSDPb4VoodHXGG8BqsoPQiSkTQL1QtPsWEwcqQxFx2a3RUqahlHJI7Cp
 PFEZNkt1wjqF20R6FfiMjWCaPH5Kw2+QKHIdWxQPs5SARGVZQ79L6UkM02ivHaKilo6QJv21mZF
 vxvMko9uJKXrV8pVwH3A4kYeRqPtURxkjRB+TatmyQovtyqHRAiOoUNV2IPfgSA2L7cRQHBneMz
 XhSLiFTElImjJeiWLqKTxu5svOzN/CJFhcv4PVpjHk/L8L6HPB9Odf/8Rc1PrJddB/QH8SN7PTc
 0IZGJfRWEg4E9DNwwAQ==
X-Proofpoint-GUID: HE6QAzrPUuNDg4B1NzSm4iLABigpYY27
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=6967440b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=o9KUHpD5kIPiLnKsU4kA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140056
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:29:35 +0000
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



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..5bdeca18d54d 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +/*
> + * This is the best guess, based on the MDSS driver, which worked so far.
> + */
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
> 

Based on what I could check from video side, above looks correct.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
