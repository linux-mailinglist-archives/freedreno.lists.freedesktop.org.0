Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF30B30F7D
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 08:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2563110E06D;
	Fri, 22 Aug 2025 06:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKgQV9n1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAA910E06D
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:48:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6Gja0002711
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wt7rxN5hrf2QPuy6mxcJXvWkksap7MeXMIyW8r0g2eE=; b=mKgQV9n1vTRZQ6/l
 ZmTEHvaDDWuplAmg+x+xQzrZWj7Q23cyJFazU3pCcvmYGX3IWW6xyIVNx2OKHBGb
 jWBWFhvfckHXnOrvurHn4GQ7DbqrMgwYADmJKhhAo+dvBvhD5tN6S5Dcme12cG1y
 QADsZ0sb66OXBbG923zTVl10ni7Jx7Fb+S4J8ezHu0hPd9FY3gOGcOmWJDhAprrq
 9WAY9zYCrTC8DPW2Pv7lLhDwEqVA7Mqj9nCcP/NmTZ1w9nr+rvyYO2r9dx4NeHzf
 CLum0i0zw+iX+nSY99LC2lg/gYa+TSC+OrgR2xy0pqXn6Hd/cNP2UA0gGT1uNzn5
 7w0iYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdny55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:48:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-245fbdc2546so5593545ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 23:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755845317; x=1756450117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wt7rxN5hrf2QPuy6mxcJXvWkksap7MeXMIyW8r0g2eE=;
 b=o7AT/IZUDcfmDdMXx/pnmJI3DXcupkw1XtY2G+awJEelaRKwQ+l3mEWhMMB7hWuhme
 NUB1bBObZ0qhfet4tzKpzNligqEsIf+hj0hUjq97wgexy+kuqaiM25vg8bnUdUcf91Nz
 V9gCIh5bTMrxyjQNhv2TZSLTuhnrdbqXRy26/WVoNctEYlWK3mS6hsvZIwcBCLP7+Jqr
 bR8XuHpAgsimQj7HKc5SCoxBTBMQhg+zU6wqsV/yrxDM9FbVuw3neXvNiLlUC7uswZ33
 tiybX6aVwnUKYGgj7wUSkK/XH9zXOb5pm3fxAVaU/h5Sb2YAysHqhqPPWFZxn9nuVxRL
 wstg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB0zxESLyJSBfAAJ/aZjLdxLtptksdmG4R3LK+YFjfINqGAt2iiH+qqBj6tC3Nb2g+Ea2rsoLkk3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTICMRfUSSusFDHmquIlnOeTdMXe+AhHzLfbXt9fwoeqkRLGHt
 shmcAe5CZ5PH015H2PNy42gS8+xu1wviLAEa0NExG678DrSQUFpWOz6jq8gFJJV6vqIuRQaZih3
 ej3Pw/36M/+OucIYvMPgvEtNoB86D6hMHKldW1/XGp0lDPvxqyuwzXXef75Tx/+13VfdHFAM=
X-Gm-Gg: ASbGnctt5Ea5UOPXz80szU/akhqHkI91qXEmXWIdrHvw2qCVITFifkutk4tZHZ5WNFc
 7IUl81TQwIGm2ALstrrhfZE0afEfTTzMUIpkuWX0LhIvkCJomz375gssy3uz/5/RdP+xgnTY1vP
 /825Q48xvRaidoQ6DNCgvaelS3QLc5Sarja39d714LEaB2cYMFmPm4juxsWVJ0GUpayszsJ+3vF
 VhFo1QzeSlsYLfEb0HHfOgbcJ93rR//F+Ie+E1hu+wrcSsBosPibwrvOEEQh6ZBV5jt2Kv4R1Bf
 a0/xNmh/ynREFU9pWQOaI4jM3YCXYvWd69SClNT0K53MMTl0o3kLSbe0eddVjNaEUcoHAjOU6MV
 LdgAv06L7XgrGBW7yfCT5mTmV0hvygw==
X-Received: by 2002:a17:903:189:b0:242:d237:e20b with SMTP id
 d9443c01a7336-2462ee3033amr16553825ad.4.1755845317139; 
 Thu, 21 Aug 2025 23:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH61Dg+R7H0dG6DmZ19hrTFC03VFv8xBO0r6XYbjTLMp1iwo0A+Wvhyyylwysjt+0wtsntd1w==
