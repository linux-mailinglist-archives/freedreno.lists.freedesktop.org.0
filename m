Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNdlO4jmpmnjZAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:47:52 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754381F0A74
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166EF10E817;
	Tue,  3 Mar 2026 13:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXghRw4D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3GyYhZC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E8410E818
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:47:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mu1G2773838
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=idB39/nW/QhmcKfOGj0Rxpu2
 b1UnI9mrQh1XvR9bGp8=; b=eXghRw4DzPDoGGV5ypOhZGjCv9ygZv2FFxbr3B/c
 KSaIPFeudF/6b7fmGYhuEIzvKWmJJWl2GLJnPG0+ga//Yhtib8DbxDKih2V3GNV7
 4+OJt3RDYlxmXFMKoBM39X/yZe4yWzBlR398QdEMRbduOT7N844NUjEd6zaRVw8e
 +yE6833LC9VzABZXLORmWNat/WMYN1lEBoZyrfZMwQSTTCB51SyQi8t3KZmOVQBg
 b5jOMcYXgKTdEZm8Il400SUoqK3eUt/diH5pHpTQLHaPgFewr1yJr+cd10kZxI9o
 tLd7Sz2nOUUYtH3AoNDDb1yzVzNueFJEtrl4rFBGeZBQ3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm1jub-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:47:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70fadd9a3so5172978085a.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545659; x=1773150459;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=idB39/nW/QhmcKfOGj0Rxpu2b1UnI9mrQh1XvR9bGp8=;
 b=i3GyYhZC9J4kNwkGoadfqq+1ySflqaKdz0dWynC4OVhWtuozNVAK8WFJtPFny4c720
 OQ1vgWaZ//NK/3sUTZGizjB9gr14CFqQgWaZMF1IeFebguvQ0dEQJcZcx4pU0HN5zrnh
 GprQuvjVNpp7eEJCwrjts+b2LzofOB98W8vNLJnsrq/LTm3TT2NzwL7XsyAmZP7fKOJ5
 eOvxJsG/9WovjuFljxRZ+XgmA1CoaFJNMOeDn9gu+jwUFuZouhHgJL/En1L+S4/ykmoo
 VnzSsj6JvKZ1kO3E6RZDR90dopsrkHanOaTTUhQacgGRsqVJS9eqbj+vtbjb6DPvc9o2
 Zj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545659; x=1773150459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idB39/nW/QhmcKfOGj0Rxpu2b1UnI9mrQh1XvR9bGp8=;
 b=F1BJ8mSRh02JL4cXynapcJDr9ff663Si7Ht7M/uqk8E+d5pf1fvLskCXiUi/AU5mq2
 lU2uGOSxUT8f0En5lFhE5drporKJ8OK3IS82OWidg67XJVTuwPEIBHO+NhO7JrpCjeaz
 R/zCrpvSYAARUnjP+6tGfYTmpnGUqW/r+VLqsLV/DBQuh7jdBKAQ+0EdmDM3b57oDqJ2
 Tiuuemb/ffqJt+tX/vqo/qwITItVNSfjALppJmhTR2tPjpcYmhG4v5nAmmU1ZijKSh7n
 F6NY1y18aNHmqHNy/nt7tuxbh1/mYmkRfvJ+AdlMyA+xjH5rLC1+fvSqnkTzs7DVZoq9
 LIFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo56ZMP3bg4NL/IheJVQeEwKnSeVgQuJ3aXfcbQuRXx+dB7WOMKB8pzW9m7R7xLSrSyyR7xbaII/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQFrZvNihaVDsO+lI6p/6+cdIQeP3eLFLpqmzwJwySMcj5rv90
 a8V3sMTchq5GdAmnz4vdQFBbHSIa7e7nDCaqhaP6yuokOdOIzbYCqeyYlojC40rn6qDppMW/3Z0
 8JeGfecFcGR6I12XCMqiDu9wiIaXOL0CIO6jSc+MoQBLV3TVoWfxldyIrnilK5q0/PDVBZwY=
X-Gm-Gg: ATEYQzyijsQJL6tZjwlJxfJOc/TZeiCNl9pi3u5Ki4WLzKO6bj9l+nWX0rFG+DWj3LM
 0z2s/OhA7F9tZrQPx7ZTIhoZZpPZTAo3LiLzoQnDUlx3haM2Mtf6VJKQK3ehmoFkOzziQKMgHVF
 C7WlsgnceRCQRk3VR4zYm7Ql9Ymrv378oTSSiOmxqAImHuhDv1gjXxstG1S0qQ1uyn7L/KMAzAx
 M0g3NoVzUccDECdxtEUk/Esz6XB60DozBC7FViKIo2dWCscEN5GuGJyFzwKBTLLtyNcHYPJKV9y
 bt8uMQWg2j+7kVhpoMk4L513RvE6A3y7NbWyCzm9G06WcTmBvD7uZvqA/KNOSYufy5skKyBxlX3
 wMaL8VONiyvbPFr5Q1E2BOZqtRLHYcjUDPdr5VZxqM6EVAz3pxW9DiD6PbFLz68GPfGwHaWQEWI
 jA2qU8pOd7hXLOgCez1hXtr8w0IbmOJm2Z+rE=
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id
 af79cd13be357-8cbc8dee51emr1996041885a.29.1772545658949; 
 Tue, 03 Mar 2026 05:47:38 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id
 af79cd13be357-8cbc8dee51emr1996038085a.29.1772545658449; 
 Tue, 03 Mar 2026 05:47:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1235845a8sm578691e87.13.2026.03.03.05.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:47:37 -0800 (PST)
Date: Tue, 3 Mar 2026 15:47:36 +0200
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
Subject: Re: [PATCH 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
Message-ID: <i5hiqu26ljplmajinfmf6spccydtfwgw3ak3ey6fuzykvrnusm@izbedyarqdow>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-GUID: aVDNhi5UaIwM2ZkWa_IttWnd0f1u03-B
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a6e67c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fTnWfZjI5X7wAvt4R4YA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aVDNhi5UaIwM2ZkWa_IttWnd0f1u03-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX0cL7haxC3Lhl
 vLEj+FbXzQ9jnmj8lJ3dU9LN4KZo+b3GmmnRULpt6M61SJ0ghq8WP8dwU8MMZSqJ4BqlJhYkMc4
 c8MWmV9jiYUdDG8ulSeZINqlTdRz7aWf8kPaSIkyIysrlHwSFy8nxAl10OIQYCaupH3WY2Lj10T
 YC6xFBExkmDc7p3UXw8cE2Hpfu5o/fI/SYzhG+Q5CI7UJ2NFczlUErG2exUZcjrZ1HTtP0U7oe8
 Vt2c1kJ5bvc0q8HYv+eyGPl7oP8qXQoavGSw2iFamoTUxBc9sIKemL4YrooLoEwekignEvvMcP7
 a8thWSclsVY/xtABZI97p9c5tq9vkZglZ6wCb0oYJKJdX7IkMBGMx+R3iUY8ncoeB0MPIdh5UAA
 GNIUVpOYNpotuVstOeAZcdddGLFUwDQcDxAKCGqWFfbVui8mR9+9PhFx8NFSeF0h7le7PZIK2OH
 3NPNUx9jVhMlFzHvYeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
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
X-Rspamd-Queue-Id: 754381F0A74
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:52PM +0100, Krzysztof Kozlowski wrote:
> Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
> SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
> compatible with SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
