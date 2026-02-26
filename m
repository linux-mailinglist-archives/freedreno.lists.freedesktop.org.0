Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULpLEzE+oGmrhAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 13:36:01 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA151A5C2B
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 13:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095D310E915;
	Thu, 26 Feb 2026 12:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2EdUfJb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2J4lnWb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD5E10E915
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 12:35:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QALD18350088
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 12:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5GMNC82o2PbIp3JNg7h1C+vK
 9NoeCm9TDJIU/C8NC8I=; b=T2EdUfJbHAVI+0GT7fY3kFu4OBWGb1E4XS9vCwYz
 6HJ2D2hfvG9j3pbp2sn07vVBw1gHCoSz5d8vKwxFWh9mrQeJjn7rclgCKLhHg5UC
 xagjwIgPgmWolVBhmpfXuIYaBnZ0BDi6c1KUFHxXwWIZZ3qgEXvTB++XN06xibBh
 pvDDLriwoEoK4//AlKVOiiTECn0tWJe6St088N4D8GLn1DFLJ7fORdGHaGftvaJY
 cy6kFNshDi5k2yAOnBKNwtDHulHSD8mgCUhhXpsI3EZ4tskICgHA+YZqt+HEZAFP
 z5F1xhtDRRmfJ36+de5c4NarHJYwv3/7BaWRnxQBgMT0wA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0g9xqf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 12:35:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb4e37a796so523657085a.2
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 04:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772109356; x=1772714156;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5GMNC82o2PbIp3JNg7h1C+vK9NoeCm9TDJIU/C8NC8I=;
 b=i2J4lnWbD8uQNH9HSqWBrSnw9dxzruS0W0kVPYNXlMi9UQOE9sSK5jhuPmARjgW+yj
 VqeRD54fPGezb/8SzOvxbMbi5wfq3rSkpMJCX+6UvZ/bp4wm3rsUOu81FQHpnW32IZGk
 5rrWiPFsgSfKVjKiJAYU7cptyCD4ZAD/QFh5jaevYIEpSqZCJvLesKq4hfJhvXw2SU9o
 cq2H422KIvzM6GomOmqaKp/qT7DDtEeTnktfpyFFW3BQuPECSC9y/C4AU/tdrlSwXIZY
 ltEkEgzERk2kLME/6jfi4Z+K/FKPwejd4q4OWxznh3SlXw7Co4nMUoaCFh5aaOGPhAuy
 VeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772109356; x=1772714156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GMNC82o2PbIp3JNg7h1C+vK9NoeCm9TDJIU/C8NC8I=;
 b=NzHAt+DQxX9CRTbCNRRrCNkQtFkj/ub1gBtkLnBxnAe7asYJnIA9mbCQyA/QoyConM
 6S9mF0RFDp38jM7s8362oJv4Qs/hPaLO9hA+5RLiflQiVvegb+CWpg5ICnd0z8ebxRIs
 tToyEoCtmn2LB/b1Eu5g5CHMUimdm1NkG38T2r1NopO/HY6ezyfxg6xaEs7Tlb16Bcel
 Ad0/A9+WBUyo29yF4QcMbwPIV7+aOJvDnq1W3d5RaV5tr5bAAx4tpN7A+ZXOrk21QyFZ
 RmKgk7nTx0r6jfp351KVTUYeNkFElFLoqL7inr3E8+rsSjyIW4tY8+7aUvrmJYJmW8B1
 xbuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBO4CmEFHuEFsN3ivh81WeJGr8Nes8lyWi/CMhf4O4lA5F3ZRdK0+Q8vrkDY4HVHlIMBsokV27McE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRxJIz7US9m1MFNHsep30FSgJIwo92LbNzys2x6KCrSyCtKKEd
 N2Tx0a63/XNqaSS0fkCHc/Kv6U6Ey/cMZue3dpXxKlhGSgzm4fy0zCWwi28eGP+95EpZP2yut9Q
 rZ8CJxjFg1GZPYd9WFIveDidYFzIevgHL74UaLiHaTfqB1JB1+Mybumm2BhW5Inbmaqi7K7o=
