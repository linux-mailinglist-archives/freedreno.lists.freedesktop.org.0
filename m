Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42BA98CD8
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 16:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDC210E039;
	Wed, 23 Apr 2025 14:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kP9i0Uk/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E557910E039
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NArvkP022445
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HN13lzHJhjhAHQ7DzaU3+eE3
 OP7KRXOmcYjBHTkaM6o=; b=kP9i0Uk/AiiAAopNcloHUilfAZz8tMkN1knh3Y/Q
 fZ5/GBH+8ruzKSyCyB6L5XaIIzCd26zcL/Y43QrzcF5pUaR3wTuCVdwQEC5Vocfk
 BPV5l26tUD7xwuJuu8PeJ2YE2if6mIVUBzBpJw/S1SI7SrBMZPMs/rcv+OoNCWnQ
 KI2u50KE9E2FrjAhEBmQHfRAuq59U5aRTjO5C6IPfGNkNypecf5+SZCVl3zXQWP4
 wGYaMsLyMbhnTcOGnevgryvXO1zgJR47MOBRNZ3HRQBgrNgk3MUQY/GbRvrQBLIF
 c8tkqCHNUBmwJt3RdDTfBElz6VvXNy623auGQgEsX7fv0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2add9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c9255d5e8cso973907785a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 07:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745418216; x=1746023016;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HN13lzHJhjhAHQ7DzaU3+eE3OP7KRXOmcYjBHTkaM6o=;
 b=s04tyNZdPK0VvZAmeNEZ74lVQJrj8NFOUahzf5Q32/YWM7/rnLvc0Da/W/ZOyFIeeF
 Bvgfb40vJ92HqWc7H+OI98h4k0zeP2OltCTwb/1xKJI5QDhuH00SlxTAMsrqZYburLxO
 9bcjr/50Y/gz6Rm57+WtpLTEaFY72QQWDks81T7X9nbmvXV04IAUhccUt5NMquMQwmYr
 sLdfGGLgRjcbq60BcrwnuBhuHmzmTThPwq3DTp8+uHXVXgBirc6QcSP0syVmmXl/Y7Rr
 Hk2C+fsO41RzgDIzuLqS5iNOvQQqWzhBEcAoTEBbEq1/mk7NxUlx21FcEaZcQJzyEh+V
 rg7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTmfm+KDKSqQhHcHVvRC/J6m+oRaU2oTXtEvuJXTm7Rzmd/7v8J1HeMzpSajNZVsUB9cVBitRFts0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU8nKj8j/QHFiRA1r4gqUkZL+MH7S4yA7E0KXlgvxrNXMtSuJ6
 PsJW4i1IWZ1IvGmI3vEswn4Hs8lRfySCSaJrtXgyy6F3MiqK8hRs/B9plXXXJPf5cMm8ODbo/HI
 jM36r9TEtYaTM34OzJtwWhh+hI+LfIITZO/Xt9fyIELLb9Q9FJz+KDTNv+5DeAoL3xXQ=
X-Gm-Gg: ASbGncu4ftCXpdEflKsDCJ4RcQk5EP+/8ruhaSEH2tAhg2CJbfsqsgeOwYouzK868jG
 rfdjIwkujPFyXrHQz5OchUacrD5ekXLppvOPKpHyL79u443rQQrDOP3QAhVHYHOSxOo3uaM4k4F
 kpUS5sk9pDOSMx0aDlgMrFd2VFj3wI6rK6uFxjKK0LbE/J/Rm7haZLpZHvVzt91wAu77VSarnSw
 AccagKGIBYXVJ45uxWiNEvhYOHGdx4DbrjatqSx+nvAYxxhwBLRccn436fQYmKfvWufIWuFETWg
 skV0+G/5FOZvEBH4mFiTRfr4tKKJrhXVh83hqM8ecE9CynBFfJa20+beezWUPcODZGWRYi0vMFM
 =
X-Received: by 2002:a05:620a:3184:b0:7c5:65ab:5002 with SMTP id
 af79cd13be357-7c92805e97bmr3832036085a.49.1745418215622; 
 Wed, 23 Apr 2025 07:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYCQwVaTtgeAr0Y2QsW4Y61GBBb5WaCrUzzlKbngnnQyJ88rtPHEhSHsXxrd8l2Zzdb7e3JQ==
X-Received: by 2002:a05:620a:3184:b0:7c5:65ab:5002 with SMTP id
 af79cd13be357-7c92805e97bmr3832028585a.49.1745418214974; 
 Wed, 23 Apr 2025 07:23:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-310908639b5sm19424941fa.112.2025.04.23.07.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 07:23:34 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:23:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
Message-ID: <2m5fq7whbvaq4sbbxittxhbksw6erfotlwalrfevujq4mrt3kk@ctbgwinz2o72>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
 <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
 <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
