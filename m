Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B586B422B2
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 15:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BA510E89D;
	Wed,  3 Sep 2025 13:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiQUHPMI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADC210E89D
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 13:58:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEwK7000783
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 13:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MVkE7pic+AjgsrJue6GbGhHU
 Q9x1JH8BDEQU2GuSGtw=; b=JiQUHPMIZ1amb3LmdAGVRwan/onxU07FjGXjPdtW
 cNxHn+V3hA+FkdtJyEdKoHaK8NdL+727EcxpzkHqp+f8dUD9LvDNDwD2FWbMogVR
 LTN+lIQhVDYNKM+SbXQgb43Iu8PuIErNavhOMQVs45uRyxJszpZNS4sS/Z+OgzP0
 P3boBMO5sU0t5ZfyM4v8EdQZZw2nfw/+guwGFJkSCFiFrrRcO6B+u+ONgsZUd3Vz
 eIKYv4Nkty0xMA3gyISMno2+JEvimM/mdLFGYYOuwT/jq0SV4c0Mc5KmW52BPfuG
 MPWKou82NFEY4RYM+lIEccMp7FPHbWreVjzleEodtYPRsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush33skj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 13:58:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b49715fdfbso12766901cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 06:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756907914; x=1757512714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVkE7pic+AjgsrJue6GbGhHUQ9x1JH8BDEQU2GuSGtw=;
 b=g1ofKo5mvfN16LghFfzX5VzOV7dxJ7wlwCYY0ejeHm4iUGGi30mVJEa0prAnRX9F0r
 3AVogtoH9XRg5OwfpULbkZLcwnwfxsx9bRUIwB8v8ng+hs5iJPt8WcDFaAlxOi6sRSFh
 ZQGPucFjdIklbThe31Tz/zp2UVJv78vebG5buQVqHzswGnj0HUeaG6wGI+7aHUp4xCej
 VspcaoOceB3tqTd17+5SmFYYpf3L9IViAsAB9BT1uU2dgcvrE90XSnzU6L0P35t4Ll+9
 Jgg69I+HROeVZ4wmZcyNPmc8lGUwMxRsOorXSg9Ts8xwrRNLHIqBbmOWOpRUUkAmOy3V
 KHsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK6fRyQrWFQrTpQ0q8Y+MV7rxpa7r8hPqg3ZCS7x5PFPqhivgu9hQW+j8aBtzTcSLEzxzyVSQcbHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdfMFHoGKHjaUjVLs4c0mD5L9dVEhdYOMNqJQT7GLoWwnsXJ/C
 eFX1HQeTr9ZDBFvBe3IGmkqOEeQrYJpbjg8SYeJc7dz+frUKoQldnDFSIr+h/eXHtJKi23n8S4T
 x/9bs0GzoJt2CZ8Sb9wuUSu3X2dEfruM6MzTqn5TjpKBDni6CNZlcaR31RFxH+Fi9avA40LI=
X-Gm-Gg: ASbGncs0CbdKGA6zPqMvoo8PbfHNPhXbIsefiROgN08H6f5j6vthY+kLKLDPH3fypa9
 xo+Amd9fktLIfSgPW2wl0KnAhFbQpNGptKRjrV3W/qF97ANeRoxFitVecL+d1bR17acIigyUyMY
 1UDG/8cyOGLFcMsCQvTLg/NVoqgfW3cU8KGyy+XIfdItI8+sLxcbZ5weZjH3VLYNeqU4yIj2RoX
 16HPlL9UasO3Lluni37wieGCMso0ZztXqIzKUeDDQPHYU+YbNT8tRVTXGIgnUIKv6wNHp0j5+3i
 ZBXDo+38NQSutsudb8RnCBDF7W+M3Be9j2U1r+KrwCaWMvHWRfh8ZcSFY/Q+n2fD9VXjIdEHJSi
 Ep6p9DG+6gkYbe+CcWz4IMzUHV8oNh5IDG9jss3krDy4CfK9IFvqN
X-Received: by 2002:a05:622a:1306:b0:4b3:81b:c5b0 with SMTP id
 d75a77b69052e-4b31d547993mr175559001cf.0.1756907913686; 
 Wed, 03 Sep 2025 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhtC2LX93cq9JwucMfrRhPpM+u3XQlKXseCZc/zm0UTkPE9L8QBLFctB4NBw13tUK4hQVEEA==
X-Received: by 2002:a05:622a:1306:b0:4b3:81b:c5b0 with SMTP id
 d75a77b69052e-4b31d547993mr175558381cf.0.1756907913057; 
 Wed, 03 Sep 2025 06:58:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad4cd7bsm546787e87.144.2025.09.03.06.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 06:58:32 -0700 (PDT)
Date: Wed, 3 Sep 2025 16:58:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
Message-ID: <rfhqfbx4q3kl35ktzaexjjshzosv4a2tkjthtvo24aoisrdvj7@i63a55qx4mnn>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
 <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX/6iOwKH2bWd9
 Bgk5AA9Be29BcDFQoQxx5nBxw0jVj+In2IXdecS5Wym1FkHmzKQhLBEzmMVxU5WfL8cq7Clt2S+
 01AJnjuWicX0oohosaCbtsdKqEKF8KfvOK5xq9pWuimrEXyfmgLAQwrVmsYxQeoLKiTthSZYTk/
 NSyRM4mCP4eviNcHUCXHbSpl5YzumX5sWmY+rlCZ63uxPnKOmzOfIn5FUiFSEI3116R8nuP+osP
 nLRdwfKCqFNl1agn0SQrp81Qq0YFy+S1Nmeb9EEt9vhYXw1f+WmYUM3RFEQWDCANk2WBHJUzaLY
 8KkmGSljwIbd2AcQyanXWrhhMK0IUO6anQ3/ycVi3qZ2KWoE7g1e7ftMbNo4CsFot1i8xqDwV9N
 U6Tr6XX4
X-Proofpoint-ORIG-GUID: HHe6Zdn6eJ9OiaT4f1RXI0ziQ6U905Pu
X-Proofpoint-GUID: HHe6Zdn6eJ9OiaT4f1RXI0ziQ6U905Pu
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b8498b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3kmh57S2fnx10ZXIFTUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

On Wed, Sep 03, 2025 at 03:41:45PM +0200, Konrad Dybcio wrote:
> On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Update Qualcomm DT files in order to declare extra stream pixel clocks
> > and extra register resources used on these platforms to support
> > DisplayPort MST.
> > 
> > The driver will continue to work with the old DTS files as even after
> > adding MST support the driver will have to support old DTS files which
> > didn't have MST clocks.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> > index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> > @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
> >  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> > -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> >  				clock-names = "core_iface",
> >  					      "core_aux",
> >  					      "ctrl_link",
> >  					      "ctrl_link_iface",
> > -					      "stream_pixel";
> > +					      "stream_pixel",
> > +					      "stream_1_pixel";
> >  
> >  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> > -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> >  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
> >  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> >  
> >  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
> > @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
> >  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
> > -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> >  				clock-names = "core_iface",
> >  					      "core_aux",
> >  					      "ctrl_link",
> >  					      "ctrl_link_iface",
> > -					      "stream_pixel";
> > +					      "stream_pixel",
> > +					      "stream_1_pixel";
> >  
> >  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
> > -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> >  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
> >  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> 
> Something's not right here

No, it's correct as far as I understand. On this platform INTF3 / PIXEL1
is shared between INTF0 / PIXEL and INTF4 / PIXEL2. So it is
counterintuitive, but seems to be correct.

-- 
With best wishes
Dmitry
