Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56EBB141F9
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 20:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB4B10E0CE;
	Mon, 28 Jul 2025 18:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxRRx4bW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B0910E0CE
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMmi026850
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=; b=RxRRx4bW+XfnjtNx
 cXxPfHvYE3kKcnxdM9/MlmG8oFS37+PQ89XZIIdeXMmN9m4UyeGOIbVxbWEfKlvS
 zXbdCe+sxd7uvON5kJ5bGT5M1SfXV6Nh4gzvfEBbKHpLJwV2XUIHDEXCTdCLaTSf
 fdQU5TEs2rlvD0xvSabZilWSFqE5tszYf7KDUH92dHYXOiFYSFylsv26+GVCvruN
 oLRKd4vdPayCzglgYIxJAfQwt4ECUsESUbzoaOoEprCJjLSFPKfcxOx5cBl/kFyp
 LodkABTEXVQz+ErtotXVSkrcRoUxOYsoMI6/Op+BMlhuE7BcbMVIhZ59POVc5JPe
 jH82uw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr5qvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311d670ad35so4425447a91.3
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 11:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753727395; x=1754332195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=;
 b=tWK2VvSFooX8GLrxqRNzbqYufWoOTqHRSouJAffCOZj/bjFznQEGVApPUfLOJMTp4Y
 VFz/0C/Hqk8RS0qQftZpfJnOihiiMMjNFiB9KNILHwCZf9kImUi6HKJnJyUpLJ/nRDXO
 SlZyd13tQuBaRR+7ayH35coJRnCP2220qkbPd8gTxSQuZ0C4JjcmHGAGXRnUXU9iSRcI
 q0RTxU5zshrGstiyfLGw6NSk86yZSB8m6uw/qPndSiwU6wwTlGBQUm3BDq74zCEUn+Z0
 O1eYzPOQhiCWtuKqAUjCccg2AhwTNJEI9C5JGxGepHzIlpJl86q0EEv3OlOiLr16adGp
 ib2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuiC3ci9gVO3MXUFcPLuWddNjKQtoL5feGLFFHY0gj82DxTGcp8DQXHpMRbIa0HzQZiWFBUivNEtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzye2bHnfb6RAB+fdBxxZV7K7nvkQj7gvarjo3XBReySPamknU4
 nbDcaXblLW02l1rxG22u8/kT182RbrIIFg/LD1A3fklfaLtvCaslAiJvThN0MVMrQjKuSBJQi2c
 j23IFHI+/bFn3JtfSBjC8gxmsA9WH0mgtgqwZB1qZpj4bT5y6J9185d5IpSmI8dDDD7uLbqE=
X-Gm-Gg: ASbGnctBU3ZKYoIVG53Ig9CTW5wQtUX28/bzVzEOodQ/mWHNSx4PeE1fvZUFkj3Cy0m
 vlqZQcGpT6jlzD45v2kKl7nooD1ncTTiHIc2dhqNhz8w5fISOKn6snqX8bmOYL8deBucJyPJvq4
 htjHxRrQosFi3vVek+kBn0ar3LSHa2PM4t4cMiW7gVZFtg80oTxZshzhF9CRaz5AN7Mdq9C9tqv
 0t9GtAk871dg2rVFWioK8W7qYsrr8ElRNrnE5G0Avqn1e8TUUQFjMvkqWbkwon/UBy6pK1NtGto
 cBAdz+wm9nn2zkJtzjzS+wt1hvuUzzVOGmlkC0qc02qRZGu4Uc/xWcV8sjWt9gA2SLXDxNPVyFp
 Ra/YIAap1W3wnNHDyo8JCMA==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id
 d9443c01a7336-23ff9835e51mr72280415ad.12.1753727395417; 
 Mon, 28 Jul 2025 11:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAAEQKwWNVIHaeiLUK+6MPkWiAUDHenXFMWUMIoSJAH/g0px54Std4EA5mF2F39xEpbfaLQQ==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id
 d9443c01a7336-23ff9835e51mr72280055ad.12.1753727394829; 
 Mon, 28 Jul 2025 11:29:54 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fc5a9d219sm55658715ad.98.2025.07.28.11.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 11:29:52 -0700 (PDT)
Message-ID: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 11:29:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNSBTYWx0ZWRfX09DUz/s9ZQry
 2AK8Tg9jX+DfsUK5CXJep/8k9hSlCmhDNz5MddE1tnIjIL3TN3iitHucwJ19OMgPZ6AtQ/w2vpj
 FA8NqSz110Ffv4Ze8sewsiwb6cGBTw7gf586KQmj0bXAJPic0LXd9++7NZo0/v1vaPlffWe8yYN
 1eW90RlJ7IFDgH67Fhpthcegpaz7OckfmXVpvLo3jdG2vZWwcSPQ9pVfWhfS51WUMHfGOan9U22
 9sPMBHbUt8S/nuN/e0AHH75iTIHoyQfun6ZJm39RXbnLzbsHT/Bb398Pmkn6WPaCh+HqKouwlgD
 n8av2Rr+lgjjs6mYpRfibW+ihk32QL/TeXEnEj5Uyo1Q60nlWqGq4/XyACIdjljbCMrCAHTZ74v
 JQI8eDKETqZ+HNYjIf6fSq0SHsQp0MYlhdnhrttd+m2gX7DRMNdGnRTFTjc8Zb1sAyimFBoC
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6887c1a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wmqSsp3ovfGiw9AtJwoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zr4OAMmErpbnqRpGorWai9By2QA7ddRv
X-Proofpoint-ORIG-GUID: zr4OAMmErpbnqRpGorWai9By2QA7ddRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280135
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



On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> 
> On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> the controller). Reflect that in the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> laptops. Please include this patch into the series (either separately
> or, better, by squashing into your first patch).

Hey Dmitry,

Thanks for providing this patch -- I'll squash this with patch 1 and add 
your signed-off-by w/note.

Thanks,

Jessica Zhang

> 
> ---
>   .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 4676aa8db2f4..55e37ec74591 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -176,12 +176,26 @@ allOf:
>         properties:
>           "#sound-dai-cells": false
>       else:
> -      properties:
> -        aux-bus: false
> -        reg:
> -          minItems: 5
> -      required:
> -        - "#sound-dai-cells"
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,sa8775p-dp
> +                - qcom,x1e80100-dp
> +      then:
> +        oneOf:
> +          - required:
> +              - aux-bus
> +          - required:
> +              - "#sound-dai-cells"
> +      else:
> +        properties:
> +          aux-bus: false
> +          reg:
> +            minItems: 5
> +        required:
> +          - "#sound-dai-cells"
>   
>   additionalProperties: false
>   

