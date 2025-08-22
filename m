Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6796B30F5C
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 08:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C49510EA65;
	Fri, 22 Aug 2025 06:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLdEcBZO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94BF10EA69
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:45:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M62ZIG007053
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 68E7HoEEPsN8r52rSpn4sYFWr4Hp7mhQ0BdhcIro7eo=; b=FLdEcBZOQdk8yONE
 lhrfBjCtxDx+GW6C1tCTAQNW+Mp9WqpydK3NSxxGxPtB3rS2yXEYyxv2dLeTcB0u
 KLdiEe910hb5Eqziw0aF6najaBt3fImRYWTSF0dqFfUG1tvp+lJGt6GX/Zvo2HVH
 91SZNxDNhzQ4bAYOSChzW9kxsp4D+Ug3WNijrXx3bSVMcSR0ayy61suRYge34UB3
 5mXxqCPxC5ELOzIT7eDUjOxN2D/CWzyGKk1HW3WeHjQIlNLDmtXBOtD64lhy0YDW
 pQNvw8JFJ78mtGDmdA3EQRZjTIPkl1b9Tyc6VLCXjsNMrlnEsRCBrITGt12eJa+T
 wR9K0Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529841x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 06:45:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244581cbf91so3499465ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 23:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755845102; x=1756449902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=68E7HoEEPsN8r52rSpn4sYFWr4Hp7mhQ0BdhcIro7eo=;
 b=J+EjCd+waLcSu2JvEjAdnQy76eZRp0YKdoM43jocsokZpgmc8hgYsFbBCYhlVFn+U1
 +7WbKKASYN8L1MefMFnkVrTef/lPNYFlexHljOhdsFOmyp71Xr6USltMBWZ8bsFZKFzt
 hdXSXonMfK+cQnEA+KxKAFOnWAA6AsXM5TQYFfOYDkS6NWOCoKWlzDI86uDO5BGZjyZa
 N7cNVChQvX11K8FEC94N0za+HnZmjE0CQefi3qdgK2BtYXazsxoXg8y5sGoDHjtEZXDu
 9T2ephgrc4yypkyqa4+5aFv2u3RW2WUHendaqt2dnkdRFo0GPr4NdcFlwDFAQQZlA6MH
 u+4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfHpmK27JxYh+MbSPh1Y0lrwLcRYToJp78LZ8E0fCmqyjH+VwZ5oBZnAtqSQhevdnr463nNGNKyPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkW3dtGuRwezMM6Drg/drq4dCSqKeBUoVJGrJLNSk2Eq5e/49z
 rdkBRXgFyCZ1Mk24qdpaoqfo8JGV6hBhj9Xqmtj+Lq4GkxUgcQ74Tv+F3Q/peLmrvQjcqjq8xwa
 6DYt0kX9DQ7MxtooOnVrgkRFTXPzUeUMZrMRr3LgKyzaSUgztzqLUnqBCIMC41Tr+vQq4zMM=
X-Gm-Gg: ASbGncu4WImLqj04ET5agQCpPCMREpKIhVYSu0lm0xUD0ctPVBWYlit8W3CJSNo1tU9
 zW6vip11qvV/vyie/rJ/0aObwSy9Y7O71VwkD1DhY8vr8DeJ5e/+AjZCU9Zj/EN22bPn1F0wwqV
 NLeMte5jcd/m1yRlHP9sC8n0zN5L+9Km0iOS/Nh+9jVelN8T+cYE+VVC+nvN9+uFJvioClucfrM
 ljCuKsvAV1lLWeAQCrE4KBsmukpbf3oxjrwFY3dyPYzA7pM8TLvqeV2Gykap2hqhkBMnKQqE7ov
 K3R8yiFbkZkf3xSUnP86I6SzwgVyTQIk6Zoc3dnmFvWFDeQSx6mZ5+EoiFBejlfREvNLndfwGB8
 NzLHAax87FMavIatTQMDKPIVjRL7kug==
X-Received: by 2002:a17:902:ecc6:b0:240:3e72:ef98 with SMTP id
 d9443c01a7336-24630149490mr14840215ad.10.1755845102231; 
 Thu, 21 Aug 2025 23:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTRC0qrO9ZsKmhumtwBi+xoakMJ8EF7G7365u0uhaKeGqNO2S7FCZeHLoYJ1Pg7dXN+9YNVw==
X-Received: by 2002:a17:902:ecc6:b0:240:3e72:ef98 with SMTP id
 d9443c01a7336-24630149490mr14839835ad.10.1755845101668; 
 Thu, 21 Aug 2025 23:45:01 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed50352esm73541165ad.128.2025.08.21.23.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:45:01 -0700 (PDT)
Message-ID: <1cb3803e-5617-41ff-bf3b-95b9f616fbca@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:44:51 +0800
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
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <3lodaz4t72vsxnstfe2msooo3dnwbqy6hxzdshcmyrgb3fbjnv@2afo5atezt24>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3lodaz4t72vsxnstfe2msooo3dnwbqy6hxzdshcmyrgb3fbjnv@2afo5atezt24>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H1OgSx9tkJ77Zbw7paTF03pEHXgMnaSH
X-Proofpoint-ORIG-GUID: H1OgSx9tkJ77Zbw7paTF03pEHXgMnaSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxa25tmS2dN3x
 jaxZ+EmYNrHyFWhDkhmg9wMGiWgdiPQg/6P3hF8Zn9TcFCdEr2VHT4dsoVqpb+3F8aGQkXB6gjZ
 61/ZXG4jHIdWhDdNxEzzPYMrmGOcHOZBa1hNRsCdzvIL/buXahTR1hwnkZNP3VR1S4DHgj3Lvhq
 WGLOvdf0Cvk6Mg+061kkWoLmQ6fc3AmJnX+RRmJ9nK6EaXBPOva5jyWMv1gBhq3GtCQBCiIakdH
 fg1pkF0Y6/gVM8qYyOHurqb814lSFoRa3h/hoQPjiZ2NCZyPvufEQn4CbLkYfqooeyK3pxbpzU7
 zJHkOr/KpvbbXO9KYLqWco4AAuD5wFAvpdLefNAmwp9KC3zIRH0iXqfsTkp9Hg9YZUcTqGju26h
 KUksYO+qAv4UxxQjGjsQVEH8pnvrmQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a811ef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=H_21wVPlT9rzXepSeDcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
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


On 8/20/2025 6:09 PM, Dmitry Baryshkov wrote:
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
> Why do we need two phandles?

 Thanks for pointing that out. Will update to use a single phandle with multiple register offsets in the next patch.


>
>> +          - description: offset of the DP PHY mode register
> s/DP PHY/PHY/


Ok. Will update in the next version.


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
