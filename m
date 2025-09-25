Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6443BA1B6A
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 23:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBE210E9BE;
	Thu, 25 Sep 2025 21:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmXVCM11";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D1610E9BB
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:59:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQGpC025832
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BR5HUPeCfft1NCbbIet3qxND
 5IfQR5IsgBoObFi2Je0=; b=dmXVCM11cDQ/e7iP/aeOEcPaRINrPzjAhfS2OeIL
 Zv8rCZjqsL/dC2KHqPEY4C/OREtV7GtdvP5RKd3Wy3qDPVVf1Wl8+XxJlbvl0o0b
 cd4e4PA1y05OrXAk6+NWW0R44IiPaluKPmNUuxNIXWNHxEwZR/XDNabMBsFhZNLO
 ZDHDaDCkUmjjQDFz+7W1hlk4ahxeoVaW8KVGE27VbvKox82+mY9I1TZGPD3iP9Ij
 6cJxPGdzy8FzkREB2oGpXimWlXwdQzdCk5A2lUQTPea38qi5wTpfFn6SchdLWE9f
 iQWRal0RDRoP4msoWLPjpWeQA/f4KIBUK2D97k6EteWklg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u0h56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:59:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4cce66e91e3so48200901cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 14:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837588; x=1759442388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BR5HUPeCfft1NCbbIet3qxND5IfQR5IsgBoObFi2Je0=;
 b=cJ18yhdZF0KWVCt8nh7ojCFoLUQ1VdQgoW8ruiuBN3suK4DGdfVdhFWZ9uEpOOCOSU
 vddFw5Z5hRVHO75Ib5bno5GPoaCCJSs4OLQe697wT78B3s52PZWPuAVUMyJOIV8iySe/
 S3NZApZWZHtHLoTJcmihz6sQwAzwjCEhzVKbl+KvcAweyGIAbm7jGaqSDeGT4InrdGTM
 nSw6xTEWnmgCwo11JB4Jb2pHTsxGllycTaF0MGjDDF/avKyy0IFIovpnq37vscGi3Jat
 qqgKOqrKx0kkzzQkLkjLaYTjdZu7m5erEQ8E1SVU1/ZzvNataZNe1PXQQSMKy07CBSsg
 xqEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0EjCkb/O7G9so8cYU1c48G7TFvE9jQakxAFfOh3ZHGIVjhKKLhKeDHPlqH8Y4D8A1KxoGe937m2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwvOGz/e+BVWI8jDopcapkkbBJdOtKzJZkEQ8nuiOBvmcmPdc8
 S5ZYw9EUUsbudpLqPdIxhe9uv6pEMbGQTVzct7CeEGG3+7SIK4N1YRSSuj1Qd8IFq6km9O7lunM
 eZd0N+Xpo8gid0j5X5EkrOjaHGdxq1ppTl/moWOIrISYBhqBt98/nm67QsE62MNWmlbdVZaY=
X-Gm-Gg: ASbGncsncGBkJkrWDRAaxoPJVxS1CNaK/wAPI5LCLENQ/zrVysgxgk2Nsrn6217upnD
 hLDFNqaU4TI8jjPfAikPHEHTd72fZnexfZXC6vP30q8tGHkI96RWizm70yqxgCQuqQpBz47nJpn
 GHnb+0yPy9BOIo1YwRNGfQDQ6jJy/+tBf93GirUpUpMmNQevNCTB4FxFkefy7DhRfnGL55MhnEv
 Wgi50uMLsV5IWjEDF9KTPJv5PAMZ6KUxvp88XwK6ueQdWxcwvKQEIhq+/uOcH/kA+2gRgshpGGa
 hk7T3Ez+J44mUUm4w8HUzkriBX2CG3hPSfqa+2Eo/DL9oeDUEkRlQBFlAJlgct1iBemC06P91yd
 LtUilmB2QJhiFmVzmEnUdu57VIIhKG9VeB6IwwAN0X/OlUlh5nTKd
X-Received: by 2002:a05:622a:1cc9:b0:4b6:3451:a159 with SMTP id
 d75a77b69052e-4da4b80882cmr93562261cf.49.1758837587716; 
 Thu, 25 Sep 2025 14:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPiYBr7KbUyHOeG6VWHRGxMxNAqbYyBxg/ol3QRzwFxfVNAh47tngb7nHx6SI96PgsExBvVg==