X-Proofpoint-GUID: f3G9wspKnMpMfLkMSG91RBrs8P7ekADS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMSBTYWx0ZWRfX0B+/LFmeVg+i
 SFY5s8CmWDCgpT6/mU3dHEa1U3yzdZ9ksNwGLgiCnLT8R1bu29vFB8b/JiQiThvlFzClMI82Szx
 D7SChErZIoevDdzJo/WEKq4iSZl4HQkPl9elsn7mF4H8uOI4JccKYIi10C4wM8vkB4tFcfAX3f+
 wSCljolSrC+xCsPjoDF9Ng0ZjfWxh0qqgz51p+FnbMzNhdpFtL/BZpQUUxA5JnOSK/4FezZ3Xir
 KdaLNDD8D6jI5IaOcORtXFau6owIKmwvbsIBQtP8vwBgQLX2pCfBTdV3W23mQbeX+Wzn9VUTCKN
 q4K9AED2iEsLWHy7TK4kYk1bP6kqLLVWRxwYRNcM54BOj46Tcu5h9IkI5OkfI1pyMjje8YU7slS
 8RfNq1XA+uOkqonSR5kzYSdRxRzjoG/ZW+QceasPqMaPpLyde6DISjjqBKfy86emhzJKrScV
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808f7e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=yirWvuRTZ6qJcAQw2TYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: f3G9wspKnMpMfLkMSG91RBrs8P7ekADS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230101
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

On Tue, Apr 22, 2025 at 07:46:57PM -0700, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:43 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 07:31:41PM -0800, Abhinav Kumar wrote:
> > > On some chipsets the display port controller can support more
> > > than one pixel stream (multi-stream transport). To support MST
> > > on such chipsets, add the binding for stream 1 pixel clock for
> > > display port controller. Since this mode is not supported on all
> > > chipsets, add exception rules and min/max items to clearly mark
> > > which chipsets support only SST mode (single stream) and which ones
> > > support MST.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
> > >   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
> > >   2 files changed, 38 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 9fe2bf0484d8..650d19e58277 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -50,30 +50,38 @@ properties:
> > >       maxItems: 1
> > >     clocks:
> > > +    minItems: 5
> > >       items:
> > >         - description: AHB clock to enable register access
> > >         - description: Display Port AUX clock
> > >         - description: Display Port Link clock
> > >         - description: Link interface clock between DP and PHY
> > >         - description: Display Port stream 0 Pixel clock
> > > +      - description: Display Port stream 1 Pixel clock
> > >     clock-names:
> > > +    minItems: 5
> > >       items:
> > >         - const: core_iface
> > >         - const: core_aux
> > >         - const: ctrl_link
> > >         - const: ctrl_link_iface
> > >         - const: stream_pixel
> > > +      - const: stream_1_pixel
> > >     assigned-clocks:
> > > +    minItems: 2
> > >       items:
> > >         - description: link clock source
> > >         - description: stream 0 pixel clock source
> > > +      - description: stream 1 pixel clock source
> > >     assigned-clock-parents:
> > > +    minItems: 2
> > >       items:
> > >         - description: Link clock PLL output provided by PHY block
> > >         - description: Stream 0 pixel clock PLL output provided by PHY block
> > > +      - description: Stream 1 pixel clock PLL output provided by PHY block
> > >     phys:
> > >       maxItems: 1
> > > @@ -175,6 +183,30 @@ allOf:
> > >         required:
> > >           - "#sound-dai-cells"
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - qcom,sa8775p-dp
> > 
> > Why do you need an extra platform conditional?
> > 
> 
> I expect this list to grow and also there can be chipsets which support 4
> streams as well, so an extra platform conditional was needed.

Ack

> 
> > > +
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          maxItems: 6
> > > +        clock-names:
> > > +          items:
> > > +            - const: core_iface
> > > +            - const: core_aux
> > > +            - const: ctrl_link
> > > +            - const: ctrl_link_iface
> > > +            - const: stream_pixel
> > > +            - const: stream_1_pixel

You don't need to ducplicate the list. Just specify min/maxItems.

> > > +        assigned-clocks:
> > > +          maxItems: 3
> > > +        assigned-clock-parents:
> > > +          maxItems: 3
> > > +
> > >   additionalProperties: false
> > >   examples:
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > index 58f8a01f29c7..7f10e6ad8f63 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > @@ -177,16 +177,19 @@ examples:
> > >                        <&dispcc_dptx0_aux_clk>,
> > >                        <&dispcc_dptx0_link_clk>,
> > >                        <&dispcc_dptx0_link_intf_clk>,
> > > -                     <&dispcc_dptx0_pixel0_clk>;
> > > +                     <&dispcc_dptx0_pixel0_clk>,
> > > +                     <&dispcc_dptx0_pixel1_clk>;
> > >               clock-names = "core_iface",
> > >                             "core_aux",
> > >                             "ctrl_link",
> > >                             "ctrl_link_iface",
> > > -                          "stream_pixel";
> > > +                          "stream_pixel",
> > > +                          "stream_1_pixel";
> > >               assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> > > +                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
> > >                                 <&dispcc_mdss_dptx0_pixel0_clk_src>;
> > > -            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
> > > +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>, <&mdss0_edp_phy 1>;
> > >               phys = <&mdss0_edp_phy>;
> > >               phy-names = "dp";
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
