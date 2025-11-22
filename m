Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644FAC7D21B
	for <lists+freedreno@lfdr.de>; Sat, 22 Nov 2025 15:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A05A10E12B;
	Sat, 22 Nov 2025 14:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSGZukAH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMHgYtU/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491B610E09B
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 14:03:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMDCfsW2550555
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 14:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=; b=jSGZukAHy463Vhtz
 N2Cg7cwvUe1eOdUYmEy3Bv89afj0kk6Gn7C5p7Ws9udeVH7iaqY9DdFL9UFfIpYK
 xhZWRBV2WqifTX3URkRXdQnw/4rz3ItJV/XEtrN4s/eGEguSOsToVNTXGSXtxH0r
 56UAT1J3EatoYkky2qLmaHFe7wtsJYPX7a/q9jfc1YHX0F1VhlegMEbNmefRzMc1
 cJGtxrg51Zn4dn5hKvU00E3aZURXcPriLPAy294tU6EpBqY0i063HWpFA5tU+bWF
 X5qasBMoXVpYVawZZhZhJcftEa4l/DGVMSpS3z1eQFmfSWL1oDN+wzGdcHGyD8fr
 qhU/7w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak68drrdf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 14:03:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5de05befb05so64434137.0
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763820194; x=1764424994;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=;
 b=MMHgYtU//jQ/9qrVZ5SPudhtbu5j29Os3Ty8seCI2dbK++602fYOhBptT+D5uhuXv6
 kRcKg5MXW6A4VI30kvdMPhIctiiz82gfHUDmVKnMhwiPtCKKMH/By9ZLOMEvc3ypIis9
 dLra4uS9NOMVczm4WT2UadGtufkP9x2UZ/83cq9OXRMZLc1dujpr6bp3DNaG6/uep0V0
 K/AtzcbnrhOJnKcZabteqMwsHReLAz00gsfKV3baiQC/ctn96tRIGhaNK48bbY7tUkwO
 sq7SNC222X62+lJ67oIeXDZNfoAbSgDxZxTLrnm+f6hgkwUlB8WdH7FOiuhyLsrR3Pjs
 sW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763820194; x=1764424994;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=;
 b=Q2jTV1jBlGT3ho+Yc9vIBNwqxxlh5UJGXXpw6WQtmrFmLD6+0ndjy8V6X4nQ0e75Ne
 RrjrJX9tMJSGEQ+eUwm8tidn7HS2UvamY7glLbxBnJdrNltCkjZU2n021sBaCgCBLpR0
 Trsqt02kArszFFnojS9me11sby+98HI23QbYbdiZ41szrIvmevrrW492PzUxGn+GO+Dg
 Qa2Cp+6N7KZCxvC9Qx+Wr9kZ7J5EWj76DvEQoWepJ579Vw9ysIOX7JF3sJtcVxaz2I+t
 wIPTdtrRczdeY448ooKo6wwbhevMLZKLRm3vUTthCGnnXPtIRIyiLPJPNMe4r7Q7qoXK
 VbxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO55PMwgLNBpYR7TW5m2IW6O+FhUPnJvsqywFiWLFf175WymwUWNFsvfkZPa60wc9WhCm1Pi+/mGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH3d6Ef99VJCmXLYzDV5mEhEaxwYu6TVHbXbVmdHsu6/GDPguB
 EGYok35tSG1Igt8Kt8Zl0JjILJfD77luU5oXU8f+8Izh38CzKOCU81/LjqU3TBTOwwNTswZ06DL
 66Ph2KLmEaM3ZfwtWMgaxJgwVAKh6l2Qh9sTk9L6mnkzX0BuojnP8uJ/P+XcyAG8CLSlZUZg=
X-Gm-Gg: ASbGncsRTwdRgA3CIUV2QyjDQvP0Gylg7yPO7IHAk0Je+4g4ijElv1KjwAfbHeqXL+9
 Z3zm5HuEGm6h2AIlMCmGkW7txYnRouhUZFT1vnqjExyitC8Ds7jc6XubYuAHIfz/oYLCqOA6NEw
 HLYT5FBbRAjwm0sqDGDPQhDpLGJC0OZFR9UNvxArSnAW4Qa5kYG0XEpbXkZp7jLaUW1FQpYN8Dv
 +VJ0C8AGkqJo92f91b4YIMDEgl3f8Wpw+87a6Hpx2tkAMlX3SYDZNC2TEF1b9cXm6EkpUo5MZCZ
 BZlqcwEEDIKqujDOBQFjTSYN3hvvohE0Ew04Dw3NuTL1yldZSKgoB3cCb4pZeSQ8F0yIyBTqC2M
 7qHfNGLsScX8RwWiFgySqtx6DuaOCrFXViQSjcTP3UKhzBeD8Nf21MI8Uq1ypjIHVLDU=
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id
 ada2fe7eead31-5e1e6ab5701mr905544137.7.1763820194470; 
 Sat, 22 Nov 2025 06:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOa5oUdJ8Eo4PVOAHiaccaEv2w3avq9wi2Hvan5TZ2E3W36cwP0a8YCtGpXcrKuWHN8TVK2w==
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id
 ada2fe7eead31-5e1e6ab5701mr905500137.7.1763820193999; 
 Sat, 22 Nov 2025 06:03:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d502fasm726258966b.17.2025.11.22.06.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 06:03:13 -0800 (PST)
Message-ID: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 15:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNSBTYWx0ZWRfXzY7408CwvgbR
 8pfA0LZwf6y8AljxbRWtf/MKm7pz6XkNCMUh3RUfPDPIVv3a+1h34Oz5GXfNvrchqQ+F6eC5AhT
 PE95/FVUPcx8VQjiKssfR1sE6SsFlQYMMEoGv1mTXLrhA37mskCU/772fqDn11FneP4WcKpH+Tf
 +8vF05u1WJJLyqqN3O2L43YTGiBuMdAHolzqjG7gs8JYWR8Xv60ekCLntFGv44QSz4cnA2R5/jM
 e0my8qP17yCFMLl1AOZcEsvcLYu6ByDsIdkf4Zs5+zRrAfz9ooFc834vQUwjMoTegoe5yjGxRuW
 QYba90zYuWym+Zu3bJL6nDnre6YaI/dDi4VOj3FAaPoEZvx0d8AwobjdoPRNF7/S0AQz2bK62Mi
 zrptxYRZXl9RKBxycM9GqsqO0HduHg==
X-Proofpoint-GUID: 32t8s5gLUvDMJmakjs_SCeo_7uc-z0d1
X-Proofpoint-ORIG-GUID: 32t8s5gLUvDMJmakjs_SCeo_7uc-z0d1
X-Authority-Analysis: v=2.4 cv=UsBu9uwB c=1 sm=1 tr=0 ts=6921c2a3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=K5gqOp28Iz7Nk40COgAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220115
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

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;
> +				};

I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
or mobile parts specifically?

[...]

> +
> +				opp-745000000 {
> +					opp-hz = /bits/ 64 <745000000>;
> +					required-opps = <&rpmhpd_opp_nom_l1>;
> +					opp-peak-kBps = <6075000>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <5287500>;
> +				};

Here the freq map says 700 MHz

> +				opp-500000000 {
> +					opp-hz = /bits/ 64 <500000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <3975000>;
> +				};

550

Konrad
