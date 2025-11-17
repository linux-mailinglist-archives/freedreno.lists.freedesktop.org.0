Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08DC64865
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 15:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4AA10E025;
	Mon, 17 Nov 2025 14:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaLNWRlL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMLpxDqd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5BD10E090
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:00:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2kZD3670909
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=; b=CaLNWRlLM2uKAZYN
 zumD9UYmsPf6oUOVgIDz1j75aOapZi2Zk3w6jEeuZ902Te9KZ3QoHgAavMpXGXWz
 mTd02hHbgfZkTTFjDcKhu2o5YASXC4Q/C+toi9qYmVOCK4f9u2wWooLVtukLDy4d
 MGXQxrrRs7k5FW2a1qAjNVQ2JWdphcxhmjwohGDR0Qd3txoliwcX81HHKJ2goDWL
 jtY075H4qCqC/6NBg0qRZiZoywBsPHJ1KVjg9w4kC8d2cLtTvZEv6YFw3DWZAilg
 Aq2rPi+fMQoHDf4THYnwBPW0FDV6GeIaVcHbAZ0atBz6YFIfvxvAbmKM/gXIfuck
 GTkqhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g58fab-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:00:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso6464381cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 06:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388057; x=1763992857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=;
 b=EMLpxDqdDzLSEr1zlfdZLB/b8Te/zeb2MlFx4+tDhACy+05GUOHvVMGv6vewgjvnz/
 JUw7mxaofgYmtfbPkYxZyoxn/8Cm+IfaHuAn6IfmvaRTOuG6tVcq0ayxnr5MT12RPhKH
 0pHSJdw0+He5Tt+poZUZ59RbpKxWWe3OiRLreMjr3Q81B2EgBoOMMRaKzs/l3ErOiVWK
 YDftKwKicMEDvN/JqvX541eNGgMkoFXWX9TvM1ApcvKrcGs2rvVrJil5g0Oe3KibhyZR
 5AtJP4Hk54hJ8Z+K0A4zESqQ5QtohxsTIDftpokc3XkThhGxrVWG66z/63EqrUenfXpp
 zANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388057; x=1763992857;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=;
 b=CcksTvk74eKSO/kcbIZ29ha8Z6UZf1MKskCVwmEYvq7iGh7iJSEUIjtcYASFUOVbEM
 9C92YZtDUj6lKNIfBme62HTeayVCoB3u42jqdkG09uQvPxTkkYtXPRec/gUSX2/6LIT5
 dPQpchT/OF3iE7nVPrJLPCmZ/zrNnm4VfwlDYbNDgkC9286MqQEqKJQz9h9bP0rmUS4n
 91LSABPdyrcNDYnm/elGFxJwY+HK+d1VqaSATniSBMAFgjs6cMAxRqkd0x7KxQX9E62D
 CzX7+6T++5nmR8aiYtVTH+uoIteSuCCv670d7gm/7hCXPipBxK3jK0zSsYhflO8zWS3L
 gFmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkpKlUtDqzAN28armzzC5dcPnq0OarGIgkFpj2E931MWX62JgkQBHC4BPvflWPp5vS5quzU8owN5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQJpttpLqxEKf8ZBCURh09KFjxuL3vPtiAItt8bypRJAH/E/tM
 XSLxv0KBNPXMz0Cp3VP0wI7TwgUYQlH53iBbYC/VxHhWjk8RqU9iR3AOmOIhmjsW2eYq5cpVVLU
 UusiFjbmAIaMnZXF+bg6KQtHgBChtKD6X8eMmxDU2CdLoQNb/HgmG0aqRQprqp04dvGP0JkE=
X-Gm-Gg: ASbGnctt3EwcsnoGLvI0lnl/S6Vdc0tJ1ywNMyHKeU0xYoAgGbVS+OYwkyZX9EZcbar
 4aRrcyV00wfVqxNuXwQVlD+soPWy9Ys2ZIDrJQ7EvnY0gQr4EV7PMYfw03wFoKiKwomPT1K9rxg
 IvIzdW8QPwqoXYtYTHLpUjGfYGiaQ6+HjRLaGNG2guJCc5TrLxMrcS8CV9lcZj2dqBJxCfcAfJ8
 G/Lv4agxVx9HTwF2ZuVk4aSNG8N5gxioYcXi76W6o0wcI9cuKHQqgZzyRvq5txWU+Zuvr+xXEaD
 WWtLmF/23JHsOGVwZd2kBiPHPWgCqTT3R7hpYaSpF1rbmZZyc70GwlaxXpRv1Gc+MmcbRT5FMUY
 SZVjTZSEPhXS44LIxlX/9NIrToW9eGPc96rSVIhNTHYrj/omAJbOlH8TD
X-Received: by 2002:a05:622a:1a20:b0:4ed:afb4:5e30 with SMTP id
 d75a77b69052e-4edf211b66bmr120920881cf.11.1763388056368; 
 Mon, 17 Nov 2025 06:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj35tYdr0HD47+9f9g95x0CjScjhWZaLoteYTa+aiaYqadjZmKPlu5QoVkMf1uY20EKq8T9Q==
X-Received: by 2002:a05:622a:1a20:b0:4ed:afb4:5e30 with SMTP id
 d75a77b69052e-4edf211b66bmr120916341cf.11.1763388051601; 
 Mon, 17 Nov 2025 06:00:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fedb91bsm1079743966b.70.2025.11.17.06.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:00:50 -0800 (PST)
Message-ID: <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
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
 devicetree@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b2a99 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=RYDHkQwZWS8X-3Noaz4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: dX3jHh9mB7d4VbyqsAcd1kRlVBe2sWly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOSBTYWx0ZWRfX1QfhwJvOWa2M
 n5Ul7Jzj8busWVxOoZNSM2uCoqhmv1kmTKFAqZJji+sox1ydRVRxE4qQ4dXqLRT+WdQn3Gzi/Cz
 SiwPqtg4Zp5FNQTYPlywnD37Xt11XxBpyIXKOyfy/bXfeOG+QCB3qocdXQIiACo2mHUbD7x4kSn
 BVPh5sMwJN6YaB5EhJU1q/O7pJdjz8ld5+BqwLNjlaGd6FgCPWRKVP/T9hYlX6Io7cKypdKSIMW
 HYKsBKZUtGxO2AIzXPbBEi1r66HJMYax3u53hji0w5ypDBo7znGzmiqQLVbNxyIiz8jJRTNRgc0
 uNSBYXMrc/ymZRT4POboHYYd4NHVABHfmmnOyPVN/Lcya0H9YGZOr9ls0ccEc/cCdczFScgrPyh
 /bakmZIoArmaIVyFuYDjBkB4HcHTYw==
X-Proofpoint-ORIG-GUID: dX3jHh9mB7d4VbyqsAcd1kRlVBe2sWly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170119
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
> Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> architectures. So skip dumping them during recovery.
> 
> Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Looks like this changed in:

https://gitlab.freedesktop.org/mesa/mesa/-/commit/95104707f189b2e1b06c855b563c1203b33da354

and needs_seqno is never true now?

Konrad
