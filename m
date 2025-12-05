Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64775CA7182
	for <lists+freedreno@lfdr.de>; Fri, 05 Dec 2025 11:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8EB10EA9A;
	Fri,  5 Dec 2025 10:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnFt2avy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3f4pmGy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D63610EA9F
 for <freedreno@lists.freedesktop.org>; Fri,  5 Dec 2025 10:10:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B54n7mJ1915875
 for <freedreno@lists.freedesktop.org>; Fri, 5 Dec 2025 10:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=; b=EnFt2avysqlqU3Pr
 R1TTsAjPul9RIqEAR3ZM4ejGNfXSxuJnh60LAdf5ma8OPXmnBjswrM0Vo+uZyzwh
 SO3fhr26TY51CgYQ5FTqLdKuxLwiWHKUEJqakaZIjfWUeoeIbpYTGKv6rTrcR5+X
 w13wk14K/zUiChaHyt9Onw3qxCI3xIcae/QxU6li4UWBQUvC51quO3K6l/crHtUt
 JyhdXRrJrL9LhByjOJZlr9ZIq21Yl5DN5F+i26IW97XUk71/kIXR3dUEt0NOcaWB
 TuqG+cg+ve3k6n057nm3vA/YJ+seRs4JWALUE6OmX45hn8fdgSX2PJUFSGlXLzZj
 BPAntw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auec1tgee-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 10:10:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee00f2b7d7so4858041cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764929433; x=1765534233;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=;
 b=A3f4pmGyvjQT6C/gJhWPWIFLWgOKkYFJdyI+FSr9Lb4hBvqdIk0918RgUE6qhANP8I
 qRocV3gutG0a7B1hW+n2K8h+G/ZE5X8QH2N3hARwhLPt3BcYVVqPJ3LBxheMxjharYJh
 O+1BvW/oZL03IslzXHqPvhhuQoy4kz3YjBLfUFqbF76sUVhE0VJZJgQ85AZj8clx2Ghf
 7yz3n02TqD9l/1gQPFxi6taODGv3WwmevXAFov8VKRT8YKfpiSuvaeBNF/6OC8wSr7UM
 l9GXBP2VQqDV+V8IAibVFSCzQwACMoLbizPMravGZUb1h9ozk2d3q5+INlf9ot7bG+cQ
 8jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764929433; x=1765534233;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=;
 b=tSHT+/qCHj+FEfqAFiOa1qf0vjsKX339dcmWBNsZpr2PVI2F5M+ITXAbBaY49PUD+s
 SlYNCDR8wZLK7vIJlQoSsN/zMX1wbOa99k0gy6Zxot3xoV1jWy5V0qUo7Ck7gRpA/CVB
 hfKkIrP5SEnrmcCb15KyfEqFaC9MIlE9dChYdvFF2LL1d4p88m05xRkQwSQWN1y3VBFk
 myDMhpD6jIJK4jWR3l0elP1tNugzB7EaI64p4HtDD4fSJc7o9crmn/v2mzWN1JRxNR0A
 dV3QLM8+z896GdpNHhCd4xNPRjfgfEsPedTy9YlD50K/bNZs6jp9/8AQdkphYlEhdtz5
 HQ6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt4zDgTvU01vIzsn5afd/b64KqKBJhgINzbr0UeuREhuKRNZy2uhTUmz9RCdyZiD+pmHDlXa/Z4ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc2t/Bp3x+tMZ1cCXWHovJKVgZuUaMqnx/5YQra5gy2+Msgyyj
 2TI00t4LW5PSIb0k7cDOLNgcqocfTjs6Z5Gkzh6TIoJsRJ0IhIP+/KAd26/yJcG2fv41CO/9ciH
 nfdiz0BVbMopYwM8pRXZ5+4iGADGvxhRLQQUIK+98UOIeHxezZWS22ydZMz5vS2wBd1zKtsE=
X-Gm-Gg: ASbGncuDhW1VUs9L24A7ef7p2vl7njrkpYnZlZPO2pXEVHtd6Vk3aFnpQn1p/ueCk7l
 OrYHiDbH0BdmIgf/8mJbswjgxKLeWuoJ3f6/Nuvt/OYfWqwicC/QiJ/nnpQoq++ciDJYdCYUXCr
 iNUl8xfbrRuHFc1Pm9PHVS4O0iq371g+o0qpNYyR60rgF+/wCfx4/8RhoSmRzsJXEM186rTsbzm
 UNgG+u9YvnDfqPJQp8/VhWIdCYl1nTHEYVDKafMGqgU5RhMz5QWgH/6zaw2pnSWehFNqt7nMRCo
 0p2J018Z0a3HjZ47aGXm50vXe8/G9mBJc/jB7mR0Pj2aYQERlqPAlMTBcLkkV85bIWfzJF75o8T
 uzD+mjP5HTkKC3/AOplTzsszHCUNa+qJTxtx+ObGFqfp5knPihkHEXxKOsyovvHx1kQ==
X-Received: by 2002:ac8:5dc7:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4f01b4ec03cmr86964341cf.11.1764929432721; 
 Fri, 05 Dec 2025 02:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyRAhn0k1YE9PnYXg3wa/SAZLktCWYdIO5bMKO203xivv/wR+f0izBEVjDCYKjQN90jdqwmw==
X-Received: by 2002:ac8:5dc7:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4f01b4ec03cmr86963831cf.11.1764929432114; 
 Fri, 05 Dec 2025 02:10:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49d24a6sm323585366b.54.2025.12.05.02.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 02:10:31 -0800 (PST)
Message-ID: <7d71f882-1d52-43d7-9f0f-e7f7b53c853f@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: talos: Add GPU cooling
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
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HeAZjyE8 c=1 sm=1 tr=0 ts=6932af9a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NCBTYWx0ZWRfXzUBKvIhIjT1x
 /28n+ix7qEATr1s1xEy0R8VPPyc+3apGyIdpPuqF9Uf7YHgTHYeNh6EOPk3y4B2ijuT1m9Ua5DF
 r3kN4MIGaEQXyq+uSEBiV1z2wtDe1bltpMu0rNCH5aPE/s1dQ0NpB5X1RrDWetNX0N901dBrEph
 O3ET2SkbEZ4+KMkjCuV1dNkWN7tCHeM/7dbLVai3sCVHTyuGGKjs0DHA6Hyi9PJ2AVEdqpfce46
 esxreudQ3eSCKtoGOuyxg/UACAKukAHPiJESVOcsoi516ra7VlcdbFs0LVpgBngGaXuO9p+5JLe
 epTz6nvjkZqZyoKUPS2YGz4TJlD2TQ2l5OtzP3ftsSsCtqQYP5PbsLSq4X4ZvN1rqy1XcQRCwbk
 vhvW3+tpIy5YAcGSpzF/OXjLsZte8Q==
X-Proofpoint-ORIG-GUID: mhylVxnAVGN8pHqOQDWyFP1XiQu-5YU_
X-Proofpoint-GUID: mhylVxnAVGN8pHqOQDWyFP1XiQu-5YU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050074
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

On 12/4/25 2:21 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
