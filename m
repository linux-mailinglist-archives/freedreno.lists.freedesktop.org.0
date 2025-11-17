Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC26C64906
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 15:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A7410E39A;
	Mon, 17 Nov 2025 14:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSa2HpyV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BI1Fp4Fy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E982710E3C2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:09:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB0Jti2792283
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=; b=fSa2HpyVbEXyR5hs
 AUWWxsv+gPGVSCo4FW/z8Q0Z5Eimecl3OR0XXpW8dsYFPKyHvu/+W/bsFJ7R2wYE
 yE7xU5SMzPHOY0ife6MRwRqvPrVeVVPYpEs5B8mpA3Kac4OdYqdG1WF8Mgy+dx22
 L09YKmI5RpAtS6q1ugXdSg7b9+kWjbSjeYMNeD7NsLRlGqq/Q5+4JmbqR5uyI92d
 2yb0J8hx6WDz47JuY8WXKiAUexjO09H9IeKnAaLM7SDtBFAwhRIhtwAikacAmms6
 kAu6pjtK6ERfamox+wbyXsNm5l9ITldnyUb4NfOCBpKEMskvjfonOlezx7BqZtov
 zKuykg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhudx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:09:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-559a4539437so292327e0c.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388550; x=1763993350;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
 b=BI1Fp4FyANB3Y49KOsX/pRi4JaFGBV+SKKoRpd9JpUQnvIqX9P+ty75BPM9pw2d3eb
 784wsjxxtOymXUhCfIKIbQPEr7g47HR64F99wyX5L/5kdmEx7MSsu0p8N2KrIeFZcOVr
 Z3iGDQvbkY0FDDhA5V6XglwbVn2+pq4pW5Gl9nzqEIDGArkPNqGoEzqi7JD2UMGMweSB
 z8i1P7f/Yjo9xhlMDlSDCsetkraM+kjnA7LR7A8EOKYF6pwvmWy5WpSeBBmbQlhoBrxf
 pGX6gmPPMXxefLQHaZEdc92s00cZtLz2fjc6Cr1cf+TOgq9s59lNaUm8s2OQJP8WsQx1
 ICfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388550; x=1763993350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
 b=Ye4ieD89UhLGxRK2gUbwJegDu9jG9A3TJUBJCcpWAhiualBWKFBd6R2NaIYUrZTR9c
 IyUSdDoq/fkEtonvdRBO+IpTmif4ZkCypt4RaBX7xwQO5yK0taVN9Id+SKeHiFs/HudC
 u2uxU7S+k2yQs7l8h5ngCG5YFJGRJGfJ1WC2Z7NUJhYfFMvAncWvy9o9DM7dc3+xP8mh
 rBDYWdYJDnpUPw4VTPBW8fxTghD0b/2CwIgVbV3ZFPXnYjUG9oVn2z6XAQPEd7phPFET
 q5cp7yyjQVBCRqoyiRBbiWCWio88ZCvh+XQB5nY6bVFoDmij6tSb8t6ye0zQ4Qi4hk8l
 hnEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXihW16W4F2Ir5EAtau9JdjzjKR4BYFDUY0PpXZYeKNsaVOmly0XXz9dxAIxcaHsy7jjq1j59na7kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGEfd7PB0k0XnY7uDOyKAUd1kSN2k6i46ddxvklPC722RkRtaj
 pB/XcXLGQxzjKpvl32K7rHHdhWi+hnePGJsu+1xVjpfht/UsTv61q0/v4K+uFMhv7CRpeTw0/M0
 LgH0LlIDOwxVWR7HioiR2cKA1DaoRS3OhjzWnB723s7+do3bFbSIiniPjqHyST8XYVgiQyn0=
X-Gm-Gg: ASbGncsGve9ddsEQ7QGgihbjtKNUZUHNJ82n7Qc/XzD/W29QwAWJ6DXSxvljqgvKTJk
 Oda6ATfsgzN5HbtyM6uGAzsPXz0tAvF1cvZ6s3ssTYaWwwqA+JtS/wVPlVbWVp/KWbdnWl/LfFj
 u2g8PDNI+P+98cK41XoHxxlIT9awf5q9AtMt9ZWTFfKBGq0kJZmNpPtFJju9zVTdr/aC9V7Dzbf
 K2CsIn8LTznBeCGC0jqO1af64dLDQT6Ua6KrW6OlsLLSwEla0SrLoGsbYRfdHSgbEVhDBhqILd6
 B78pv80EwAxT1Y+SQJHqVERJgbjhZ9BaoeKFuwQZTtI6sR0uZg+FbBQH++Jh2ynMRCkwUeUzB4I
 eogCbkcMHzPlYHi0Euovf9Znf6GvmVDDOwAveWcmOVtFJ4ih+R4afqB//
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-55b1e8e656bmr1323564e0c.0.1763388550468; 
 Mon, 17 Nov 2025 06:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEn28HG0q377MHRpAVge77qxO8f44ujFbyC1+LqHPUCbNQVUi80/RIfFpD8JZBIKQiQvtEgA==
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-55b1e8e656bmr1323540e0c.0.1763388549969; 
 Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f961bsm10439343a12.14.2025.11.17.06.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Message-ID: <eeda046b-cea1-4c57-86b9-217482568b0f@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] drm/msm/a8xx: Add support for A8x GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eR0VtKkP75mlk5ccZT8hZKj-h1kCbje4
X-Proofpoint-ORIG-GUID: eR0VtKkP75mlk5ccZT8hZKj-h1kCbje4
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b2c87 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N-Earc09p0J-wu5tJXsA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX3ZFy4s8WK/Op
 zeRxs61biyGZDBBpo/qUy7LGwWdX8LxtxpXEam6KQDDsq0xBd8sYgtIInQPTm0M5dV04UbpJAe+
 4z04xNRgi1n5mk83lUt/IcecjFm6PsoT26fayCMCCx6otgZ5+P37nSEY9mMm73NsHzzmOtze+2V
 LpqS12j33VsxkvJClVlSJZ+lcUBTjk6jaTBrEz1QGO9QeqUHWF+fDXvRRUMi12d4JuAaZxPA0ST
 7QKAtC4bm4GydAO1Fi3PHglB+nyHyOR2LquCn7YeBc4anBc5P8UdSApyjF02BN9SCn5I7J7NrRI
 BI7iJqLXQ5Nvrj8FPWq6WN/Pam4u1u61uQ8YyUhKisUCMUGzTHXN/9LgZPhkYWWuDUUvvV0v03r
 3nAmfRxz7xpLnIUvNOpR7NPDFWygXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170120
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.
> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
