Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNfEN4DrpmnjZgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 15:09:04 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C651F1148
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 15:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0A910E823;
	Tue,  3 Mar 2026 14:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="odY8+8Q7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3aEEuf7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F65410E820
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 14:09:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nIWi323850
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 14:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vA9LhWu4c+RxWCGc7dLNVetf
 L2EcqY9KkAYh6iDyUdc=; b=odY8+8Q7h6mFBSbGzMyefsQSplK4vPQHDTdhEeZu
 hNC+DfHogEfH8Kmi3tphAeAOvbwvzNJh5AbBoMdzLIUJCBSefcy4vR/LYu/dwdZQ
 Ud2Ks3G0Dn9yGzWghEUUPDAkd4gZO5Jg2ZnCu6PpEhWDhbDznco0Pqu8rJ9yHxSZ
 wfA7Ewkp9KuOr+U94Zpz1e0qO8oXCRcrE5oVEogCUI46pNammtq6BmPM3i1Lao5y
 Ew+vW7tY807G7K8Ale978o57ZT7zZyXEI07Y2sOLqd4ShWr59eDyK59R+dtIUjn9
 8EAjLDmcmTZCqMmQ3VVMt4VgOlqJIXF6Tc1qn7fCfWmdEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfvb25-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 14:09:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb0595def4so4809300585a.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772546939; x=1773151739;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vA9LhWu4c+RxWCGc7dLNVetfL2EcqY9KkAYh6iDyUdc=;
 b=N3aEEuf7iH7UzCvL+PjJUYjQHHvE1n503zY1ICH9GIoFklLXmfWXZRwQ4SVBQCUalM
 T19SIDbVsSmmx77b+jc1MWrFb/24rbKkQG+vasuiWs5aIfZUAYEi0D9Pr2IVbUENssYm
 NtIyb2PB9cc0baF+qkkGMumuZtJim/wATOTX25Hw8lc/MesrfkGNq2nB9jateeODZku/
 hh9nfU5CAfx8g1sggjfzDxmEbgmQS+N7J3MLSf4vFVU68HnsfshXcZb/YjxLFxXT1fGg
 KXrLSZPbBvzCcGrb6lvU4eWKxhqO3lhx1dmeTNfC1jXUbv4bZADI94OF98rPVclIdYZT
 Ga7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772546939; x=1773151739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vA9LhWu4c+RxWCGc7dLNVetfL2EcqY9KkAYh6iDyUdc=;
 b=ej3/rSK5Pi1DxuhUskVrQnoDwVchhuMS4Z2jNIYtaXiTGjoImWIPdXTw0mYDeNZgr9
 7E2vbLBDjB0pL8c+sFz8s/jwFooHD3s0VXcTHmpehM3w60ZH6YiJSqDX6jSnAqumJwnj
 RFOkPKjqN5fXMq7WyfTwRCXf7Iy59Anj+xh/jAAbWjgoqxjGK0PV/3T+7slM5GWDumW8
 A6UrTyadCRnlA87Am3igKr9wxRbhQFLyGVgoUvT1cxD/pK2TBvmdaJpPwtoM3WyGUmYz
 EaqmJBtz7Qok6WT+RPWNybZe1n1G/dFdGNRIpDvu/CYrvYzKbeq391TQG6E1NN34BjSz
 /Bmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiaZm2yJXLOt+zg8FIwAvFZKT0PdfvMi87Coc5r+f9BW/tzHu2z5l8HQJFbR1NJamOE7jUG2qnMa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgpKTi7gEnHyH2gYq747G9a7jIvG9ibz85UroSZ0Oafn9nd1Sb
 6tYb7K9jkp2peLp1fL8OP/fUXfma0oZfH2F7+y5gKwAP+jYMX4XnIznytohBI//vI9prIZ1p/bc
 SelPMzDTbay07t7nnxyxx2tBnOqPkPC0T8/UNMoMHJLOIs48H94WjHRLt066Un8J3WUXpJTo=