X-Received: by 2002:a17:903:189:b0:242:d237:e20b with SMTP id
 d9443c01a7336-2462ee3033amr16553585ad.4.1755845316681; 
 Thu, 21 Aug 2025 23:48:36 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51c027sm74231315ad.148.2025.08.21.23.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:48:36 -0700 (PDT)
Message-ID: <dd3c9cc4-3b4a-4321-88ab-933909b6da87@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:48:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <tlilctwavwqw6oy46l5fote2pa6f4hdy2im6meo56cjaawba3a@a42bwbbfnsuw>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <tlilctwavwqw6oy46l5fote2pa6f4hdy2im6meo56cjaawba3a@a42bwbbfnsuw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a812c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=bGlgfQEnYdfhEoguRucA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: rsoFAoyzObX4Mvvv2hxN5TznqEU6ygmT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX7/dwvmezuTAN
 eY1eaVv7fNDLVYLjGAQSd089Oryu7g6mD9H3o2e4JP6aulh3WuqzngkrM+H/DiGR8WiMDX0ZHf+
 o8mFQpMDcT6YG0g5rol/f5HIbE5D4Jj8O1EPjQaYFhrCoZVXZUUA3nGG1g5waFSvnmDcdhN9e3o
 pJFaJ3+2pAkhAngG8SbieWYnFbVRCNQ8XCppzIehxbw7EKU791jrCvQ0W573ZvBp/maICTIIApJ
 Z0bLDMB7le/ng8wIlpYu36hE4cSoOSpiDAFYJVA2hqgNl46XP3/1UmxhqbnhU392tzmzHm7gdOG
 FVW9GbH60iDN19621HRXmXgFiuP6g3h8Vbi2Rly/I0vhbDPP+ZNQ3bo8z6aJ7ufJxTE8rNhJuxV
 oPa51SkoFCXL7HGugAL3Plk9JndVng==
X-Proofpoint-ORIG-GUID: rsoFAoyzObX4Mvvv2hxN5TznqEU6ygmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
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


On 8/20/2025 7:37 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
>> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
>> on QCS615 Platform. This PHY supports both USB3 and DP functionality
>> over USB-C, with PHY mode switching capability. It does not support
>> combo mode.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
>>  1 file changed, 108 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> @@ -0,0 +1,108 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
>> +
>> +maintainers:
>> +  - Vinod Koul <vkoul@kernel.org>
>> +
>> +description:
>> +  The QMP PHY controller supports physical layer functionality for both
>> +  USB3 and DisplayPort over USB-C. While it enables mode switching
>> +  between USB3 and DisplayPort, but does not support combo mode.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcs615-qmp-usb3-dp-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
> Missing GCC_USB2_SEC_PHY_AUX_CLK and GCC_USB2_SEC_PHY_PIPE_CLK


Ok, will fix in next patch.


>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg_ahb
>> +      - const: ref
>> +
>> +  resets:
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: phy_phy
>> +      - const: dp_phy
>> +
>> +  vdda-phy-supply: true
>> +
>> +  vdda-pll-supply: true
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +    description:
>> +      See include/dt-bindings/phy/phy-qcom-qmp.h
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      See include/dt-bindings/phy/phy-qcom-qmp.h
>> +
>> +  qcom,tcsr-reg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to TCSR hardware block
>> +          - description: offset of the VLS CLAMP register
>> +      - items:
>> +          - description: phandle to TCSR hardware block
>> +          - description: offset of the DP PHY mode register
>> +    description: Clamp and PHY mode register present in the TCSR
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +  - qcom,tcsr-reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +    phy@88e8000 {
>> +      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
>> +      reg = <0x88e8000 0x2000>;
>> +
>> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
>> +      clock-names = "cfg_ahb",
>> +                    "ref";
>> +
>> +      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
>> +               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +      reset-names = "phy_phy",
>> +                    "dp_phy";
>> +
>> +      vdda-phy-supply = <&vreg_l11a>;
>> +      vdda-pll-supply = <&vreg_l5a>;
>> +
>> +      #clock-cells = <1>;
>> +      #phy-cells = <1>;
>> +
>> +      qcom,tcsr-reg = <&tcsr 0xbff0>,
>> +                      <&tcsr 0xb24c>;
>> +    };
>>
>> -- 
>> 2.34.1
>>
