Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OR+8M+wXoWk9qQQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 05:05:00 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AC1B2795
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 05:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC2810E188;
	Fri, 27 Feb 2026 04:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCyPnSVn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEo7vJOE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E86810E0EA
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:04:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R2JxNM3185285
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vF5ebjzI3ltfd+GlOyn/ovrS
 76xGTYky2kSG6LrMPmA=; b=aCyPnSVnbdhJDfviUFTEKxxxmu00GUB5itvkfR4+
 QRY9/lSKG9OeLJPde/Ljx9sbBDG38u5RZwvF4RWnGZdVTkiNR/5zSqs+WwPpp1Zm
 9U+MXbsJOm+enczWLMSdMtgYrTuerJkhfBdpaHC+zb8fLtmqQk6cKEv03r4vMntf
 wVRRgGjEEL6hYbfJs3U81wWsYQqewwZ6vLp5hDA2cqFm/LJ3eCvfpvmk1CXbwVTn
 mgEPSjAtWhmmPDYYKC79vDXik+ghFc4yUT09YVWcy5eemfK1McIsDYCBE0gd2AS4
 hMNFIUJdgRb3mOSxJnshiT45/qUYPGOkggCw+urcrn98Og==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp634wy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:04:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-896f84e69b6so48102776d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 20:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772165095; x=1772769895;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vF5ebjzI3ltfd+GlOyn/ovrS76xGTYky2kSG6LrMPmA=;
 b=CEo7vJOExDBojh/mz2h6hNMfGXcLAuH1ZGqeuzX2J092iDD4ZDnNQU6TyFfNWLN83Y
 TvxMj9nyD42VGzv/3WoYH6tHmuR7LM7vM/rsrwM4JGYCcfuwB2CmQkZWk+j/2VD8lguH
 XyrLvNEcDTUXtWuiF80EjtbehJGtuIttGiaYUJf9dceshomo6f3xEyWU0VuCEol2l6aD
 ZPUxTybc3HRAu7ZKoy3NsZnYNxRwvsax2twoDEomJo45HKLS+wXozqeTuXkWzLbPH2Lb
 LPsdO0JYKXdbykBO24cFkvdUlUQWZ/D6xy4x67rD043ioFA70CgAtCJuFmhVICjrvwof
 9FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772165095; x=1772769895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vF5ebjzI3ltfd+GlOyn/ovrS76xGTYky2kSG6LrMPmA=;
 b=lcIzgrPIbZn5O4EaHJPz+WFrb/lx7R5/iN+rpsVli5ctStTq05p6FifujfnGgLsFr+
 R8NSul0xltbqdoeisR3F8IwohX/lRnlMK101ZxFoeAXRjxnZpnvE0ueFlIewFvTTMULo
 +PMSAmhw2Ixex06MGuWOT6iJIK1m0xsxvIE1yMKw9QXtnA31BQ+vihh9cRN40DmDqZqD
 KZ9bGoR+2Rlq4Caxeq06zb9gizpl/V46UcynCc6tf5yWMcs/jua8KniqfcTqxEG6h+9S
 8M76qgVg7USEXTqrBNhDbnm7+8YHlxP6hqGUNkt5EGFGKAEncKW2S+c/IEDQluEGfRK5
 R7Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiNDX2SUYn8K+NTL5Eix8AggAE+4HU3lg1AzwR5cKAmjBtAY5EPMm+DC9/5/DLE0WV8CkPwHgrWpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH/0sytQLuWXbNNbTPdpg8QyFCWZh5iQeHinPV/51/GxG/5SR9
 k+h2YcUaPfn61u4CXV0SRd/eARn+T32fzWavXfwoSdrRc2cEsXtndWZQujTqp9VQKAAWRZLgYdS
 1BtOkrXL2ypixer/spwF++FmF7lUoSJIkKAnjUPCDMMHVPGNwN+rEaKKZJ6Lj46+Vx0k5f7k=
