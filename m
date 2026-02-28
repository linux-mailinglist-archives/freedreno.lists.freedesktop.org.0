Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BDKGVbuomny8AQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 14:32:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C517E1C33F9
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 14:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F55010E2A2;
	Sat, 28 Feb 2026 13:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKPCazFO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNS5V3E4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79ADE10E2A2
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 13:32:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61SCHt21059235
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 13:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tPKkssMOw7u1G3FtJ+5DZxGV
 8FHzK+dCLc4VoiSMY/o=; b=DKPCazFO47XyaJheoev84VdU5DZ468U0I1N0z3K1
 5qiHDGt1jt2hOhFISX00wmCR0zPXX8Hbid+bkBTNP074wCRL8hPTz4tq4UldQgE3
 dAm3bgP7bFcWmHDz381g2cTUwUyNZg7NV2Lh53ZtUI7+wYjf7dFd1SJKqvVX6IJI
 umqjaYbxGb4qqSZ7jBPGJTf8mo2VS+c/bw6RKc4as4BAExGnfgncovU4zVM0ViHC
 gs8yk5jiH80fcepBeIKiTVOO+OtXf4Stsk/dMrAcP/6/Wa/gyMf7lvPyX+If5oOG
 9TUD6HuFG1fsFndZa+n4CapRkwIfe8xjwze30zFId7qGEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6gx1f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 13:32:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3ad1b81aso3774747885a.2
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 05:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772285522; x=1772890322;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tPKkssMOw7u1G3FtJ+5DZxGV8FHzK+dCLc4VoiSMY/o=;
 b=LNS5V3E47rI88sK7xNutNBMaVa9S3AVwowQk03AmZgv7IE9qHI5uZn3vzABZfYWi8q
 a/nOtzQ2prDg93BagaCtodRINFe9daZO9Dp05nwghu7WH7UygbqnLgzjl8aVdNuguNjR
 Oa9pjyZTJQXlRazxFmtXvumUNbx6Xg2MIeMjHx4v8vob1l2Oqjnvo9VOurrAQla6xzs+
 6jnUJEZK6ZL0D4zfXlbkN59YVAb8zTv9q7w+D8Q80r6X8JO1dOmeR7LTsBuW4fohfHzL
 sH9E2cD2fpgeFUpJxSlNqFhQ6FB+qzcpk1i9P7LO+tVWorhNepqjmmmqEDfXY5PlIdhs
 Jm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772285522; x=1772890322;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPKkssMOw7u1G3FtJ+5DZxGV8FHzK+dCLc4VoiSMY/o=;
 b=Mfzja+0qca64n6H01+CJlFy/9dmPS2cYc+n9GIQBmFCcQYSd7SxD5UO7mOzDltJRz4
 omJDRiZuBqrSwWxW4pc22TfeoT+LiwbPMJSzsCxmDB3Iz2uULbTH22lna14+jUcpSQxf
 K5agOSv8vHWLqgWMThsNXLPrfo595WxlkkkC+gttbNDOZbqaPbg+iTSuwcLRAJKLJ3an
 1EPNkUqNZGo5666a7i4b4CTLMR5tHFsDvO19zvMBOTmpEU4jUEG5jv2KjR9sC3Ig4ww0
 7KaglhavUbAyb5waunQW3iiD/zN1Bw406a2OXC45YqKC5K2XzTqZm1ZKiv1s9AdMr4zL
 yw6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOHD4m4VqoH8igsSr/DLjYqPittEx7S7wRQe1ZP/vkuqfLCKtfxKXXUY9pbNNhw1SMRRFwCXpjapM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzts6gZ1H8r+IQmc4L64FYxOt5I6/9mLnAcQPvJRqx0fBrkXbqI
 p9lAnfvXJRr38C8hmPMx22wtfENPTiRZmc2QkmcT/QehTPq69VtGYfNfuj7AwAiv2gSW7AZM+zs
 FxyKXUut0t85MC5uZ9WRO9gQQbiW4ZfwXeyNgkHB7TbEnPBHp8iMMhG+4frKWWddfI1l5olI=
X-Gm-Gg: ATEYQzyHTo3HdyGgRQ+o53gXFbyqnhD9/7wKOfinruz5sGkTBq2ClFyW0mu3xSH2h2a
 ZlwX4q2tpInAHnGE8DuAQpczwf5txvRAtcV1nC1t2U3mSD3PKSL2vi3T7/B1pFxmrMMSfMkRPgR
 uBZ5yaOVbtxycBh4xbZABttcwbjzksVTYGpG0UQaBQ60FqynqnTlTXmeqJ9IcM6yGWVTvIZyigT
 RSCVUFkzppofpfz4xE6WY+PXxHdI/usbcJIQMoIK41gOpBGxJ0QxCEeMx1a5UsHLH1eeYxuZhrj
 c6fKodcb+8P6w8oT5K6iSk5ytCql1HnR2mXsrmVC2yrcQmG0dCbLfY+13XnUWj/rXp1N1oIbqDP
 IbQ8ex2OqELK6DfvDSj9mhm8AQxzZdCR2wsUBDxYPutk+kCHkhTPJckeH/vscaTHtGT70S+7JeG
 6Y+RzZZecdi54aPF1TP88CEJNnEmz+o8IAJVA=
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id
 af79cd13be357-8cbc8e79948mr809014585a.59.1772285521751; 
 Sat, 28 Feb 2026 05:32:01 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id
 af79cd13be357-8cbc8e79948mr809009885a.59.1772285521246; 
 Sat, 28 Feb 2026 05:32:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a11a12923dsm2815e87.64.2026.02.28.05.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 05:32:00 -0800 (PST)
Date: Sat, 28 Feb 2026 15:31:58 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
Message-ID: <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
 <20260228101907.18043-5-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228101907.18043-5-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: nWk5O8mRwdbYnWoDrKRtohalYOKTYRPm
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a2ee52 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=oZPMeiHd2FbyKtjdOA4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyNSBTYWx0ZWRfX+Gsr8jKwJ59Z
 5PwKilZjmX2baVzKrtMzcpV36rQzjU3Nu0VauQ9LnDafTcdoHZXEBNPTvTwgnVjbRbJ5PECgKoU
 OQjn0hMjlro5p4PvK/QK/qBASlynBCArQp5eimfMUU/1y5Os7n4wTe9kx98te4vngSXy0qokUEj
 J9eaMs3dLNHDW/bAgrBmSoauOXz8awoZA0IX8MiSIpWbQqdcOFdmyF0ngjz0zaZiw96TX7m7r/q
 /fEFe5dOkj+Q5mVjy6G6UTmkMmsiLqQjHggmapWAUitroD20SDmieJXnVCZmufs72N/i0cGUACB
 yCblhKyYAmQAZCe+/1cCcc8G02D91tRgo0qnjNwBl6OuDg/nrMPnMhFkgf+tc9+fk35u6mu57Kk
 epx/3Puz84Ws8AN7QPD4VSzQs2NAmGtgTu7yBsi6SsTG32Z0FQNYWNmBRFdA44FkIfY2m6Yh8zO
 eAGN/M7HifLtLZ+NvCg==
X-Proofpoint-GUID: nWk5O8mRwdbYnWoDrKRtohalYOKTYRPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280125
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: C517E1C33F9
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now until we submit dispcc fixes.
> And some DSC enabled panels require DPU timing calculation fixes too.
> (hdisplay / width timing round errors cause the fifo error)

- Please squash refgen patch into this one.
- Please post at least the dispcc fixes.

> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 396 ++++++++++++++++++++++++-
>  1 file changed, 388 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry
