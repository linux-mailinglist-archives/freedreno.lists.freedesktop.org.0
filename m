Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJA1Nt9BqGn8rgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 15:29:51 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416A2017D4
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 15:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903B910EA1D;
	Wed,  4 Mar 2026 14:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJqCBfB0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQcGhfZv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10BE10EA1D
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 14:29:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624BvwAl2306688
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 14:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lAM0lLkLhAfZCHZbUwD7qSCj
 DT4hN9TPL8tFOeuxmUI=; b=BJqCBfB0qKdEQVsK/2X15m5IXjAdc5KRuN8e/Xo4
 vi4ro0xCEUv6OFDzLXDcsh1/STs1snGMX+15LLxHZfJxfwCf+TNzMMBTaiDxHx1B
 TyTnKVtkQB6vGH22fa1F/HJKKMbYOqdVCtv2UGs/6X4pbaFWVNwNnnjixMPy33dh
 DJdZ/gu968JpVuKUCi7gx4Xp4egHOMt7R1dwm9EbFD8PDogFutbUUeUY+yzch3WN
 wU42V9A6qitW259GdmZK1mSiugBRJuzZJOhjwUSnB75h9/KFV0Aus2FO4e/Aho7b
 7Y/xWiMlB+f2RsJZ++3MTqkdwnDaUXf8HZ23eqnDwYuK9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8tehd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 14:29:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c711251ac5so4229550485a.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 06:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772634587; x=1773239387;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lAM0lLkLhAfZCHZbUwD7qSCjDT4hN9TPL8tFOeuxmUI=;
 b=EQcGhfZv8/swvwXoynaX9lf1zCRhvorXOF1HE8SxPEjVFnDQh1HzcLwYjdnU+i3c73
 0i+igAd9cLzSzs4fJoQsJeD54T1yuS0tKbx9F3RRzVtoIIfnilByL4NyHEdcr3MAPOKw
 PrU3lWoxVgtc9scYZ/sgj2zrXjkRDpcTtCsbP3MZdx9gzFLC2B+RmYHzaA0PDN8q/cGf
 RfEDa0F2XWqk4Mr2pABGiBq56DIIwry+y7F7ntewieRAHDFcKnxBSO99nqWS0uuaG7ul
 7FjV3rXxBITDFg5QReuKDSJLABs5QIHusYSt0zqfgvoeuRXQQPEgPBK+stCnkMTSoQaA
 25TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772634587; x=1773239387;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAM0lLkLhAfZCHZbUwD7qSCjDT4hN9TPL8tFOeuxmUI=;
 b=ItcRRaVB6B64fAub/Vmi9pQJ1rA9sXjR9rd5Sefgcj7kLkFaonogHAA0L8bfW+oRZd
 j/zCRMTKl0bTbyEfN5JLp9y5r843yMwA8lA4Miclw0FLM7ZoxZ8ZT81RynnJXQzPhtAH
 EEfTXBQMGu+6iKce0YO4E/SzJBxTxhbLiOvnR7puRESC0L7FCbQLKkE+WX4lJV4QrX56
 TRIZlmovPgxd5aILTWJig9zvfe0qLpsvUCIGDqsvoT3eUQ9JTP7d/ILRBVvoOXXL6mzU
 B2f3od7mt94tSw/K/S6R2ABA78sW/w7xS4V++vZMsgdjYudOjZs+96ETyW47GMJE9XFL
 vURg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk4nDe4sIQUSS0AQKD/0Ev4kn0LYrVRclEE2b1lA0h3P1ENnFBJ+Xq+0XTLKWXQZt9vDvX96RamY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzpxfup2BFJSL9dr9kW2ngBi910eRe2sbfO2dPQcqrg4oSwALe
 yqCfYGJWgSD0JNHTQIZU+lKJVSzmNKqthgopw5TZE7knE1yCCnZYbC292IrC/7w9NG3M3YSQ7zZ
 vHNlDGtpR+ofr5piGyv5CvtYcOeWYKpO5AScM+zDZDviAitH+umYRbGC6x24IswXPmE3wPIY=
X-Gm-Gg: ATEYQzx6bXSqVJBNdrF4Ilr57GpTEjjep3Vpkcr09i/mnHfnw6Ur2aZwsJ11d8Ohj0g
 BbI28bG5XW3/hrn7Blo4Re2ddTDQuz9zDwzddkQTh/lC4sjVStszaviVPBfVp8CVeX5/w76EY1R
 qrs/OgRqDOwzNR281DNhLExjj9CI6Mro+uTjvuDUMMkUzoRnyRO5XEBuQb+9fj9CaHfIJHiLeYn
 FSeSSGdVqIdcYw4JSgrMVjCltxnm9OHTdwQdiggecQI69i04SydwvhNS5C/UnNIHLQ15fZDNkr4
 K5DR+S7wdWj1mZYs8vxQOUeEpLgGcLoslIRx1GmNz1/khbPXesKddc2ApexnYKQF8xDE3zRJkEt
 bqT6AsSlApwCNoWj0pqOiZaahahc95vyATOgTfmTYJY+eHTWXG7jRjpIwyubPyHSpqvqlrR5XTm
 XalWcak8x7hVI6AZvK6PAjLva46ktTkCvrHmE=
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id
 af79cd13be357-8cd5aebf056mr239661585a.8.1772634587193; 
 Wed, 04 Mar 2026 06:29:47 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id
 af79cd13be357-8cd5aebf056mr239655185a.8.1772634586679; 
 Wed, 04 Mar 2026 06:29:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f3016bf6sm36955351fa.32.2026.03.04.06.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 06:29:45 -0800 (PST)
Date: Wed, 4 Mar 2026 16:29:43 +0200
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
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <mo2fc5oalscfgagdrj67aa7xssnugsara4dartp4ycsdvoyvwv@swzmdnwtij6u>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a841dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QXpS1DXcpoi-XtrU5MQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: e_P-g7ewkMYUFEKQfcoflRIGuGpI6p9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNyBTYWx0ZWRfX+4c+JXTTqEB5
 1Oa90rk6upLmJ3XXkirBOKaDC82K1flZzdf8FFfhOHPhH4wKubMrhZu1JC0om+GPJsWiRuyZ1uq
 od8l6tms5fcdzeyI+BVR630Ro1M6nk2rvIITtlGpcJHcL3Xf9Pho0ER8ZzqS3WSL23YDXnLZk7x
 JER1dZCRxxdJDmoIYP+w7foZG62j99sky30jHWBDJl7+wOk+ubxLvzJqXLoRF1XbYPh/R++H1Ii
 dmatJqjMzzZe7qPQqoZOWwFK8eoKcsIECHBru1NWLO0xkltosNNc1PiJhsH6mz8M1UU+iAQ9iU1
 vH79OBcfyW+5hO16F8a8hTL3LdkhGd3sjVQZfuaOSc9DzsXEmD4kqE/Qs59rk5AE5dt4gq8dZal
 S/GhO1C57LSagmwO0CEnozNy+NsBDG/RnRPNMSmBPl2tLNiQWGRV3hC0BkLBL3A+QEQPbHRLU++
 CnvUrYkbpc8ryJvcplQ==
X-Proofpoint-GUID: e_P-g7ewkMYUFEKQfcoflRIGuGpI6p9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040117
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
X-Rspamd-Queue-Id: 2416A2017D4
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
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:49PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Drop stale comment
> 2. Fix INTF_3 controller_id -> DP0 (Dmitry)
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x4bc,
> +		.type = INTF_DP,

This should be INTF_NONE until we support MST.

> +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	}
> +};
> +

-- 
With best wishes
Dmitry
