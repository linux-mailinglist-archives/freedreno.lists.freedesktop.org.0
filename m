Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8FB2D9B4
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 12:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEED10E6DE;
	Wed, 20 Aug 2025 10:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmwPi891";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D67610E6DE
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 10:09:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9oYv2009680
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 10:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZzyoXjeixwKONwz/qTB0oBJK
 sSvE0kt0Ll8kNycredI=; b=YmwPi891MF9yI/eE9XHNxDGzZXiEBlcE8USI/+mj
 sJuh4fyQf9+6VxY40cJQnz7OCMH/t2x+K7wS4rBP6rcOzkxzzt9BSskD5T6g9EHC
 HuuDdUJBnAlYeTsNlJr6NdwT1gnRYaum6Pf/RRs/JsNNR3ruQe/pP4s3quHbescH
 2uijlbvytgVZ/ExVCW3neaiKd9Uz+mvfH06/Otw1bUck/7TvlPbHH7JEjIrg7a2D
 97OweyxTjdKHhqOdbWkpAD/g+PMI6HxqozGdt9pFJ9FID06rTlGbMGeoe3MSwPfE
 xhfjtdomv2rcZNr+u8jgyixSQuRrNGXiYi4LKlp/pZPcbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a1bwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 10:09:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b10ab0062aso169324411cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 03:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755684579; x=1756289379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZzyoXjeixwKONwz/qTB0oBJKsSvE0kt0Ll8kNycredI=;
 b=AigT5rafYO4fWtwoNENNiFG3Ug1xsrrSWYWpeqUX4GMlD88lFJWzwaZXyQ2x4OpOP4
 1YUBaUCziu9CfWhv3bfEgWKv+yljoq/8MY210Q4djE6G6q70F1/ETgww0c+BwwOvDm2Z
 cfOPHMj8hijcHBytib93LwJV2OJRkzumnLeHDPgMWY2s7h88EhrClwXdu2h2B9yiuB9l
 j5GcJd9XUuEg8adUfCAji7L5j4B5Gwl68MuHT5ocsYvcXs2W68DN5zF0kStDk9otbEVL
 WIFYRxQoGgYvsAHThhFRYBwmxxDXWxh/HRvB+Kl/zOUfUufZ2ez/I6ILeI4lsdxkXcZ5
 Gqjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYgG/FkZcvo8pNhbv+VoIGHmvhIGnD4tv+R9sc+zfAkxn1cLPZRpij6Lho6D9uUsC+JaEreJmsak4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ4yc+bUd7xBMs0sal09sfb6qmcDp1uQEunClt7S1Ay4+i9uZZ
 71L1nTNmSLcuQ6wiSMSavAj34RhEOEFcqd+pxz+hwy18vCogOWL7Cjf3otAa7RmtzvYppY6a+dd
 Ixa215YE+fHpiRwnCD4iz+KgOoAZzUfDumh+/x6hl8s5TWtuBfQkOTz9IWVFnGDv3Z1QzJJ0=
X-Gm-Gg: ASbGncvMR2qZ+RaZNWDam1vwPuUGAvbp34lP8qQlZUucvjiK8yiQDa0y+vQV5lum2Xk
 t4Z/VhnjbaA06wD+Upq1BSg4FlBf8DDPIBjmuJLKjRSwoK2xb4Aa9U+i1iYVOzuW3EKkJJ35lNd
 CTr8NhKSfytzBMAcPlbEZ6Rm0TXtWgRZxGepAzPwdachdamESfetZuDo/XgKEspporWIG9oPMYR
 OnNCz6g1//dJs3aTAk+3N5lMyH5UZKgPMDpXc5dyFwXHYUcpocbrzM+ps/dnRYq9ZUaMubbFlG9
 zrXjpukRAY1QLJfPm90i1np50zsU+/JBl7msyhUv5//CUWyqNe8IY6+4CrEldwKX65aulDGIV2f
 ArfhXY1oJsV9a7w5wrwtF3+DRn/iqJpJhU1TkNasUjAgoynaeq1PK