X-Received: by 2002:a05:622a:1cc9:b0:4b6:3451:a159 with SMTP id
 d75a77b69052e-4da4b80882cmr93561991cf.49.1758837587291; 
 Thu, 25 Sep 2025 14:59:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313431070sm1170275e87.12.2025.09.25.14.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:59:46 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:59:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: document DSI controller
 and phy on QCS8300
Message-ID: <zjjnizyz4gj5z242dhgwgvxk2pkxoyhchcicwbbzod2m6z6mx6@xjapoj6goo47>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-2-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925053602.4105329-2-quic_amakhija@quicinc.com>
X-Proofpoint-ORIG-GUID: yylgG0N5HehAVclKjiZDbwRc4PzJTdcJ
X-Proofpoint-GUID: yylgG0N5HehAVclKjiZDbwRc4PzJTdcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzEtc5Aq8PJkQ
 Ebs4BJtib7zTcZUwg+P3X2GRo7z3J4fpareBIM/Kc5vlCTu7uMcXdzuDAm98+hOgPvWtKApDMwg
 lrqh0QvJuqut6PtRXb5fEZxt1HCO/v6twnVL156+Md0lZCCim0nLgeRtwpg3twStAZbwGEeJAd1
 3rNhtIqfSGCPq6/vSK5B2Z5tzwXqwC2/EgRiux1dlxt7N4iwR5BvyfWabu03xMB3qouiCwC+eml
 JEUyVNuD9qlD6CSMkIhs0NvC0iA2axI7m2gp98U+mtNNRzdHMMvS3L/+Xfs7bPLbyS93L8AL5HR
 aUxIXeXk9Ys5Cn+uvhnuXZ2sM95ek5E1Lk5h/WsjzQQWpQvSX+5T7misL9qTFh8nFgEVSbAcDbi
 gZOzvBjEaguGRwg/ze+W03unF4FH+Q==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d5bb54 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=9Lg_u9sHXrgwa_hBAsgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 11:06:00AM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on QCS8300 platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        | 100 +++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> index e96baaae9ba9..f34823ed4433 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> @@ -53,13 +53,23 @@ patternProperties:
>          contains:
>            const: qcom,qcs8300-dp
>  
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        contains:
> +          const: qcom,sa8775p-dsi-ctrl

Why? It should be qcs8300-dsi-ctrl

> +
>    "^phy@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
>      properties:
>        compatible:
>          contains:
> -          const: qcom,qcs8300-edp-phy
> +          enum:
> +            - qcom,qcs8300-edp-phy
> +            - qcom,sa8775p-dsi-phy-5nm
>  
>  required:
>    - compatible
> @@ -71,6 +81,7 @@ examples:
>      #include <dt-bindings/interconnect/qcom,icc.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
>      #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>      #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
>      #include <dt-bindings/power/qcom,rpmhpd.h>
> @@ -142,6 +153,14 @@ examples:
>                           remote-endpoint = <&mdss_dp0_in>;
>                      };
>                  };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&mdss_dsi0_in>;
> +                    };
> +                };
> +

Drop extra empty line

>              };
>  
>              mdp_opp_table: opp-table {
> @@ -169,6 +188,85 @@ examples:
>              };
>          };
>  
> +        dsi@ae94000 {
> +            compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae94000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <4>;
> +
> +            clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +            assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +                              <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> +            phys = <&mdss_dsi0_phy>;
> +
> +            operating-points-v2 = <&dsi0_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            vdda-supply = <&vreg_l5a>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss0_dsi0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf1_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mdss0_dsi0_out: endpoint { };
> +                };
> +            };
> +
> +            dsi0_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-358000000 {
> +                    opp-hz = /bits/ 64 <358000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +            };
> +        };
> +
> +        mdss_dsi0_phy: phy@ae94400 {
> +            compatible = "qcom,sa8775p-dsi-phy-5nm";
> +            reg = <0x0ae94400 0x200>,
> +                  <0x0ae94600 0x280>,
> +                  <0x0ae94900 0x27c>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&rpmhcc RPMH_CXO_CLK>;
> +            clock-names = "iface", "ref";
> +
> +            vdds-supply = <&vreg_l4a>;
> +          };

Wrong indentation

> +
>          mdss_dp0_phy: phy@aec2a00 {
>              compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
