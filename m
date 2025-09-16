Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E46DB59B8F
	for <lists+freedreno@lfdr.de>; Tue, 16 Sep 2025 17:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378BD10E374;
	Tue, 16 Sep 2025 15:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3oPnFiD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5675110E0FE
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 15:10:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAAXNP020364
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 15:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g1Z+oPGXQpLxnAZpBbOZ/u5c
 mt3wM5YUAcTV6PLokuA=; b=d3oPnFiDYbzgsQw8vdiCpR76ns9JcYMBKPVaX3jd
 gApfGla58qI5RqlUdRsrwP7l4h38RQrOVWEJBaA7Bjpw152xxSpJgj6FM4j/pAdW
 E0rO56RTTKFDdrN4AJMSCnu3d6XIFwbmp0drBaztN2DdcT02u7WDNv0uGcySfcBV
 C45I9SLbYWWwgJornlsCEjUPpLm4PuJCUHjWE4cn3sIfqehMouKdlJz+68Q5G+M4
 UeZ1GIOQYwZjTl8ojT7PumN5QELIeu0C55hbDAbR5tKe+AHUkkCIJrYjy0kdXXDe
 Q2OlISo6BuWzYQ9jrBBNohaTST6pNEEygFxBgv/5BASWjA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chh84p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 15:10:50 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-89095e14094so393642241.1
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 08:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758035449; x=1758640249;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1Z+oPGXQpLxnAZpBbOZ/u5cmt3wM5YUAcTV6PLokuA=;
 b=XdOs+9qCfDQo0Aq/dpc51PzvVbtGLm5D48ohnVC6GK54ia3stZ6p9LXLd1wJyb8Rkp
 DEAKLWC5/xb+4kdZATOS1BAsj/MMiR7P4kiInvlDnSWsv8dpkHdCI6TxCRzfGquwr7A/
 99KxLkRqY5SvNJ6R1Vvre0EpnAK38H4j5gY7MsEUdFiqJhH69JET7Xw9dn1qMUogBiA+
 I55lh3kdn1Dtzg/HdSZ+08cwWP7BrewZo0trkdv5HfaQXL3oWpWrLjxmG49ZL28U16dg
 kqOG0400o+2zwuXLSugVf86P+UXww+TUoarGuKJJUAKToe9zX5nlApsUE/l3/eUUkcdg
 Qszw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyiyNyMcENOMVdGo00d0OnO5FOn/xhmo1HKT+X2tDYA6cp03tOXxxGTUap7rkwDHihaiQovQD5Ado=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7CGeoiaJH5mT7YXAiz6hJGu0IHFAie7Hp5WibcpRncQug1XsM
 xDifeQQqV+6iRPhO9vCDyivddj4luEo1keccZAMKU5wQf4EuuOz5B4nltc+xNJDtxUdjQ4bUDlZ
 4zJavDOPP9rSsJYGvvwQGRSoDWKbpCaTtgkCRblP/x+fvoEieNmsvRVKjaMfgeh2NOyMN3vY=
X-Gm-Gg: ASbGncshWBiEHsxjCHq8DyHMXqM8OvKz7DpMv1UTzf3mhFkpkgYP6f/HUFwTtkxTl1D
 VWlAn4TJXfVKBDuGjj6aAchJDY79EFGNZIXsE6EqqepHkayKYoWt5EMvEIgq9yTc1+PCfsran7s
 YS8PeHjMmizolnQXudMlwax3jdbwihcjWEe+Wsftdq9YByHNCOzl03dcbZYksMgR3bh79e3XKYg
 SxQ81sV3z7y+p0uqMvlK1kcx4yR07AjVX2sJ3zP1bpvvMq0yFljdmKXFXTfPBB8ZCo4mzJC8tnH
 oRpMDoyWq4ZBEuh+zqay6oF4w0T5SGJGW4f5jqrm2CNUhkhxPbHiZnK7wTVM4c7U9wJ4tSdPPw4
 E0yUN0cHG+d80pnRSvb6ycnGfKVq1AUcvjjeHaiyeRhsBRfZllbc2
X-Received: by 2002:a05:6122:8c1e:b0:545:f023:ac1d with SMTP id
 71dfb90a1353d-54a1699578cmr4957825e0c.0.1758035448961; 
 Tue, 16 Sep 2025 08:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjBcIPt0evZtEawDOU4ceL65KWW429XS23INAGRqTzAWor5/oJYp5i4nvKOrZ/npWDeBcWA==
X-Received: by 2002:a05:6122:8c1e:b0:545:f023:ac1d with SMTP id
 71dfb90a1353d-54a1699578cmr4957779e0c.0.1758035448483; 
 Tue, 16 Sep 2025 08:10:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-35e8957bc07sm411231fa.18.2025.09.16.08.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 08:10:47 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:10:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <av6zvj7civjycnj7vsdfufdlnpcq4mlpz5cwpamtapzkdqoe6h@rqfea46xs2r6>
References: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c97dfa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kjV3pKRppw1HhCH-an0A:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: mD6XP437nRT2oRudWi2SVSHSESnh-VJj
X-Proofpoint-GUID: mD6XP437nRT2oRudWi2SVSHSESnh-VJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX0wYvJBNVGTsX
 HJjdfElB9B/Dqapj5Rxt+RrYsVicbJ+VbJ8Mq/bOXalBI4LTjBkj9mvv+SZoO9Quyey6Bm/AQZW
 ezy9kF4MGlqxnALZboYoTDgK2Y9LmWNDmqaN4jwudBFKEiopu4625dxLBjrmKK5mGK5QBprPsHL
 APISg7WGD4zhUlP574ZAdpP7YS02wdk/LP9P0orRvn1a5sL20mv1TZhd9GXtzT5f0u6eWAeShz6
 vQzAKhoOLLeEJbsb6SHGTIy5/fWXLOPcQWnRTYuH/ASOkqg3rcjnLK5zGUve16EwzyddbVKGo21
 /Qon1VcSitDnJe0gjFxCCRfRF9j1quznb15pgcnzVOmbIcictuVKi5kRwF4SaVyukeCYCtN9u3V
 iQBXKZRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036
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

On Tue, Sep 16, 2025 at 08:11:03PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> SM6150 uses the same controller IP as SM8150.
> Declare 'qcom,sm6150-dp' as a fallback compatible to
> 'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
> bindings and to ensure correct matching and future clarity.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> This series splits the SM6150 dp-controller definition from the
> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> 
> The devicetree modification for DisplayPort on SM6150 will be provided
> in a future patch.
> ---
> Changes in v3:
> - Update binding fallback chain to "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp". [Dmitry]
> - Link to v2: https://lore.kernel.org/r/20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com
> 
> Changes in v2:
> - Update commit message and binding with fallback configuration. [Dmitry]
> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

LGTM

-- 
With best wishes
Dmitry
