Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6725B3E353
	for <lists+freedreno@lfdr.de>; Mon,  1 Sep 2025 14:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D31910E44A;
	Mon,  1 Sep 2025 12:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkV3fYSI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FB310E44B
 for <freedreno@lists.freedesktop.org>; Mon,  1 Sep 2025 12:39:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B43hn013456
 for <freedreno@lists.freedesktop.org>; Mon, 1 Sep 2025 12:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ag+uc2sfSISlJdM0Nw82xpwB7MNtUR0GdzbeqIRcIGA=; b=WkV3fYSIlVrcFM2Q
 IZe+oZy7wvsT7uLcQpkSKNJpdIfj5VXYmI5Bf4jwrwSjZHOZLvxx283DBy8YoJ5Z
 o5N0LHt97jEiriRn8qt/G/apE6Bxg5XEHB2DXDp83U/EM6jhzeDSDyB+9+AIww6X
 Db0gDmfkYh7DR1QWBFvD3iOrTmLTzBbYWHKBB9eDNFilJcur074t5jsncIa4Pf8g
 17uq7FUtQ4KvRqMv/9TJUvWwW6DlcVAmFcQl1zWcoCpCVRvlQrzmapq2D7zhD4j+
 e1S5WXiIubJsugnSCXjw7PiipAnBrcEIzuFIW3gTi1+x7NrByEIeRTscDdb5JcPq
 SqPptQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ms96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 12:39:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2490359a4a7so4690095ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 05:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756730345; x=1757335145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ag+uc2sfSISlJdM0Nw82xpwB7MNtUR0GdzbeqIRcIGA=;
 b=etu3JYJwQ/TIb45iQu3POkISPQfNuhDSaqU4sC8P7epEZuDfZ5/4MPJ0XpZD+tHvNV
 +fODLbhm3amKlhnwLfB3UYUVzB9DRf7b8YMCoeh8hLrnraE7e9j+PyyCqbn87k05gZdC
 vWum2XFUh5qebqUU02VeVyaWH/G3DVghUY7S7j5uN4NoM6zVPUmjOZrZMbsKL02XQiJj
 T/sLrzsMVXj7j4eeSa4Q5zZjMiUqKxz+MCRcSw24OqHpEFUyrB9k5nUvNpAWKhzotNau
 Zd6DGUdRtXr/jm6nv6t45z2wQiOOrwo9/H99/VeEwBtRsL9CLC/n8kHRlwBptkFZdVyz
 Ohgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBnEEaLOj+UZRUWKra/YaZcEXef0qc21F2TlRc7A/Y+wyQ2Qc0i+MfYb3gXPsnaTOzWyuBTuOx3zM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeVOJF7M6Le/bqI2B5oAIGAp6yRROda4yMvId1LOmMR4m6Jzu/
 ibV1+84CDguzH/BPNCqE/7DrBug+gpHZ896h/SNcinYpSLDFRiQFSQjrDQJ7Hq8TnBaKZlhH7ed
 317rHE/o5LKlR7bdEfzUR6iD9dsLfqGXbzMyicG6pYs6azbTSqI89VG3ZbKXaQP2sy4D/gVw=
X-Gm-Gg: ASbGncvXIeKWDggXgDJNDfL//wU7Ar+mN/vjH+rSKpEM+Ve6P8CjF3PKXHKaauGoc+a
 YvBl331ROhiQl4b3MoS55+d+PGErAdQAdOD7p5YhyMKzKMqmUyAzVUcSjeoC1/nWWA5Km7wKNhw
 bVWCMH559w7MRw/yFgVPzWSI999BkWyAU7ttrBi3Kcvm5g+nHgOX7UxEbqGfuDcIkHiq4wM9WFr
 gA9RxZ0UZ1AUyqWivH2JLuvkUwwcCxPDCTMJrl0h0iB/b8iHbRBdUbnU9aq710Q91AM4oszbpbD
 1Mw/QTTIocB3kJ9qgQW28b1UOGa0JfDRyEo9443FXZ1BK8sJW0U/STt2NoVvCA/yOQG0Ih34odH
 RWPTREnRwnTx84JHAYmHr654RFOLCYA==
X-Received: by 2002:a17:902:d488:b0:248:ff48:8779 with SMTP id
 d9443c01a7336-2491e1ed5d2mr67831105ad.2.1756730345025; 
 Mon, 01 Sep 2025 05:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGenErKxO5/yYfNFbGUt4G6q+mh/TfyItFjo8JNUx5mpoIN5ZQtB3b2C6jXNrrW8UUGRc9ZyA==
X-Received: by 2002:a17:902:d488:b0:248:ff48:8779 with SMTP id
 d9443c01a7336-2491e1ed5d2mr67830675ad.2.1756730344486; 
 Mon, 01 Sep 2025 05:39:04 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm101472765ad.112.2025.09.01.05.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:39:04 -0700 (PDT)
Message-ID: <04549ce5-fa14-440d-b5b9-f8ff059f632a@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 20:38:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <20250822142230.GA3591699-robh@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20250822142230.GA3591699-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dxEeD7YecTUzcsvuuAHBwhBi31qLb3KP
X-Proofpoint-GUID: dxEeD7YecTUzcsvuuAHBwhBi31qLb3KP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX3gJIA2/XPU7O
 TVltX0zf/OB38BqEhZo2CrTMNcSdEMgP7MLTmAO68+d8GX3CPtPH/tvYmwXtZy9YyRa7evFr+Z/
 NgwCU6xbFoMlbzXgYkR966A0G4WQkazY9PRUgN62LHUWAi+yRwuGB4Zu0rgAYyKEJZl22vJUgRj
 TM1IzXBUB/ozrlC5x3raEnfPbeqIVHKJGXs1NKg4zlR2s7PIrLS0kSvGLVEtNuJjmxjqapBqKcK
 QcJXXNU5tIHabCuQHWQHuDcruGhuL5YD/f2VOxAO1dC+P3PfdOJD453inG1gByVliRNcAGNt2nn
 5TG6Cv1/9Nm3i8hsEHnIoV1ctY6z5qrLVNpVExmjTNFtfbDiEXbbjjT8odeCpuc2J6lRe0HTapw
 6wfzpeTN
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b593ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=mavVfetI76m9BAqSKQsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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


On 8/22/2025 10:22 PM, Rob Herring wrote:
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
> No, this should be someone who has the h/w.


I have discussed with Bjorn offline. In the next version, I’ll update myself as
the maintainer for this dt-binding.


>> +
>> +description:
>> +  The QMP PHY controller supports physical layer functionality for both
>> +  USB3 and DisplayPort over USB-C. While it enables mode switching
>> +  between USB3 and DisplayPort, but does not support combo mode.
> Wrap at 80 chars.


Ok, will update next patch.


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
> phy_phy?
>
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
