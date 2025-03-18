Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C746A673E1
	for <lists+freedreno@lfdr.de>; Tue, 18 Mar 2025 13:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F111E10E47A;
	Tue, 18 Mar 2025 12:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeypgvoU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9BD10E47A
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:27:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9DRCS026060
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KQvm5ggtbOCQSK3nymPppIX8
 0f9DFkotxhkHRb0WarA=; b=SeypgvoU+gdG6Ukfr5ZLaqvd25tu9MhRZNXFTSl4
 seQBRzEzA46hOlTpxNKZQxvO6mO2aXUQP1ahTXVzSee1Gz+hx/j7tYaClPsI6ZVi
 +UGaIDLoa8NpPDojLo5HxurMTRHe8elKNUv05mlGGJ2GKjYZZwnxcmy6r6tUqNpP
 HuQ3y5gllvp5OOSdEI6wUdYOdLBOY2Oy5PPyEyzgkrEu4/sH7NBQZBkfYm2RYPc8
 YeMFxZlEkGj7288wLpTyKCU6rkCR7xBDFcYjTt6MtNuCUd2tETe9/fGvnkelBagI
 TL+M4GdLDN43HyM6GEGCvCCvP19k5VBpV89aXEXRTq+9zg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy04e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:27:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8caff3bacso53317456d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 05:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300846; x=1742905646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQvm5ggtbOCQSK3nymPppIX80f9DFkotxhkHRb0WarA=;
 b=Ir9vAwBEE52AASBYJSpozXbTxnlS4wpsT1iaf2UWKQXodeLM8xl2k23YHTI0uBSHQT
 pUnmcTwsRr8F5puclBZGR2dAroMTd3gsUN3cfouUHtSgOU5NAd2bPKHbspd/ODCAZJmg
 78Q2ULOngzcSo8gI4+SMM/rIBDR54h/1rScbDQMey5id6HHtzHnZGnBImd7ES2embBZ9
 u0VXyw+IY70elcYozrkUv8zNyXyu+TAWpQEqnZBY6FaOKspPHzcu6xCpKgk7jgPnJFq/
 ZXtnpC1+l9DQeT0kold9Xn6HmW9EcVKyE53afmdEjn59POWpPp1HrGPBcgb00FJQXtbT
 lRgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbD9jiEgi6+V6d55EcPNR8DEZjgsuVTr7lQlSM0C6VGMzQ8XuyHU5+ghv00tjOOCVyw+yPEEi2Sko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIx2IHI4dLV+4kGhJ0i5ZZ103+825Am/qPH0xR5NO8AmpzUkaF
 H9+hFNaJkbUE+whOqICfX+yYrqO5JTiJ5fwMefL2EHnchC3Ntz54Hdu8wOswZIRG1bzWVQQAVlU
 HDuumUVX1kv1FJM7u5LqOv55GxqTcX/HzFeO00ImIXhZMBYH4lhfPD55eyPtXYgJZsh8=
X-Gm-Gg: ASbGncutMAWquP58NPWSVzEBMHnAWmYLhXm+4PiW2QaFn9hcJyanyOdIdXu8ymztOp4
 4xs+TPXiTXEfUbhTzG+8fefRydaugPGm52YtWvNdZdzWTke5Q8rfRai6uJTD/7WpOtQ/6qyyuRu
 Le062O43ZkR8aQLdkE/t7ph0W8NDZfQRdShwG/XCROr6gaoQmtDHEiP6tlnh5eTnH/Q0v+4uFYf
 yfCnph+DjF240sM0MmR0ExOm84Pja+hFFSx1E9hr5TsEDRQkAhdju2BsJpz856o+/zkp64AlC5P
 T9YTx3cB9NKZPVB3hAds/5lLmux5vdZdibxy0OUHD69T3wYKhccfGoPVgjw+RnXzteoolF6uKXt
 d/+Y=
X-Received: by 2002:a05:6214:202e:b0:6e6:6c7f:111a with SMTP id
 6a1803df08f44-6eaeaaecabamr227559556d6.40.1742300846240; 
 Tue, 18 Mar 2025 05:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwR7+iJ5oOeO+aBGprQHwdADJEmV6itZoPrskcrm0NWrJsFokzpnQutdgU3GCkevB+AxS3LQ==
X-Received: by 2002:a05:6214:202e:b0:6e6:6c7f:111a with SMTP id
 6a1803df08f44-6eaeaaecabamr227559086d6.40.1742300845903; 
 Tue, 18 Mar 2025 05:27:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba88332dsm1627986e87.181.2025.03.18.05.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:27:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:27:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] ARM: dts: qcom: apq8064: move replicator out of soc
 node
Message-ID: <nr5xdpt5sm6xwghcjwmwv4higr2saddewaifwdi7ysztyvh56i@26omyq26f4cy>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
 <d0c03e76-8b61-4cc6-8839-448fbb64d4e9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0c03e76-8b61-4cc6-8839-448fbb64d4e9@oss.qualcomm.com>
X-Proofpoint-GUID: g5hq2FIj67AIrMzCAqsBvRPMw3jko2JK
X-Proofpoint-ORIG-GUID: g5hq2FIj67AIrMzCAqsBvRPMw3jko2JK
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d966bc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=zvJQgSryfyOLS6Et4DYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=914 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092
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

On Tue, Mar 18, 2025 at 01:15:16PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > The CoreSight replicator device isn't a part of the system MMIO bus, as
> 
> the static kind, anyway - the dynamic ones are
> 
> > such it should not be a part of the soc node. Follow the example of
> > other platforms and move it out of the soc bus to the top-level.
> > 
> > Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 66 ++++++++++++++++----------------
> >  1 file changed, 33 insertions(+), 33 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index a106f9f984fcb51dea1fff1515e6f290b36ccf99..acd94f3ba0350c5dcdd8f80885ee643d8cbddac7 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -278,6 +278,39 @@ scm {
> >  		};
> >  	};
> >  
> > +	replicator {
> > +		compatible = "arm,coresight-static-replicator";
> > +
> > +		clocks = <&rpmcc RPM_QDSS_CLK>;
> > +		clock-names = "apb_pclk";
> > +
> > +		out-ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				replicator_out0: endpoint {
> 
> Please take the artistic liberty to add a newline before subnodes and re-sort
> the in/out-ports to make them alphabetical

Ack

-- 
With best wishes
Dmitry
