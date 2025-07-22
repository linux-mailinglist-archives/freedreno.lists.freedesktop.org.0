Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93837B0D4CB
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 10:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E2010E62C;
	Tue, 22 Jul 2025 08:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BoVWvkHA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0650010E62F
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 08:38:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LExU015188
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 08:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1LN3juNr35Nerg/PZAItQ7sh
 /peCDRI4YAsD2qwMZyw=; b=BoVWvkHAGvdAI4rzH7r1eOMj16IDjtqa4Ny/iBq+
 mwlDIczIE1TwFupSa1JXzY8AWNzdlKSQY+kkxCOFOZiGfZpkCxbUnjdP6Ie6J75I
 aDS46WDDUjsAL08I9iJyVSvdz0UqXSxx2TBpTrCGaNtYvWqMjuiDA9IQ34yZBwYp
 Pc/+E3AAvKXl6JwXRqZXWzdPr82LHGc9+wOKc4Qayh3nMELJ2qlpjr9LX3Kv0ik6
 E8bKze18XmZJgAtwgKCk2EXECWMnKR1qWv3usaIlgwQw/r4T6bdbAmVJgNjlWzQk
 PMfmjttFiIhSKnyBKOYL8pk+qolWY5Oosb3qmA8+bzKAvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w1vp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 08:38:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso930554685a.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 01:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753173492; x=1753778292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LN3juNr35Nerg/PZAItQ7sh/peCDRI4YAsD2qwMZyw=;
 b=C034he7ii7/9ycHrhXtlIRGEuvgIgt+jVH4TpmFxhok5nSFSpZ0Qrj4eN5d+HrtdY3
 mfxwZ/ORdH+V8E+1ayA7lYZyS6jZeC+gnxncIC5OCTMiJKSlwtwRqPAz1UzstgW/MeCT
 QdjUtI7KucuQlzaCmivRKJw8Lj7JPLnJbzIJL79jLJMWaM87MNeb8fJTkD1RmZOz5Idd
 teI4Z5CLHA+LPSuIvwvVUGkzTVTog4OUzzSvGQPwR3bRZ3QlkyIvfkwO4+QvapVHHVVc
 7tP+EVgkC+cmpNwxtPH9oGlqTa4Tb8TWNTfp5eF/i+97+9LdviQDE/NkmhRUcOkN4/Y0
 dHbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ApdDJma59VKHwX+j7uZzsdSZDkKkBFcfyiFvbCUwRhskSuBt3NcqGp7QQD93gBVmHfR1+/fXajw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZazhDIH37kVa86sdP7ZYUlkJwA4CflClnIe60GhCHBDEvs64n
 x5bPFsjY+ax9S72yc2SYTLA6U/a5gORAkaXKCfhB61PcdHbXoLtgnnvRE9BO/aaZo4QMohDwQ3u
 InPoYQjeXGsLhynKva46hJpoxqPkP8RWxZ189NKALz8g+Yvuhpp6RfpW0uRpJ5wNkLp85ci8=
X-Gm-Gg: ASbGncsonrcA1FEFfY1/k/H+2+B4rVy/U2Z1mQ9mNy7Xi8Xs9f7dMFQcRR5fp6Ve/zn
 Zhd/ionfvMhGnrSOBX8GO1+9paH7XyDEugGakNBYW1bW6+297xxotjTb1ojoLkld022z6P8QFn1
 QLY/OesJZSljApgmQhclwxVh/PHWzzO+tpYYhDKBOXRMmnN4fU4LsoDhyUx8aMCh4on8Ygb17un
 fKZs2LQGAPwzzlKeD1R0az4lvv7R2ZYHas+NtnVOlT5+NJ4g8FqcTB8Sng1YJP8RwBOyVSIBUKC
 7l5mrCvbrSOwiutHq9POIjCh0UyttvEau3JL28c1QluYn3u7X15EZ3G6eGYOBO31KBs1pQtVNnx
 WNJ9cbG354pPPBr2spPCdPiHFvqCh8pZKiwGNlVeYVWVWmXQLJCir
X-Received: by 2002:a05:620a:406:b0:7e3:4413:e493 with SMTP id
 af79cd13be357-7e34413e881mr2290740785a.59.1753173491880; 
 Tue, 22 Jul 2025 01:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFbsL3wu7P/XdnVzAH3W4UCqCA/Ov1LUyaPJbXnyrUZTuDLtE4QZ32mMPQ6V1IvABbTSx6EA==
X-Received: by 2002:a05:620a:406:b0:7e3:4413:e493 with SMTP id
 af79cd13be357-7e34413e881mr2290739285a.59.1753173491349; 
 Tue, 22 Jul 2025 01:38:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a4ba29d2esm101582e87.59.2025.07.22.01.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 01:38:10 -0700 (PDT)
