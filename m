Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL0EGXpRnWkBOgQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 08:21:30 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90758182EF3
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 08:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264C810E1BC;
	Tue, 24 Feb 2026 07:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0um4hiQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNylmYdh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF15110E1BC
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 07:21:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4LRVc1753765
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 07:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T0ptxbfQatTrOVAO/G28RkpobXhVGO3y8VIrk+NY+II=; b=p0um4hiQGFIsrSen
 Fsinht2Gp0vYw/rT2BAbNhJpIS6lfTtT1rI/+dW63BPNydZWtn1te601AGv/Cs10
 4fma4O/52lXyrLm9ksaLWhEyADj/U5a7Ov0PC7mJ/v8oXHMbOvHFbeUzlbet0yOj
 +p8ZhVEnu7kbg4ynfyrew+gQ+bCCeRWYPWmTLWPQ2rWqAF96+YehuVgXITKyX+xm
 7JtqxmOkqyni0k4hu8554rAE3nwVOCG47AUg5mzOK3ZVItfhzFTnNywsJPEiWgVM
 6ncBFrx0GTgwN2cg1MX9Mw+lxOY+2bjcyktaP4qHb7pXKT5ir5n8ORNr4+hts1va
 ZT9lyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81bb9y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 07:21:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb37db8b79so2740814385a.3
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771917685; x=1772522485;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T0ptxbfQatTrOVAO/G28RkpobXhVGO3y8VIrk+NY+II=;
 b=YNylmYdhviU/xkS6mVhoSCrN8J9Ax3fgq0Te4iJVRTukL45omSnNpE7fJV/ib4/fQ7
 8CWox/8uy21Q4KQPBPeojN7Q0RvKhol2V4fJWjVAjeQMcdVWs1HLAehXBRtALuI0wJTr
 ZQ/ZEDEdNPYC7nMm0MIENo3kFpW4aC/QCvpbE/R2GGe/3573M006w0WJPAQqwZjFWCUu
 ujHZehH9IaoytH3FVdEj+sZz5lxupGIU72QOpW8vSXzVK67wEezCRwACaa2wQSWx4K7K
 IheKCswlWwdQ7FQ1UAzvLT3Cwt4r7SCxHD6z0cCjzLCFJAitfFfDIDB3CVhrB6j6p3NY
 Nj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771917685; x=1772522485;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T0ptxbfQatTrOVAO/G28RkpobXhVGO3y8VIrk+NY+II=;
 b=KFZKAgXIi4WvSwY9DjMDpQR3rNpTTZQsaRZa0pqM5MXxJhu7oyZrmSBxMi9Ek6fTdR
 dinBxaoESgIEpw01XgyIv4enM9ol7Klp37Zf69DAvrJ6e+xveVfbUcQ2YAHs/cJJxsid
 7htoYOhyZUc4+vIDx56NDBIHHSetWDUL8Drl0lZhB3dTxZunbx0ORODabSa0gj4SYMTH
 vdlfV4T0gXXbK4Uc9vJHRtsaeb/KrfcfNv1Vb2pKbeHYyIDvDtxatIjZHU3XqCiJjOCZ
 UY5myTEMW0aFzBbJfKeB2da5u9jvYhc5Og4WsNV7dyzp0j5sKI1Xh+Dbge3qMmtNC4SK
 6CkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMndMz3iGz+itgorbn9KCF8cDn3CaD3chDel7N9YQKRoOp0CT8RVG0k9pnuN604xr54vPJl5eu1ZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw3xgH5itY6eyOGJz3ox4YaU+4KAVcolTVYlj/i6FfotnHb2WJ
 YvBjkRmSh3sD57G0g/pKcQCo3WQ/uNkW5LGj0SmQu4i27q0b+b9s9gPHS0+zIroKaL0Ewwz/S1h
 1RH1WY7ByPRLoWao4cMl3AsMGMCjEJSf94KGW7gwJTbXbxOFLT27HCapXpaYoobcs/YWwgxg=
X-Gm-Gg: AZuq6aI2MR9B+rFMZdFLCZIxeUB1JP7K1RGQ/bYmxk5Natc76Jg+1k6kX1r3jWSoP/C
 ZAfqxagzuV4CyfuidP55LBwR6We7Fx1bPR6GVYqYaz+7O+CuSW4d5Styobf1q2m8cUY+nTkob95
 /1LcSnrRvT8UmluvscSlrhJFNJJPkQvvYu6VVkIuJ96o9Jx7Eshg5zN3NuupUsuyoT2iZJyparo
 GpkJRVtC4ocnq27bEhD7MocWBXtDrASvTzAR3SolAxuG3y41AwazqqR02hLctYxywJs1vgFO/7v
 oOQPJFks7eInOaAfmQ0mWU3OgQ/ua626iWeOuBT89OiOA+gBlIVhdxiYPHEJK8GubWkQMePibil
 ipdMZY0B+INPx81w2ItW0+zDA35k6aCqbwu59PxrtrkwmJ/1OAHaL5JiOsmsuiu/f0G61BwObZC
 nM6w5KtusP8g8HrELwg1NV/ZAlbw/t6lnymN0=