X-Gm-Gg: ATEYQzyaDmTlieLktC/3uY/UYI3QJQOsVc/dAMz0VxpN4qoJMEP8dvoDrph6FQj2a4V
 Zemgk4gpliN8g17X8JY739i9LlmBbDBK+qIckiiUVTXRrJnlF9H/Mx4K0rJ5QNLTAWXFG+DgbXT
 ZVIH4gGkKIpPvxd7VCZNYLGNZKNdtgz4b7SmOWmWmZ43lF6iy+I8mvmkfYlj2mcrQikOuBNSfps
 7uDgNCyCow7U1B6lbdq3/55tGypnx+3/Wjsuy8FYIp/rvYO6LLPxXunhVPJxegl3BQRoVC1034y
 j+XFDVoOwlbKT3Kk7socJ/fLB+yU4TkWFVcANYh33x2yJ83TbopuPTLapGLp/tGzclGAeuaR+hV
 m2/zlrA0Obw2hSZK1tVAZRDlmg/Fu87kEaqjt5Sj9b8OcReupcnpgi/ysj6HQd2KIJXWKkO+JHM
 v9idgYd2P3r9mkR87m2IXDj6EbRv3U9Sxvgs8=
X-Received: by 2002:a05:620a:400a:b0:8cb:5c90:dd6f with SMTP id
 af79cd13be357-8cd50bc2f3fmr245467085a.32.1772546939332; 
 Tue, 03 Mar 2026 06:08:59 -0800 (PST)
X-Received: by 2002:a05:620a:400a:b0:8cb:5c90:dd6f with SMTP id
 af79cd13be357-8cd50bc2f3fmr245459985a.32.1772546938750; 
 Tue, 03 Mar 2026 06:08:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffe01fsm32041621fa.26.2026.03.03.06.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 06:08:56 -0800 (PST)
Date: Tue, 3 Mar 2026 16:08:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <tybhaz76xj6spq3kw3dys24ynx3unpvyimb2skmz2djofxr72d@rw5l475xjkth>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6eb7c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zHWNXANJRpzq94LBRZAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RKCBlNu40ycFAWdLCe40jSIa9YRe5QJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExMiBTYWx0ZWRfX2IzatSl2P8BZ
 /siACf8TMaGjR8nPIdcIwoI3e6XHDSVVamMGcTg5rFlFuzDgVz/sPn7XPlZtzmB4wRPjFMpCdsc
 2oTFr8S+fKA0D7bjeXT4hWQp7NZSXopEeqb0m0idRnKw1+AbPCBn3hq4QPpDmaaSagUQb6SZBwe
 3iXjQmYllcWs2Dq2W/fZz8cx5aen33d1FEqSjANnDJQmlHO6xtaOmetK1wjQMMbwWJj0A3dyTW6
 7L27jO5cyGHWIPRjEC9Rl4d27oFovOZ8sZMeeYg9dpCBxCk93qXJKT7IplzbZx+YjTwP6V/cgoe
 hrqgErddcMvZSmGTHzTUwU4oSRevm3UcCzUYQbPsaXobz23a9lnDvzEJvH2nY6PpETmOXqLlILt
 ha5VzXJLK9B5Puc6iD9nc1SyVUcPeVZheMcvQWF411YNtZSurz/2I8d6VTkQ3TmKgnV1fEa4NMK
 wS5hmRKrEQhdts2ts4w==
X-Proofpoint-GUID: RKCBlNu40ycFAWdLCe40jSIa9YRe5QJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030112
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
X-Rspamd-Queue-Id: 09C651F1148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:57PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +
> +static const struct dpu_mdp_cfg eliza_mdp = {
> +	.name = "top_0",
> +	.base = 0, .len = 0x494, // not verified

This is very weird to read, coming from Qualcomm employee. Were the rest
of data verified?

> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +

-- 
With best wishes
Dmitry