X-Received: by 2002:a05:622a:4c8a:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4b291baeb33mr28831521cf.38.1755684579172; 
 Wed, 20 Aug 2025 03:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO+07cDalcclEJz4U7wwfw/PcTiuXWte6zf1fXyIS6NX7XUcddZp81APEIdTIESPROsNMifg==
X-Received: by 2002:a05:622a:4c8a:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4b291baeb33mr28831181cf.38.1755684578661; 
 Wed, 20 Aug 2025 03:09:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2524249e87.51.2025.08.20.03.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 03:09:37 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:09:35 +0300
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <3lodaz4t72vsxnstfe2msooo3dnwbqy6hxzdshcmyrgb3fbjnv@2afo5atezt24>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a59ee4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=x0hJR-vgZ_cmirHItZUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 8IJMDVDP1uWCs5TRwurBXgbGqfoDhmzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8xhS0Nxekki1
 PG6V3eT4DAy4YcQgepXTKeplR70CIjNa99GonNah4R5kOF+0V3wrqMegK0AGj4sISgP1Y6Ozfj3
 GiuVJHGhd9l1dvQn50m9rh9O4gWody9HfthG+fuziFDTlPHIdV5xUGMwZBbXD6NV0GHsIHSrLd5
 9m1gM+oPKbsCQWCkhh2kjA/CR0AntGgZXGS9xFPvCK1gvev3o43c80M/dHa9BDZTj4gZG71kdCN
 iygIPfvBs0NAckW961cZnlBXPMm398aFHw37EogvSKQ5VoJEV3vnHju2jmdU+9d13Z9Wuk3UIe0
 b3szD02gmxK/NIQjh+USyk76FbX2QwfObeWgoHuPyctlvFZUSyquB6/WL+oDNkxssowVeHnWmXH
 tb9WFpm5lqZqdKrp0wWikdXv2UHJ9Q==
X-Proofpoint-GUID: 8IJMDVDP1uWCs5TRwurBXgbGqfoDhmzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> on QCS615 Platform. This PHY supports both USB3 and DP functionality
> over USB-C, with PHY mode switching capability. It does not support
> combo mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description:
> +  The QMP PHY controller supports physical layer functionality for both
> +  USB3 and DisplayPort over USB-C. While it enables mode switching
> +  between USB3 and DisplayPort, but does not support combo mode.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs615-qmp-usb3-dp-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: cfg_ahb
> +      - const: ref
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: phy_phy
> +      - const: dp_phy
> +
> +  vdda-phy-supply: true
> +
> +  vdda-pll-supply: true
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See include/dt-bindings/phy/phy-qcom-qmp.h
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      See include/dt-bindings/phy/phy-qcom-qmp.h
> +
> +  qcom,tcsr-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to TCSR hardware block
> +          - description: offset of the VLS CLAMP register
> +      - items:
> +          - description: phandle to TCSR hardware block

Why do we need two phandles?

> +          - description: offset of the DP PHY mode register

s/DP PHY/PHY/

> +    description: Clamp and PHY mode register present in the TCSR
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - qcom,tcsr-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +    phy@88e8000 {
> +      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
> +      reg = <0x88e8000 0x2000>;
> +
> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
> +      clock-names = "cfg_ahb",
> +                    "ref";
> +
> +      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
> +               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
> +      reset-names = "phy_phy",
> +                    "dp_phy";
> +
> +      vdda-phy-supply = <&vreg_l11a>;
> +      vdda-pll-supply = <&vreg_l5a>;
> +
> +      #clock-cells = <1>;
> +      #phy-cells = <1>;
> +
> +      qcom,tcsr-reg = <&tcsr 0xbff0>,
> +                      <&tcsr 0xb24c>;
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