X-Received: by 2002:a05:620a:46a4:b0:8c7:c25:9e53 with SMTP id
 af79cd13be357-8cb8ca75f46mr1336074685a.59.1771917684844; 
 Mon, 23 Feb 2026 23:21:24 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8c7:c25:9e53 with SMTP id
 af79cd13be357-8cb8ca75f46mr1336072385a.59.1771917684306; 
 Mon, 23 Feb 2026 23:21:24 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb45ba7sm2033409e87.70.2026.02.23.23.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 23:21:23 -0800 (PST)
Date: Tue, 24 Feb 2026 09:21:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
Message-ID: <y5rgrdq7caj7kii66qchgo2rfhg3hassku7xrjhod6l5kvxqlb@mnpnvivntcuj>
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
 <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
 <CAH2e8h5_iBk5eiOpBi8yTa24LGNCxutA3HX72dKazKGo=XK61w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h5_iBk5eiOpBi8yTa24LGNCxutA3HX72dKazKGo=XK61w@mail.gmail.com>
X-Proofpoint-GUID: 0JnarrQC7J8rybs7fiG3QigD9aQZSmhx
X-Proofpoint-ORIG-GUID: 0JnarrQC7J8rybs7fiG3QigD9aQZSmhx
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d5175 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=02btdveoW1BI-Tfr630A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2MiBTYWx0ZWRfX6v+F8JSArh60
 OwyUGAWUS0YrTOApO0tLUcfWYb3/KzdunyJy46gNqWlQJRFmK8EwVKHCUeVASlnnAtQoPulE3Wq
 o9N12ZOqPBn1lZ2eT2qTC6ttVSpkK+NuL9JrdHIeDjlwcyksDrdQBxjJTzYUeaiyBfkin+EBhBt
 1EzSoEzo1ZYeBLTal2vSK6LMwFiFP3cI5SNhhagzolFnopZmY5YRSvCxriSpbPFp65Rax28GvvN
 GDTAa78GB6xKhsxORxPQsPKMmoG+YaTPCPbEW0nm92YjeHgaLdAiNlUD/qMWhRHSC5fsrqqJBbV
 ehph4ofUnzbaM15p+3hVInaes5wKWjnZ+bQ3x3d7agwSEFB6ADsWydNGf5s4WGqyb7WZVbiKuss
 3m5OV90FKhTDzuwaZB3DrIRUMuFtKTS2jGAILWI2vEBOyivmwP4jrjvXqLDu2AjKR2pzeX0CXmr
 wkklUMmJsOLSRTWzi+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240062
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 90758182EF3
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 02:34:28PM +0800, Pengyu Luo wrote:
> On Tue, Feb 24, 2026 at 7:35 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Feb 14, 2026 at 06:51:28PM +0800, Pengyu Luo wrote:
> > > Recently, the hdisplay calculation is working for 3:1 compressed ratio
> > > only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
> > > use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
> > > can draw the conclusion by cross-comparing the calculation with the
> > > calculation in dsi_adjust_pclk_for_compression().
> > >
> > > Since CMD mode does not use this, we can remove
> > > !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> > >
> > > Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
> > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > >
> > Could you please point out, which platform / device are you using to
> > test this code?
> >
> Hi, Dmitry.
> 
> I was using Lenovo Yoga Tab Plus(sm8650), it is equipped with a
> native 10-bit panel, the resolution is 2944 x 1840.
> 
> I am using Lenovo Legion Y700 Gen4(sm8750), it is equipped with a
> native 10-bit panel too, the resolution is 1904 x 3040.
> 
> I witnessed that the DSI_ACTIVE_H_END bits in REG_DSI_ACTIVE_H are wrong.
> For Y700 (panel in 8 dsc bpp and 10 bpc mode)
> Upstream: 0x015e0020
> 0x015e - 0x0020 = 318 = DIV_ROUND_UP(1904 / 2 * 8,  24)
> Downstream: 0x011e0020
> 0x011e - 0x0020 = 254 = DIV_ROUND_UP(1904 / 2 * 8,  30)
> 
> dsi_adjust_pclk_for_compression() did:
> new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>                             dsc->bits_per_component * 3);
> new_hdisplay will be halved later for bonded dsi.

Ack, thanks.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Original calculation must be wrong, though it is unused. We can refer
> to the downstream too.
> 
> Addition: To support 10-bit for dsi, more fixes are required. e.g.
> programming VID_DST_FORMAT_RGB101010 into REG_DSI_VID_CFG0
> adding MIPI_DSI_FMT_RGB101010 and bpp conversion into drm mipi dsi
> fixing DSC RC parameters? Recently DRM_DSC_1_1_PRE_SCR is hardcoded
> etc.
> 
> I just brought up the panel in 8 dsc bpp and 8 bpc mode. I will try
> 8 dsc bpp and 10 bpc mode after a while.
> 
> Best wishes,
> Pengyu

-- 
With best wishes
Dmitry
