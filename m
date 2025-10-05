Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E83BBCCCD
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 00:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1E810E108;
	Sun,  5 Oct 2025 22:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF6Cdduc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1975210E108
 for <freedreno@lists.freedesktop.org>; Sun,  5 Oct 2025 22:02:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Ll4jr008187
 for <freedreno@lists.freedesktop.org>; Sun, 5 Oct 2025 22:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=N256hlAuYoC5VZZOOilDZ2b/
 UfNCJGDfOP6dgO8ecLc=; b=lF6CdducMpVUxg7v5KV2xvLDDr/WMRHAUalgLEZ7
 kLNEId6NLIuWAfWhK047h0e2/E0TQO5xAMTh8+awSmuUS37KuZSQ/MyJEKnp7PZn
 K0/MIrNdK0xbz9X4rt5bA2v1BQmG2hrxZKckDOiUEfCoZoGMKrjRdMJHdbrvcTiS
 wAW5ZGsnrRQAtQve6pOyQTX7Zqs1iGsyxYdFcP19g4LnNi110y3zaKvW91gQThcY
 rojAaBssKiLTLp3HImNDdKOoy5KuBIwQoooOcFqJ4vc5g/7l6+PDfUoo31QGmoAP
 QgsjbfQ68z1fZyNnSwpoTdPFjw5mGc877HnZN968KnS7jQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dtqm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 05 Oct 2025 22:02:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b55443b4114so2886864a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 05 Oct 2025 15:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759701732; x=1760306532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N256hlAuYoC5VZZOOilDZ2b/UfNCJGDfOP6dgO8ecLc=;
 b=aIj1l2rBR+v0mafqCRWYauiEuLoV5TIagJip2WXRhbkZJL64+rd69wegD/rpoD+mmF
 zIrx5gFp2KU5jhpNOqbK9OPclfcauVO6AJ/V6uaylkkoWb2AUjRR+SzJLXVoOHc7zm7i
 LklTzv3CICtgTM8d6beCPBDBksfvdkWwl64+9pnNMkqpMNJHdUHNWfx9uvzoV+o26YUq
 vzDg/q0jAts3dU2WzTKr/UXYvQFNjQyPuZd+En3E/iuiax+EImST9JRRUDnTOUbW0R8W
 KBIzwW5eOB19bNjcNGhfS5e60vlaoz48AUE5FhOSMBouZGbsMlfH9M5h2AZSoYD9pK+a
 ieAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdmq0Kv3sNe/9EtRcwHjl8RyJEQCPsBtRalSmFYwkcTVeKqlgoNnehwP7F1+tImy9hw1ZLNidz1MI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8vRyEuG2Qzd3ve3bnOrqf3EZ2DyQJj0gwxiNzpAMgBKX81BYv
 pj0opLc8N4DwDsw67PcDlRXpA4uKB4ozouM+whw6qF3m3OYrN9zEN+Tn762R9C49qybj0aDCKWy
 sQjdzrTw3EIn12yvzhnmH6LReU4T7wnZ9EjmzG14hEGJ2CCaaed4WJdGqgfJRZ8mginPrnKvCtQ
 pUB0CuvTH87+JhyWWNpCz0eDzxV6ZilzM5RC3UR/yw8/YuYg==
X-Gm-Gg: ASbGnct0G9P2Xo6S0oqLq1wYwBfTLc3E1FBlEmGcB0njcGPpUohWE/zMVrNZ7wTYaPm
 QZALt+hw2rLszd1iHfuXSE9VeJ8a8+nDwwXKZvTMaATLZtbHf+dk7teAskIAD1hPLkcAZO8iAb3
 VDIHAFMRNYjUp4KZHcuPC6tqn2Ew0si0ZBqv5Mp27wjYUvQGYsc8u8u4SaQQ==
X-Received: by 2002:a17:902:db0b:b0:269:b2a5:8827 with SMTP id
 d9443c01a7336-28e9a5441d2mr123489755ad.16.1759701731628; 
 Sun, 05 Oct 2025 15:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw5H3bnClwmyFijTzPlTIdJv/FoUFtpaPkBeTmanH+Kmn1x1n5CJdxzZudHkd+BA4S2ApQpqFUagP05oAcE14=