Date: Tue, 22 Jul 2025 11:38:08 +0300
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
 quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
Message-ID: <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f4df5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=BMzRNCE2on2YpiivjS8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3MSBTYWx0ZWRfX226etD4uUil/
 oOohMlr6aJhLDf1x3T8La09rfjEHBZm2d3dKhXYAu7mCQdRTuVVUigL3q0IIJRe7ilalQuhYyGC
 VzCJsoFNCSpDAOcZTaUgEs1r+Pk0P0wthCB/tyzDe67172r2Uvap0Wq5a2t3e9n6cOT5ol4/ZGy
 tj4+ZDlGrwRZF3ktz+kkhsS6juwaJlC5CsjZIIZWG86TPAHZB0HSy48ErQO9Cs5Q8TOB6VQyxUY
 YI5UCBamImeANeivzHQyUQ6hgB1WYefwwEZUnjavWHDvT9l9zvTunowixa9bQEL0khdIUEMTwbE
 ZpUESjXChL09NjLM0Vnu9QpcA57XKrspfuCPXScrQMUdcyGbKnNHKjGr7XYJ2epXB2ASrRjqX01
 B2miXGSbRwHrGDjJq+dP5ZzgVrFuUMFmNzZK2WgHC6qN+neeFcMbnf8TDUmDJhqy2YgrL61X
X-Proofpoint-ORIG-GUID: pINasE36JINXt1RorZusQ9EnGm1mxtRf
X-Proofpoint-GUID: pINasE36JINXt1RorZusQ9EnGm1mxtRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220071
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

On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
> designed to operate independently from the USB3 PHY.
> 
> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
> standalone and does not support USB/DP multiplexing. The binding
> describes the required clocks, resets, TCSR configuration, and clock/PHY
> cells for proper integration.

Simply put: no, this is not correct. Even if you go to the SM6150 block
diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.

I thought that we have discussed it beforehand.

I can quote my comment from the previous thread:

>> No. It means replacing extending existing entries with bigger reg and
>> #phy-cells = <1>. The driver must keep working with old node definitions
>> as is to ensure backwards compatibility. New nodes should make it
>> register two PHYs (USB3 and DP). On the driver side modify generic code
>> paths, all platforms supported by the driver should be able to support
>> USB3+DP combination.

Looking at the hardware memory maps:

MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000

Now:
SM6150: USB3 PHY regs at 0x88e6000
        USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000

I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
can comment on it.

But based on that list, the only special case that we need to handle is
the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
it will be handled anyway by the code that implements support for the
existing DT entries. All other hardware blocks are combo USB+DP PHYs.

Having all of that in mind, please, for v3 patchset implement USB+DP
support in the phy-qcom-qmp-usbc driver and add the following logic
that also was requested in v1 review:

>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
>> powering on USB should fail.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..17e37c1df7b61dc2f7aa35ee106fd94ee2829c5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QMP PHY controller (DP, QCS615)
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description:
> +  The QMP DP PHY controller supports DisplayPort physical layer functionality
> +  on Qualcomm QCS615 SoCs. This PHY is independent from USB3 PHY and does not
> +  support combo mode.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs615-qmp-dp-phy
> +
> +  reg:
> +    maxItems: 4
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: cfg_ahb
> +      - const: ref
> +
> +  clock-output-names:
> +    maxItems: 2
> +    description:
> +      Names of the clocks provided by the PHY.
> +
> +  qcom,tcsr-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to TCSR hardware block
> +          - description: offset of the DP PHY moode register
> +    description:
> +      DP PHY moode register present in the TCSR
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy
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
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-output-names
> +  - qcom,tcsr-reg
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - "#clock-cells"
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +    phy@88e9000 {
> +      compatible = "qcom,qcs615-qmp-dp-phy";
> +      reg = <0x088e9000 0x200>,
> +            <0x088e9400 0x10c>,
> +            <0x088e9800 0x10c>,
> +            <0x088e9c00 0x200>;
> +
> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
> +      clock-names = "cfg_ahb", "ref";
> +      clock-output-names = "dp_phy_link_clk", "dp_phy_vco_div_clk";
> +
> +      qcom,tcsr-reg = <&tcsr 0xb24c>;
> +
> +      resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
> +      reset-names = "phy";
> +
> +      vdda-phy-supply = <&vreg_l11a>;
> +      vdda-pll-supply = <&vreg_l5a>;
> +
> +      #clock-cells = <1>;
> +      #phy-cells = <1>;
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
