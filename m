Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114CAB09ED7
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 11:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23DC10E12D;
	Fri, 18 Jul 2025 09:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhLM6j0v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC26210E12D
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:14:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6xiMO030411
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BfoCIwxi0joR0bjBqMAXz1jJ
 wD9YiSTEZ3Usavq7MyQ=; b=OhLM6j0vd4LIIfOucB7WsJtO1v2pS7O/26isGjGN
 mxxOau+u8FgH8gq8f1S43MaOJZu/RHFCI+L+OZqYLfz0go1GD3wIAjwli9BB9yT8
 1V7IsWquneI/hKPIGywR1IQ2+qQ0xvx90uvn0WB6koX/gJTSwYECV1w2MoPzx69+
 Q8Lqj9VcbQb+1dLDJa8SqiHDyIfgpb7m9RBsFsUf228q55hhBw2Zgxvz9EpW6dL2
 9r9QVO5Sdm7TUodjY9nCv0/CKXCpLuBKrSexwxPk2TWlKQg4Rzx7R7531C53vXso
 g+ruwBfmlXsbfuODjW/w69CEAAIqy6OuiUGV/O8QpvJaIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7qqu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:14:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e095227f5dso293788385a.1
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 02:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830096; x=1753434896;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfoCIwxi0joR0bjBqMAXz1jJwD9YiSTEZ3Usavq7MyQ=;
 b=id8qntQeC2WBQoASt3HFcOAMReLD0AFLj/SjWbXCKN6opqQCNoInMMq/L3/HGNi+Sy
 LTRbzRdKi79xAXmDvyZ9lNDqp+snv3ZV9IgV9sw7iMq/Wz4YZzVYvPGxQHeNSMza+dcu
 o9gI+VgmIhE37EsDHp0kf5rWQpl3l8qbpIqTrakWjF9RM5M0dlED9j5FMqW4ufUxs0bH
 zWtIRwugZq0In1TLeRoLCaxYjc+/zu/OiRwE7QNX8G1EmXhGruXNTzRUpPEmkGkW/Vtc
 jinV3iB75Vo998egGuYAHmwSN10rSlpT97Gczyxq3syDzWddy6+D5h6qtz/Wnb0FNUi0
 mOHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5k2YyT5P+ZaBY8mf9ss2Uw0P2Q36g2pbyRyPwtwrDWTbbOl5KMH25i9aRNBRa1lyZs+JDR/4HQcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykuq5wcBAjGCsgyQ8Zl4w5WvmvKWMOMVhVmo+zGXeZz6usNfO0
 /K9qOf0aDQs3o7dVNi9Cf5B/li7biiDfe+pl/EfORynNnM4z0PZm2PoKIZgoy9OEC2FHW6dKg5c
 BJrKzq9Mdwqj3/KZBdObrtfWRDkCGh8q8ODMR0AqLjB5zEsU+xjSSsHDqGPcGCk9yZo8swkU=
X-Gm-Gg: ASbGncu0TXEkLxU9qHbmCa4v5gg3eaN91afwzegKHDSV2onHYorZVfMeVZIskpTwl24
 V4FW1lnl7cnOABe3kGpsofzxO5RbP9sz8yTjcEZXEtR7Tq0zsdN/s5Js79QMhiX2CByoztCHRBR
 Hcq04kWPAvmdrjLB7M0GoiiR9i9Xp576GrP4iTmEIPsNfAZpWOeUMsobrkCrujXAmxaDiNf1qfH
 ObhcmPUKkovzLQIkuqeWNBg15CBsBm3RoD3+YImFo126sNgGs7TXQXm8Qsi9KuUG10IL2k6D5cQ
 pbLYBiNF/LeTUh1uy5plthyGVmPlGO8mTXQrTmsxMWubsXSaMm0k1wo3/40dCrWBLbSMCVSYMyl
 CFI96qQJsAK6QZRcqXwYfbCKg26Cvp5NRaY0YC31f3S3BkPXkJUsm
X-Received: by 2002:a05:620a:4505:b0:7d4:653a:e9a8 with SMTP id
 af79cd13be357-7e342b72cb3mr1422085485a.48.1752830096289; 
 Fri, 18 Jul 2025 02:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHekjEeOU1Lcp1E8DvurFzQuWe4WR22an0r1uchoUx++aHCtsJv4VB/D7whiQmgv+B7WWZ5/g==
X-Received: by 2002:a05:620a:4505:b0:7d4:653a:e9a8 with SMTP id
 af79cd13be357-7e342b72cb3mr1422080985a.48.1752830095640; 
 Fri, 18 Jul 2025 02:14:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c569sm181412e87.103.2025.07.18.02.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:14:54 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:14:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <dkgt4t3ooivdp4d73aj4sbtheypcioqmvrtzxuw2uck33sose6@orwlg4m47tew>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX7eVqVulwmqRD
 u5Q9rmOcDqQlTIq3vEmV71aNUtQC9Wa+YUjOOiOHvzFFRNhIR9GHyk7hWbVbZfctxgO1FOaHrCo
 LyIp3RYb5m7APbgcFtl1Xtfu4mBC7Hg2nI0ipmJ0Z+5xTpluLDRihmXeLZn+/rPPLUQgBmZy88y
 rBzLdPYCjOK+3l98bYLtTwKd4SFe8pZ3YLbGpVGBhzse//9aH2Qe+6eadQkNpGtSAYb/9dGWKsQ
 nqZoRbMyZ1Q4WfNKFDhAkqI8zx6lgrIuhcZHgaI338I9vHD1mNxzI0Bys0LFqq2qFq3RLvWQxqo
 St2UUc1SV6OHljd83oTGonJsKGWUY8+3woxrGDyc91YpdZuGOjhA9P/oRqbHi/QPSW1vNtKQznt
 WtreuanVgBbACCKk0RegSf75cXeqZSJ3VxJYm+4xBxq0UmQ+E6xMI8UghmqSvOfc7gK94E5O
X-Proofpoint-GUID: EN2szJmsn5PqcwHPfWVThwg4UkNF33BK
X-Proofpoint-ORIG-GUID: EN2szJmsn5PqcwHPfWVThwg4UkNF33BK
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a1091 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=s_08DJon4HIwgivb4r0A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072
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

On Thu, Jul 17, 2025 at 04:28:46PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> These chipsets can support up to 4 stream pixel clocks for display port
> controller. To support MST on these platforms, add the appropriate
> stream pixel clock bindings
> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> In addition, many chipsets depend on the "sm8350-dp" compatibility
> string but not all (ex. SM6350) support MST. Because of these reasons,
> the min/maxItem for MST-supported platforms is a range of 5-8.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  6 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index d8d94f62c102..2893f097df82 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -58,20 +58,28 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
> +      - description: Display Port stream 2 Pixel clock
> +      - description: Display Port stream 3 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
> +      - const: stream_2_pixel
> +      - const: stream_3_pixel
>  
>    phys:
>      maxItems: 1
> @@ -173,6 +181,32 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-dp
> +              - qcom,sc7280-dp
> +              - qcom,sc8180x-dp
> +              - qcom,sc8280xp-dp
> +              - qcom,sc8280xp-edp
> +              - qcom,sm8150-dp
> +              - qcom,sm8350-dp
> +              - qcom,sm8650-dp
> +              - qcom,x1e80100-dp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 8

The hardware can't have variable list of clocks. Please describe the
hardware here, specifying exact number of clocks to be used.

> +
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
>  additionalProperties: false
>  
>  examples:

-- 
With best wishes
Dmitry
