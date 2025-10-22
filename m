Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C34BFCC58
	for <lists+freedreno@lfdr.de>; Wed, 22 Oct 2025 17:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE4D10E7E3;
	Wed, 22 Oct 2025 15:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAMgLndq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0AB10E7D7
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:07:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBvLx6024209
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AizstXEr7j+qbEZcyP2bfp+P
 4ZNYzI2uQPOCe7cb9eE=; b=VAMgLndq5aZabdDcknWnnVTZSyxEm3BZHhfkYEdy
 8LbwqLs0IjtwkctqPa7y47YKvZo1zWhXPJW0IP6opR8rTmllLnwLMfx7UcLCvJeS
 EwQ3lRLiYfRg/yOYDCI+oUsAkmGmqdRVFZR9v57weOQvxjR9aZleUhi2aoR7JZT9
 16/zxlyDDV0nBEgIOy5P1vUBA1TZeOlJ15dHPIsVdxyKSQX+ucwRYwRHrcv+fT7G
 e/8lpDtKqTNZ5ncYm+HQY0dkitQzRI94G9DIOnDS+r7AV2ZgN8XY0gB+tbZNXRRN
 6to9VhqF823AB4K+14koNECPB4gi0jINzr0M29Bc8s198A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8547e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:07:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5569a2b4244so545139e0c.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 08:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761145662; x=1761750462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AizstXEr7j+qbEZcyP2bfp+P4ZNYzI2uQPOCe7cb9eE=;
 b=GXs0PZDakehWzP89ukKx3cS2P5sJBRy105kEBlY3siuRoOlkxQ0tQkXBB+czzY493m
 zx6EpvxINCDLnVjkf42qwVJWopMWhz8a//3JMldHaymgAihCUesR7z4aR7tvaAdYLaPp
 AKyrTbmxMOGVdbhcmtTa8vodLMRT2dKs53WJxDX/9LIaMDaSxncZQLDZ3lGo+iP72jBP
 E82uuSw+9NcO26+OAQGNWngQCDfn7lGFFg4zQs3L0eHdBFehBCd0bHrPJc3UqcxmZEPm
 NtefyvShvcDYJwnAL+wDCdFrxe0U5lc4VGziAGC3PVjAQFq+A2LlcI0Key1JR3EjSpeC
 fSTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBfHgmFjU6VU1JEJbg0bKBCDYKt7AJ6QO0ZO9Jdd5AhrguSGaLsmdDp/jFMoSnZmAv+luZx5I/v+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywqx2KQD45kUUCSzIkrNr2I6Vtcx/rG0pdcOcnv3TnSPcuqNbG2
 1DlT/CoxQDC+dFWtv4o39+LQdAZ8UDkJvxSEF8U1XnI2vp7H5TeLo5WWq6tN0lxxiLaduVMRAn7
 hUYPvBbMwrYyjGeQ0UdPB0kTGPwLy2nI2wlcZ+ZRxu6owI7VXOpzfs+5YcCBBKcLnxkA/AI0=
X-Gm-Gg: ASbGncvzm0WrVmgJRJEF+7euQoZxWwfGlnb9iNcQU9ICGyR1Haj0dAGjlScjDyv+OrQ
 BY0Bn/9uvSo+A01Z1QCU0y6S6ezGmbBKSZRrk9Rd8DTgqMXe019gIiuViM6pjGgoSKTKtazdpSk
 OztSxzTgssBWHkFaiq+XhRpFoYKoI/dmY0shgW+s1bZHKJQRZHhS8dsoQgqYfoNvPRFfKOp4kn+
 mvzYl2TL+6tR9QUvIYOQvqLZ+eNiglCHrMEf1b4Avt9SVHgLlnxAg5EtMb7C9q71vEgVpVcyJzs
 TWDFv7ZWxm6ne7sNFPpxzbXUTmJdBW+iEdCYE4VaTRg0RXveAaWf2nx8YKHqxg1+dD/wSQyFikW
 XVAaaqdhKThuVuNai90sxwNvDWcqgTah1K741MntT1vxLFzqiZgZu+0InKFE5XvyG03S1E57CLR
 qVmJCPQN9RX0I=
X-Received: by 2002:a05:6122:3412:b0:556:745f:6a06 with SMTP id
 71dfb90a1353d-556745f6b89mr3111944e0c.10.1761145661768; 
 Wed, 22 Oct 2025 08:07:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFXovL3a0V22gWge+cpQKP3S8k4AeqKhy/tySq4N0wYr3JuPRxNPuz/9nahs3f/axhVrCdrQ==
X-Received: by 2002:a05:6122:3412:b0:556:745f:6a06 with SMTP id
 71dfb90a1353d-556745f6b89mr3111877e0c.10.1761145661262; 
 Wed, 22 Oct 2025 08:07:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a9586b2dsm39381791fa.46.2025.10.22.08.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 08:07:39 -0700 (PDT)
Date: Wed, 22 Oct 2025 18:07:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Message-ID: <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX+FxjLoykjFKw
 VMINl2udJ6kXyNDSeaR8kG/7E5qyGM6a29hMrp8MG2lNfn87jF2fidkJn7U/Yn2x8Nt23G0q3dM
 OCGBEgegmMZx70i5xU8uKVUaJQNlWVcwORX0WaieD/7K3gUsAaNVrFZFEPeODfMi0uIY96IrkTi
 cgmmVBc1Ld4OLjXTWeUnerkkStnXkGosUzZw0dDNBnKlj4pA4NAe4veho5ANNQmKu8QYuAawav9
 /dj8OtSIvzeS6FssRL3mTq45FTmctIQGXTisWitEJYVCCrFFSsVCouKuDlgluEqVnQvYqa5IoXk
 5JOKYdBC2T7xMpXoSQ+6sf9KQZztSSb6Dgq+1L+p8puiZmDgUcQMaHgkKr8lB97D6maAulCAbVJ
 x+9278uT/UvCYjiE0XrompksmC9g9A==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f8f342 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=I67Lji_zawwbCJgw2PAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: so6KyccuNJIXnVd8gaQg1QQImHKyeZ52
X-Proofpoint-ORIG-GUID: so6KyccuNJIXnVd8gaQg1QQImHKyeZ52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> SM6150 uses the same DisplayPort controller as SM8150, which is already
> compatible with SM8350. Add the SM6150-specific compatible string and
> update the binding example accordingly.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -51,6 +51,16 @@ patternProperties:
>        compatible:
>          const: qcom,sm6150-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm6150-dp
> +          - const: qcom,sm8150-dp
> +          - const: qcom,sm8350-dp
> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
> @@ -132,13 +142,14 @@ examples:
>                  port@0 {
>                    reg = <0>;
>                    dpu_intf0_out: endpoint {
> +                    remote-endpoint = <&mdss_dp0_in>;

Why?

>                    };
>                  };
>  
>                  port@1 {
>                    reg = <1>;
>                    dpu_intf1_out: endpoint {
> -                      remote-endpoint = <&mdss_dsi0_in>;
> +                    remote-endpoint = <&mdss_dsi0_in>;

Why?

>                    };
>                  };
>              };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
