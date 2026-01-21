Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJU1ORNhcWkHGgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 00:28:19 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6265F7E9
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 00:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDC710E8A8;
	Wed, 21 Jan 2026 23:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FW+4EZfU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JteuHdpL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3707D10E00E
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LLOamd107377
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=; b=FW+4EZfU/iibQ/SY
 7UClGWPtwOTFeOKt/Yr5rdLbfIT6iegnm4bZD4QGlkaOwjy62ejlPf1cIriRXPh1
 5nrM2vHgIExHzRJpXshAyKnBJrg3hPtKesbrklwYAdgThSh+vRaV+3CsBnifkVzJ
 v7HTq4mc2drrXDnREevEA1mBJ93PvusBa3B2RFJrNUSSpL0McoJLKLewdjz4d4lx
 lWbTW+kMn4Embsz28o4+LEQc+e+f6MiOiIScq6wNjrWmB0oz1Z0AXxZNVuJOMpnG
 soQIy5nwikd/atV2DKM0nPM6DdHaOJW0Ftmw0PCLmsedNrVMxL5NmWoyk5chlaUf
 neMKhw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgra5r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-89471079a13so20122796d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 15:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769038095; x=1769642895;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=;
 b=JteuHdpLR40AxWwveo37/jkyXAGWX0zyp6+2hbCQwwsrwLorjdFK8J/AvzJgwIv+a/
 g0FUUsOvwbLVCEJyNEud3awqamVJwLgpVvrgeQ/wrucCkT+4L6G4Kgvyda0yZFr1WKiG
 nlGhni/2C18roTZQMQdlo3tcgRvKDT48ahfcGNl6qPPBPaqpu2apZik2G8TXD00WiBqW
 X8XbG6a9ufVHAe4FnUGv7HVzdXnTLEr4pO5HKJ3CGhEjo8WeDZyGKO1WrYuwMPXOM4wS
 a/TViEhM3CQVS5lpljq1ZHfsOqTDhss16IIXCQjwY3EiA54t+6uOnjfDVuTRuNxba5HX
 clrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769038095; x=1769642895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=;
 b=Ct+EMAPoNI2EHrRu04DCm9F/vzCj4iXqnyHN75wtt+VKxp1b9zPD2RTyjq+QAMAP7u
 P0m9kWWUtn4Hq8uAT35lOlBfRs/oz2LLTtBns99d+yGfBINr02O8/EamOZMJpOIpU00X
 FNr1bjNhKIiuFwWSYMq6HwWc/AroAjpXLs522AjsoVLTCuFYyNwyKlWPvpUKxMVH1L+j
 u6PY5YiJt3pwiJnfoqmcMnL9N0mwakhpkIIO9/RvIVEsKECXo5c/LpFTVfGn5BIpHqoI
 OW6JqXdB7YeRedolpPocFaSwDXdbV/zQLPuW1uIwZfpVPmLsdwKbIIYyzpQ14Tm475kW
 sDtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUToWwX0awjYxyUwRUTLyUO9mnYpPvh2/xtctKz8nPsK3q34IrRtkHsKQybQ4glZsMxbp329t8MVPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH607vZXajlpLYBXvIki0AD8NIgkr2fuGBHc2rMAVt4mBZnbYQ
 K0XRKVqzWMMK/+U8UvaKQIXVC279DKg9SYsyaFPIjwRRiMz+B3fJNxRI007aHVrUiNBnCUr6oXV
 vmETox+Be1wQBUpIRX8q1G5P2aOmj4C8XfBuRJSMq8KYhPGXG5wHQmIenabF4oAq/VL3LCaY=
X-Gm-Gg: AZuq6aKcDca5fRah6gJsuY5pue2kqYWyqzeqlShWQo2/hU3G269lXAiFghswjkxCPkd
 636HtopybhXvvMiICbKHQM6vlGpfw9NbvIlowULPi1xe29fSXXnzBgl3FsNbpWuo9DEy1hlAwLY
 EBJP9tvNuVhu1M3zwwYLWkFFkBmMnW6bG3jKr1LY0wos6dW+Wpm9D/fgCJ9+Ehdxp3fgtcZ6pGa
 lRj/84p1BB1z6Qu8x54ow2ahoHvtAZokRdFO3iXBUKCo5HtM/BUnQ/yR6ihY8CPjJhhZmaqRUb7
 yv0t3LVgg5m33mLLZpmOJ6bCaLvPm6Jdkrf3eQVUWSNeA91Nd9HOiCI5llnBP4wUJZiIzS1KZp9
 53P3myvu3RjMJdb0V0T8ccOcTQOzCSdwKj1YrUgtb8KeG74eymqkacgKBGPffjOc01zU1j2SsYk
 Frm7aBsiYnS9zDoabXlA0OgO0=
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id
 af79cd13be357-8c6a6956064mr2749625085a.71.1769038094733; 
 Wed, 21 Jan 2026 15:28:14 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id
 af79cd13be357-8c6a6956064mr2749621885a.71.1769038094195; 
 Wed, 21 Jan 2026 15:28:14 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 15:28:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Federico Amedeo Izzo <federico@izzo.pro>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
Date: Thu, 22 Jan 2026 01:28:10 +0200
Message-ID: <176903808260.3665431.1048287995519392078.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfXxGA5/N3BSLNh
 jIkTn/FflpZboV701eSiC3/d5cdrSxO4g+Y1UUkSMdGuY2I4Av566w0n3SYe5cmu7vUVbEmT+5o
 i0xa/vswK7JV6Wf88TOqMHC/PSZDRLgAUjQgOQqfg66bna7JQvTl0bTHc1T7k4zcLdmucuWYxv6
 ca5vBB8b2+J5fAaqcBxqFFl47V7cUkxYPdtZPKsoH2uP/6uH64Cwkg2SlV3Htc5SVsEnwfPxrFH
 0cbgQHRS5YOb7Pa27YefT4FMZ7xslvInyjdRzvwp0hYMExh0BFDM/cyPS1VNerbM2eO9IbTFZag
 8COAb3qEMSYvKHNaVgAyVogdl8EfJ+x4/17oz2CJPieqX6Wpnd8JggifSg4X2kSe3V+R938nG98
 Kgfbtp/VAy80nNG5SE50yvqZPn9R/ZNpCCN3e79N/AR5xFwRuzQeIeZ0TYD8LC5FdQVmsjyaMS8
 3CnNwT0YRGLJtxmo//w==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=6971610f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=tjCOpFjsgevByX77PJkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: AR7C6uxveadEelqgYytJK5Y21y8mzO0Z
X-Proofpoint-GUID: AR7C6uxveadEelqgYytJK5Y21y8mzO0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210197
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8E6265F7E9
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 10:41:24 +0200, Dmitry Baryshkov wrote:
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/ci: ignore Gamma test failures on Qualcomm SC7180
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b38d2c3302df

Best regards,
-- 
With best wishes
Dmitry