X-Received: by 2002:a17:902:db0b:b0:269:b2a5:8827 with SMTP id
 d9443c01a7336-28e9a5441d2mr123489405ad.16.1759701731098; Sun, 05 Oct 2025
 15:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
In-Reply-To: <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 01:01:59 +0300
X-Gm-Features: AS18NWCM1r74v1bXxfrsrgftusyMHXRCg5iM3xO5_k0pu2EPz6imHWWBkRHsRFA
Message-ID: <CAO9ioeWHJSj74VBR=2kHJDe_p1oG9Ngs6q9+s=CySGD3KY6sPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e2eae4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=0nM2LEvACttjMDtNBYMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EmhbFx2Xf1jjUFYCjOKhNAQjqpJjzACZ
X-Proofpoint-ORIG-GUID: EmhbFx2Xf1jjUFYCjOKhNAQjqpJjzACZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX1rVPGFR/g0Yn
 dyM+xlvyNefe5B/qUxjteW0dHgkmysOEG+kSYqozzDHxO8ahN+cwAowfG1kpubdwSBGrp2FekjH
 UkSO1FBRR52yP+2vn/hXkXp5Iffv+wffwa8QbZb+7EdOvBEvb94fFMnOM6GDCd46s6DDoGVTvPr
 GKqUqRwOkO7E+2Ofnz/mvmjXksHPcAOC/uJAbBOqDD3DxoSx48QFIBOtLozc0v0qv37feSnHGgn
 XkjzMo6YRgATXYi2G91eHTYsDLTMIFuMqwPL6VWbccb3shCgYAUYsS50AYsCuuatDHq1+iFWJTg
 zNo9DqthE9Uy5FlJmPqGZvwELBYI6/n7VX+aRvRDBGkDD1WVbVlyl0f7BUdRPb3Yk4IS3GYWNoA
 +HlDbWSwymxafK0lGCptYA8BbaqrIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

On Sun, 5 Oct 2025 at 19:49, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>
> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
> >> Add device tree nodes for the DSI0 controller with their corresponding
> >> PHY found on Qualcomm QCS8300 SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
> >>  1 file changed, 94 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> index e0e1f63fc45b..834ae0522f2f 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> @@ -3,6 +3,7 @@
> >>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>   */
> >>
> >> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
> >>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
> >>  #include <dt-bindings/clock/qcom,rpmh.h>
> >>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> >> @@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
> >>                                                      remote-endpoint = <&mdss_dp0_in>;
> >>                                              };
> >>                                      };
> >> +
> >> +                                    port@1 {
> >> +                                            reg = <1>;
> >> +                                            dpu_intf1_out: endpoint {
> >> +                                                    remote-endpoint = <&mdss_dsi0_in>;
> >> +                                            };
> >> +                                    };
> >>                              };
> >>
> >>                              mdp_opp_table: opp-table {
> >> @@ -4881,6 +4889,89 @@ opp-650000000 {
> >>                              };
> >>                      };
> >>
> >> +                    mdss_dsi0: dsi@ae94000 {
> >> +                            compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";
> >
> > qcom,qcs8300-dsi-ctrl. You might use three compatibles (qcs8300, sa8775p
> > and the generic one), but there should be qcs8300 one.
> >
>
> Hi Dmitry,
>
> If I am adding three compatible string for ctrl,
>
> compatible = "qcom,qcs8300-dsi-ctrl",
>              "qcom,sa8775p-dsi-ctrl",
>              "qcom,mdss-dsi-ctrl";
>
> while validating dt-binding and dtsi against dt-schema. I am getting below errors
>
>
> /local/mnt/workspace/amakhija/linux_next/linux/arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,qcs8300-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
>         'qcom,qcs8300-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
>         'qcom,mdss-dsi-ctrl' was expected
>         from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>
> According to the dsi-controller-main.yaml schema only two strings are allowed one is the SOC specific and other one is generic "qcom,mdss-dsi-ctrl".
>
> Shall I keep only two strings qcom,qcs8300-mdss.yaml and the generic one "qcom,mdss-dsi-ctrl" or if we want to support 3 strings in compatible sting we need to modify the dsi-controller-main.yaml ?

Of course.

> Similarly, I am getting error for dsi_phy compatible string only one SOC specific compatible string is allow.

So, what's the question? You are adding support for the platform. So
yes, you need to modify the schema.

-- 
With best wishes
Dmitry
