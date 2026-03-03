Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIDaBp/mpmnjZAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:48:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D021F0AC9
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6111A10E80F;
	Tue,  3 Mar 2026 13:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljCTyQ3S";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcmmEpm3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4633410E80F
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:48:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nILI2630357
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2eWWjGPyBnebc1FydoyAZxwZ
 ES4AvXrNNkhP2BxgHh0=; b=ljCTyQ3SB11zQhOOc2FSe7OrQR+Pmqpy9ik6jcnS
 MPIAD6wvdCb+dNxdlXx4mjTmbw3Ulskx34qFNcFl+m6EWDxupfN4RcoiCceNB50u
 z7pqzit8hrOoGGHRbe5nkaBBVQPJjIAOFwlSyHd4HsDgQ6L4MCfFt4U5tTGrPZPE
 rAYOdZCajwz0FJ6teZzSW4+ReUunH+auLxxi/ogDuFDWlzh4a6QIlGglVcNwmImM
 4G2xX0bLbiJF4QiEEefbmSKjVugnFjOeHScq7HHgtsVMUtc8YQCu04nWJa4Iq98U
 q0SQikTBI0QHa1nDr2tEdkhWOFIEaI5oaSFbdbm53lW0Xg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5b0g1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:48:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb413d0002so4293432585a.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545685; x=1773150485;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2eWWjGPyBnebc1FydoyAZxwZES4AvXrNNkhP2BxgHh0=;
 b=UcmmEpm3XZFOXKH12dEGuRDjNssKLXgIpIm4/IxphngQbUdR0z17zNaEkzfCVzESKr
 2twZiYYOFeF64xKtIUXAhGvwmyPUOC4+Jf+eaMY1hsIRn+/PZb4UlHt6pN9juD/j4Vmg
 ml+S/9QgKHdAJshIbM33d8KuFKY/NTMjp/UFO8a8FbQ987Kcwsh4wOp65WZJUYoOaGnG
 IsJZvlnDtsHkAHLYHDgQJMuUAyB2xe/0TwE3Pkmflseodkz9h5IGZ3btjhatsy69U+nH
 q9t9sU08G9EnfOF257I7bGsY3HGONTV5DIS/ntlInGJiMYdlOo5Oi6ZzsSlS7WnVDas7
 gmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545685; x=1773150485;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eWWjGPyBnebc1FydoyAZxwZES4AvXrNNkhP2BxgHh0=;
 b=tgYhodt60IablTZP1kvyKQYzG9M/NRysEdMvtdQSlC8B6nE7RpTs0JRXagUE9T2zsS
 NSJcWHRDkQnZhWy9R+MOG6Lb/r8HB8St4r9zhbw+57oQKlxKmIYIrUDJurm2bLb+p/fu
 MKp3Vv6qBacSNL9wovTbMEAgc3nHc4wOZzKwIB63i/DQl8+s4rJ6gsH7H/ItsokWb+pz
 eU0qfPABv1aDsL2WSwAD9rAXx4T5v23LCdKcijhTO5ewTx4+p2OYjJTDk9/7hiSIS5ge
 j1RO7EFVv9oW32KJITqdnskZ0s3U9yeSksP+wo1mCsXbdSiE7iaXFbmuLt5VsfprYTtI
 Nk8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGfWncsHvbXAokDlBwkk2guIA5X+0tkg/eVWXQhFqDKX1R3RiGLXmsl2/90sbZ5spsJbLYvAR8E7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC9NIMD24+Q1mDnMZuJkM72GjDCpQ/2NObaGFCzTRoyyx29eZ5
 2s2c0eJm9lo+gWjRcgfymzqbhs2Y54zyhBkt+UH9JhsWEV18EzRxujIx/VJ9DagNN9hk193FXMU
 zaaFveUlQFCibrKwG0WY0FTwDOm74tv2CoQKM3+C+LprPB4gchNhcqf4y1QROGXE5gj5+1I4=
X-Gm-Gg: ATEYQzwK5iH6Vz2eD9ubcStLb7EPozlNJpsmQhOIae3xmH/U9NPOXVM5xB2nFnf4etC
 ZHqVnwW8K+IiPYtaP5hqn6NrI5dTNDnravoTw+piO1JU0JIUr7V1ZMJnxe8Bq5Lxa6rlXq5Av9C
 CNoHg4sVKV5sFtD1RThlsU+tU17JZyAnsHUfogO1vx3rmMA3BDOPf9+vplCsedMw/ck3KYAGw4B
 jRleipiZitAHCkMe+irmayT7V29smakxhc49LtoCkpzOHXoS4jH665UDa5NOysuX/y4C2HbWkZv
 4HZEcV9t3zv9ULDKUShRIjNniDu5sLASpcUtUOKjO1tg8qg2erOMNGbxZUIeSug43fj8VD0Sf58
 cdln06Bovxx8ZRsbUoQN9G3vpe+MIG0VST1ZYUdiZRtUkdu2HnVGhfeT9sPL+uo8l5nTUmw9FpX
 O7I9BQq9qZAhsMnBDfgVTjI5V0j/0zVcdJqyM=
X-Received: by 2002:a05:620a:254e:b0:8c9:eee0:db94 with SMTP id
 af79cd13be357-8cd50bc2911mr203049785a.31.1772545684669; 
 Tue, 03 Mar 2026 05:48:04 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c9:eee0:db94 with SMTP id
 af79cd13be357-8cd50bc2911mr203046185a.31.1772545684050; 
 Tue, 03 Mar 2026 05:48:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1273cf021sm94913e87.4.2026.03.03.05.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:48:03 -0800 (PST)
Date: Tue, 3 Mar 2026 15:48:01 +0200
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
Subject: Re: [PATCH 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
Message-ID: <ym4nzlar5tgu3pzaotucg4sd4gcapprl2i2jrfop6hcj4mrezf@5irva5crbxxf>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX0611dIHHWmMa
 umn8mqnpzaVHUMNzDuKnQoK/D/4zERijcLkCddn7Kdck6xcaoFh+rIhntNb0w9Ktgj+6Zpz+p7B
 tFe5TbmHBvt/0JXmhiTQNjqN0G2XW5odIddvG5JXxcPdUvBL2y2YkKOq8spF0MH3AaA9b7Le20U
 z203tvfycUwSPHbhPWo/18uZn8o5ZzIb+OOj7x7eA+o+c8gOhlUsaZiUGk965fT+LYx9b6kBikk
 a7bC7zjVJzX0XZFCGK3Na2s6poZHUCQ0sV3nhbK6peMZ8vPbMXe6ArxFpTLPQzbNr2+uhNSx0Vq
 gLVe4VhD7j7zbrHvKqF4o9ff16srLM7Ya8GAMcOy06HzoA+4+Jm28MpTtqheN56b3+9XIPR/IMs
 tC0uXdG3bNeNSXNu5w/Kr+EekJZBboNoO/D89Sr9ZJD/OCeoQHnsH3imFzpYAmgaR8nfEBlnm37
 22wlKGivbxFOf3bVWTA==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6e695 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hxgsInd8paV07mNIhWkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QVyKBL_wpF_rN6E-NrmZvssYZAIh2tCI
X-Proofpoint-ORIG-GUID: QVyKBL_wpF_rN6E-NrmZvssYZAIh2tCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030109
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
X-Rspamd-Queue-Id: C9D021F0AC9
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:53PM +0100, Krzysztof Kozlowski wrote:
> Add DSI controller Qualcomm Eliza SoC using exactly the same block as
> SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