X-Gm-Gg: ATEYQzx0Xf3eUsGt2XkBWXqxs8p04TMckkK8W1s41z0nsuTom6b6kanhpRnZpa2yPDU
 fGpodvIs4TAo9SAhX2mfrOm6y1E8LVlo+I1KzNKLpewCZ3sn2esTv6479KKrid4pxyDNm05JbNl
 rtmq9/q07btMSfE1rtEwPfaXWaQMT1OpwvpQxaEr65WOJsL9dYBv+upzkMRI2/UxhHWGBMGTmuD
 jpxuOCNiyHkVT5Hpexh0GAodRdj9BwyD2qzV5VmtU2S5fCqrDwJF0ydI9ad0V5WoifBxSNACNmj
 DZ/uHE8uz5XaV5L/S94YFwVeWyfmPZ0EP1WYtu31I5x8dkmAR8jiatzxfuqJljZtvC4bKM2UjTB
 baPKj8/MOkgWcRqumxSZNgER7gKled8SdlUqMQdZH0PwOCmMCbTUcJAWFVbXlMiE6u2AxfzW8dv
 rX/IC48YwHM4zmgZHtUgiequqFb8U+5guO9o0=
X-Received: by 2002:a05:620a:3949:b0:8cb:2c2f:90e with SMTP id
 af79cd13be357-8cbc8e4fc12mr181458685a.39.1772165095142; 
 Thu, 26 Feb 2026 20:04:55 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:2c2f:90e with SMTP id
 af79cd13be357-8cbc8e4fc12mr181455785a.39.1772165094646; 
 Thu, 26 Feb 2026 20:04:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2f626b3sm12487591fa.10.2026.02.26.20.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:04:53 -0800 (PST)
Date: Fri, 27 Feb 2026 06:04:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dsi/phy: fix hardware revision
Message-ID: <vtvn377utuwptjbfuqvjypxzltblh5c7dyocwjr7jqyemgzrwh@ei4cx6q6x57l>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
 <20260226122958.22555-2-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226122958.22555-2-mitltlatltl@gmail.com>
X-Proofpoint-GUID: bOpqrDcQPxB4niwDVeUAQZqzk5jJJkMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfX3kl8fDdmTmuH
 uJ04eq7AopJxDwK0liLTYAftUpTX978jxl+1pb3+gjIvHYPeNlCIClIsEFX6q8uttgO/67Sg4ws
 ZSj1a/rrgW7iCe0Ar3L7Yp1cDtMTxckUJq/BPMtdswfLJJx3N+sznvbHfVIs1b5vn8U2Llz7MiE
 Alp++QJaDHjpmCtqch3+1WfI1semK5bDnqJSlfaQlZNNlhHnEXGBIVPf0oBObarOwwm+FvcFuyk
 sG16JLuEVz0uXvY+STUNJYCS+yA3450KGa6+mZGotUpXMVQxLLE3P10KPNl23+GzmU977F3iElc
 qjBOJP4YhYkVBJGcfEjL8UVle6p8TU1fEnEJDLeCgOJIgqelFNQ6NLy9ROcjEfzrDTi5gWK0yag
 N9jQskvtMGo47xqTLmx5JWm4BOah37J/E7ggkiJfXmIQ7EPu4FhNJUVfm1cR0y76liHETr3gZrc
 Kcx/IErkErPA3yAqTJA==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a117e7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=IGH_EllJKgn0EH2UewEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: bOpqrDcQPxB4niwDVeUAQZqzk5jJJkMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270028
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3B3AC1B2795
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:29:57PM +0800, Pengyu Luo wrote:
> The hardware revision for TSMC 3nm-based Qualcomm SOCs should be 7.2,
> this can be confirmed from REG_DSI_7nm_PHY_CMN_REVISION_ID0, the value
> is 0x27, which means hardware revision is 7.2
> 
> No functional change.
> 
> Fixes: 1337d7ebfb6d ("drm/msm/dsi/phy: Add support for SM8750")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
