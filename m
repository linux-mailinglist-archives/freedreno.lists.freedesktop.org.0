Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B0A49ADF
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 14:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B20210ECAC;
	Fri, 28 Feb 2025 13:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXkX3BIf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3670310ECA4
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:45:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXH1b031934
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ElMZp3aj8XCvzAukLCtSsmNgNkzLrnbLNXvaEBzIL4g=; b=UXkX3BIfY/8M396a
 UjCat4hwQmhGG02/WSx8S+HWbe4kRMf4khRfSnMsd4Fq5yu7g32oYs60fGFhDZNW
 DDx0fix8cntcU7/vxKYpaliQblncMDiwdZjs03hXXdYwQ60t4BAv5UdCbvm9tU7f
 IqjHLJd2Y1XziwX9z1Zo1Gk3THuxtoBVUT9APaTEpBx7bop6IXvFrxzVtmHbbcT2
 fWbq8WSVUAyfRPSS5Km+KC3onj9zrfMBH+encQAd1pRLSELGiGcVu0YPYNgDuo6F
 gqrQYwsK1ziqnjVhDR0FqVbeF51BfdMTkyhWCIkxegLrbNUzp/O+o3ZKXs4IysLc
 0zy03A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prksmnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:45:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e89698ae63so3015576d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 05:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750352; x=1741355152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ElMZp3aj8XCvzAukLCtSsmNgNkzLrnbLNXvaEBzIL4g=;
 b=SSr45UnI3CmxgvB5ACSLx2SfN9CThV63zclqcyLQp1hkZefW0jUSUd3xoR8PJlNuqz
 LiKMJTRuCvoLeygpACj1gPtklhWbYq8otUH57mVhxyAqcNuycMmnx6pDNqXV2YLXNkLA
 cKy6jbMIbnkhKGKegOwvm+hlrdsdI29y9meJb+ocT77uQvHk6AS4Z8okAyovFA/AcWqY
 OvpFh7y7TfDhQO2ffXq1RjFEc5iAKnUj3DGg+WJNjKyqItEFw7Yq6CpG2M6tztrLqkZ/
 v8ZQOBUrWkWdNGNMbaPuNjMDzlC2mo/bSGN+0ybTr9Pe6A14o9t/om16wiSbx/6aX3+Y
 bybA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMBEsOnPRYqzYSiiLpxZ+sOd3xegyEWnOfPy0DKS5qPos7xA8fjSSKy9rTIZ2rQmtdE37CvCQI9X4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKdFwB8DS7IueW9Fqzeqqpt2rR3l/1ggQsoLEzzDQXvfRKwdP1
 9ZL+dDQn8tzfotE3TwE6a0kYL0sjybcLM2Wwm58MZuZklmTeFlI04P+86MbVCjy3zkkkHd2Kzmd
 LDe9kRcRy+dWRhTyIEZIzWOIqcgT6B5JyPEVqVff3iSfTOJLOviYpGyqw504UGCm0cLQ=
X-Gm-Gg: ASbGncsJ1l2Duhj1mWyoZxFTqqv5drJR5it8572DN4mlfi+4ljDUhV5+5jwv7nT4lo8
 fuXB7zRbHDZJ+Q7Prg3Z56r7EOTxI5PDkaOX9PXnW2QWnJH66IWG43j5XMWcoU4cfSpMCkT5SFg
 Vg72iOuEcgUPip4L+3f7+A6sceY3rtUFdkCZs9xN8ePz+vQI3ikUfLz17VELWxV7umDPpaf+p++
 gryZfbvdRK2t3tF/aQuqFfCzfX7Xwru+7NymJUeUsVuo92QVWC1bt4xPRr8jdhpcdpjOui0MMYy
 vEqfaMR2f7dEHiAV8wKRWunvveG1PgdI7JxHOmGQ8bL/guE6h2qP9CuYbB6DTHv47UgkbQ==
X-Received: by 2002:ad4:5f87:0:b0:6d9:2fe3:bf0c with SMTP id
 6a1803df08f44-6e8a0d390bdmr16624696d6.4.1740750352302; 
 Fri, 28 Feb 2025 05:45:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/oCApv/Y5ObRZE/KFXdLu0bmSyua0FoUMda3K2Tbcj+Kjc3wCxjh+pxAlMy7QurbrRXWsqw==
X-Received: by 2002:ad4:5f87:0:b0:6d9:2fe3:bf0c with SMTP id
 6a1803df08f44-6e8a0d390bdmr16624436d6.4.1740750351841; 
 Fri, 28 Feb 2025 05:45:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b6d702sm2484342a12.17.2025.02.28.05.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:45:51 -0800 (PST)
Message-ID: <602c58bd-ae4b-4af9-acd1-ef4f1bde5f70@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 SDM630
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g6ZALb8SU5CLrRSjSQd3HSpbREi9cdom
X-Proofpoint-ORIG-GUID: g6ZALb8SU5CLrRSjSQd3HSpbREi9cdom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask, replacing PINGPONG_SDM845_MASK and
> PINGPONG_SDM845_TE2_MASK with proper bitmasks.
> 
> Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> index df01227fc36468f4945c03e767e1409ea4fc0896..4fdc9c19a74a0c52ae502b77fb8697a53bef0f97 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> @@ -115,14 +115,15 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
>  	{
>  		.name = "pingpong_0", .id = PINGPONG_0,
>  		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_TE2_MASK,
> +		.features = BIT(DPU_PINGPONG_DITHER) |
> +			    BIT(DPU_PINGPONG_TE2),

Neither are advertised downstream

Konrad