X-Gm-Gg: ATEYQzyYxg+yMxXpZAYG+ycyRtCKai7JkSqYnTRcQsxnnXzOoerLuoLL9ADhoji1hHC
 SF4f+lu8w8Y59n8Hp6roGsNNwGaLmO++dmDc+ugd1CrMlRs29hQqJinQBA4Pr8H6sf7BnIP2uSB
 sSsLKnX7cwwAVZl4NlvAh2t0G04RTDOJ+d29h4PIq/cC08ypt7e0XbKHusGnDQSGMFP7CEn4bVF
 0vIUqO6HkYKu4JOnLzYcliq+jk3XBXUMtwPt2ZihC7JQkRYkEaFhIzUZ34Ab3mbchYDrh6UUFLk
 XhNOpxDcfj3Rr9GDGvbAbDIGUizSsFypZdN+Dle1xlmQVBUUJbyNe84V66ynJcETSSeJdPSaMy8
 L5OtHZPkkb7LsHeJYEyC3q6YiAc1WALT916SNfFkSefPcHqeq7gX3k7nqQhJ64SpShv/7oRGS/y
 7rVTMWkvsPv4AZmgwM7G3ZyWXCz0vuRtgSVZY=
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8ed with SMTP id
 af79cd13be357-8cb8ca83779mr2673674185a.63.1772109356244; 
 Thu, 26 Feb 2026 04:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8ed with SMTP id
 af79cd13be357-8cb8ca83779mr2673670085a.63.1772109355723; 
 Thu, 26 Feb 2026 04:35:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2f4b189sm5886321fa.3.2026.02.26.04.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:35:55 -0800 (PST)
Date: Thu, 26 Feb 2026 14:35:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
Message-ID: <dyqv6ds3tdqcdrdl6zexwdn4mhi4g4p77sdymaqan6nmdhqmxc@mzl372c52wi4>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-6-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225054525.6803-6-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a03e2d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=2VfSu496nhalCebPFTMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExNCBTYWx0ZWRfX2v+KmiHUGZk7
 LNaq0eRaDFdqrY9duha6lH5iqvP6wP7sk2zv8vr/b8n7zR0xNxCyBNJXaY1YGeUH7slcwuYNHwB
 wFfD7jgO1wxPgK6mgG0SvY1sHYwdTyBPXiQFiC+4YDRsLToN4CHDixtaLwmLOrFMrEQNw8HW6wo
 d0e/k3iMdUYXVLKyzJ1gHp++nSQAMlEtstcuFA6vYydtYfRGX48ZRKd0N0PhKxc6SSV15WE94GY
 PhAbvAyAxEy8HG9A6mEPGlozcjCBxopwBkCNNxqESBfEAmwbVudY7QdN6Xt6CAatxdZzIB9bmt0
 +i5mWABEGVBlyBfQ8nKnSipatcnvhvqGxY4OtRuCRgQU2ZUSekYY+6lx4VHbpEVeaWdbR9/ZFzq
 WI0cGCZwxOhfUlojSRySImUOhLQ6Ubm+dSbpRVCKraTq0OLOuTG/M8JZhsei/+rKzO+xqqgiRAz
 MfMGuzxH4/AfXASO30w==
X-Proofpoint-ORIG-GUID: UaZ7E1OTVNTWQy9cHEle-PjkU0-YJXms
X-Proofpoint-GUID: UaZ7E1OTVNTWQy9cHEle-PjkU0-YJXms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260114
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9CA151A5C2B
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:45:25PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now (Partial content wrapped to
> the left side) until we submit dispcc fixes. And some panels require
> DPU timing calculation fixes too. (hdisplay / width timing round errors
> cause the fifo error)

I'm looking forward to reviewing those patches!

> 

-- 
With best wishes
Dmitry
