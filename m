Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6DDAEC784
	for <lists+freedreno@lfdr.de>; Sat, 28 Jun 2025 16:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FA010E08C;
	Sat, 28 Jun 2025 14:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1+cmURx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF0E10E08C
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 14:02:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S4b1Yw015300
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 14:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=; b=f1+cmURxwE7I3hZo
 XnCzpKbvRVGZOaw/EjpkGt11sm1MaA0EmbfPcbg704HmTDv3wIXLOEvsrdZYk8Ei
 ixrkP2Gp0Fdbj75GTOjYTWuViSDGtDncv9iphEwBkgmBJHuK4GynMBHuG/6FAgYQ
 LCDVuxuOKKewe73j6xCDEV5SvatZgecZHf6h63IEHKzqvaf0qHtvWX8tQuPgzXGw
 eMkaEkFO1QfS+PGGlINbngjnNkvtOKg9jPc0CmOOYq0/0Sjg8uXu8737S0kfbe5a
 Jji04dJGjc3mPqxLt/BPAUMLdAe0AdaQRWIasTWQoyIeBKpoGuNqa5gxsPhfZDpl
 gAPDiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq0x3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 14:02:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d09b74dc4bso64132785a.2
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751119347; x=1751724147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=;
 b=IthYj+Iyo88kXKVyzVl1E5Rh9/lhtPP9lLvFiRgCszBVKrId5eaEiCr45fR/9z38Dg
 tfFBMUJFfRJpZOmaudO4grdEdI30GkzTEcUOZymGN3YFmcOzfd6RxmhgDCZH1U0Wqpaj
 9iwOPc9NO3zjMspH7kuRUQlwIQt4Q2EF3b2xatEqHjaQO65tnSumrjRlRuN4fPQXW5pR
 nPkTZbOjVSaNPTPdhQGs2dKISPPNdex1IUZ6MX80/GrEGmqDS7zY9ks5mpV72bOEhQEf
 fRhqehyPPvLo24jILLHY7fmiPX8IjpK1Z7pE/QEHaVPKBu8+0+m5oQ5b0jXMeW9m2aHr
 bRuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaDoUbA0OBXFmzYFQgUMwTNA9s71/aEWcJDZWDKNg1o5KlyqDZ+wAQWcgy+1zKGIzAY0/t0xQM+FE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeKXESQg1MBgMRahKPeJGYXDwJFNe3UKo4xjFbAEHL8qzGBrO7
 sbvzrS6ncUpvYCHOTmqYv6TnJaPZspGMhcgnkZ7pxWtOrU4+fkTB5XB9bmEbT22V5HspGSQJeL6
 WGVU0TNeOVO5/NpQDYcNklb5OVyKYi9ATwvggoU276yZgvLcSjwfJ7JqcDO2MqQwKm+eeeV4=
X-Gm-Gg: ASbGnctZV8OAtp5HolWFK6Sw57iHXqUU5AYqBhfxv8qzyakYOMua6BFwbJd9RyWaHFr
 3tQtZZY5d7CCq0wSGjgDnLUk6QRYLvGnkL7utj/UDokZFReFVrSyiOMH7jc4k47lLYvK7FKaRtN
 Us5b1uGlnsJBHuiljqEoQ3IsiBys6NxyZpMtKSUVin8C8sHvrc4KOzFiPU9vEhiCB3WBmOvsY3w
 rtSv10eKX/KdRaxFN/x4W9Tr0sbmnPMWaciKEtwlllE6TVVXageNvfs4Ht9D1jy7KkslTWOQDN7
 5heIkHywiMWipSxBcm4/itpaJq0gfmbX4VSH6dF7/k/bM8m5dO3vXZfdAYZhH1UyVO0k91SX38p
 FjsE=
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id
 af79cd13be357-7d44c26c479mr159330885a.9.1751119347148; 
 Sat, 28 Jun 2025 07:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7wuqAnLzb6/uFSg6oL9C//BE7uB/PxoedUfxOubcNg8iAM3IahQGLP9T9ZqdE0mT6FVoRNA==
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id
 af79cd13be357-7d44c26c479mr159328085a.9.1751119346578; 
 Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca0fdasm319419366b.147.2025.06.28.07.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Message-ID: <7b7c970f-f94c-4b38-9693-65f969b992b5@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs in
 clocks conditions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NO_H1Qh1UZP16uLyJLk3QQ_VoePOSnLR
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=685ff5f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=fA9TbEmd_Wx33vs1QK8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NO_H1Qh1UZP16uLyJLk3QQ_VoePOSnLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDExNyBTYWx0ZWRfXxyNPtgp1Ka0Q
 bBUTSurwBT4z9SBQ0+06kssdhvvNCmbXOjyvIHsS6hoOt60qDksmG/2JLFMxjfXiA+sl4zpVOdB
 6tSSuGLQ/TT9r3sQQUvSRg/XmnkzkCRnF4dsd+X4wVaTsz/3T4phEgyaEk2A9WfmxEEG+VsHix/
 FwikmlJIukrPsq7LxFY6qPe2DpsFhZ8R5bk8aKTgoEQRN7WYgUpYRLqCOXekLgNP7Oag8MoiMQg
 mVeurAe3HMkpry621YUQ4940VpAZBm4iXxJeg2oTEs7+J/UFYXvnwld9/QHwCsfOm+ciUOkb8pr
 NFw7aQDJvD08B2E5vloTokPMutM+ORSeX+dQ/d+DaKujHoFzUKnNqmGaBujUTLR9WaUi4JF8nF2
 aTgvXPbohs8nePbd7NalluVyeajOLVyW5QrG/bTV5A+RKsKWkR1qw3pNmRXnI45gY/fiqFUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=765 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280117
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

On 6/28/25 5:02 AM, Dmitry Baryshkov wrote:
> Handle two cases for Adreno 7xx:
> - Adreno 702 follows A610 and A619 example and has clocks in the GPU
>   node.
> - Newer 7xx GPUs use a different pattern for the compatibles and did not
>   match currently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
