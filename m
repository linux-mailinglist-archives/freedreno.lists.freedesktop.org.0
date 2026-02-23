Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAD5IinknGn4LwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:35:05 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FBA17F9B2
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62D10E464;
	Mon, 23 Feb 2026 23:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOK/drvM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgAlsATH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C5310E464
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:35:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NI9tOS1860212
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R6iGiDMxzNBI4bYZtehCx374
 P/hdReWApjKdZoQePd0=; b=FOK/drvM3AUHpGVE37jxn3YFt3GaTFXREYGQ99Rn
 ZPHpoexrBNV+2eP3wnWeHWW0l3YrGuLntvP/KFKatfDbhojCU7EnJph8WVLm190L
 D/A8tQJwcyWNhITt+xeITJNSicFo0Sz6OSJVhFWPW1QoJvulrHOazyGBknq9QCLL
 7j48LiRqAOM3qNLK2pLCB0Xm7GuGpiKhjHj7+rsdNO7Bw6nAZlHo2/QPCsYcIV3+
 9qG4uEHLn50UYlb+QY+MkAHc3qJXV+yjQnGwBsTukaFfziq1VxjlVlkbxzrAfsoK
 1cLzgvuO5pF1ATCdbgloH62hGNhadXpgPp+4vg8OAZYjmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8s5af-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:35:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb413d0002so5313967585a.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 15:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771889700; x=1772494500;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R6iGiDMxzNBI4bYZtehCx374P/hdReWApjKdZoQePd0=;
 b=YgAlsATHH1yl0awJEZWbUtsoOUU6JuP3EEQXrLj5SlumhbTuzA+yymGHMGUCtcxvMl
 lNzEJHXvFTlvH3SxtxDqsYzcyi+QZVkS26VYHCykNK0dhjWX+4JmpQ60sHfD92atVanm
 RpF4sbSYENoF4XlXBIap1ZGq8MSn9Y5EB82SyD5vKBLiU1uvtRW/iCqajMj6kq/h8rFh
 JUNXFFYQr4wrVC0mHfPj4EueKHB0sCRoqef/0lUAWUmKXdy5m8Yg2nQg+17Z8/9PlnSW
 BKrULd4x5fsTntksYBuZGeGbBtd2AUUxrZns5Lm4YYQlN2RkPVBHQiNMgWVJWxfBXxif
 zWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771889700; x=1772494500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6iGiDMxzNBI4bYZtehCx374P/hdReWApjKdZoQePd0=;
 b=kRoKz7sR/Fy2VfPGDdkbhL9wUSP5yjbhTPQ40n7CLomKrTuiFImIZpMrTWdEwOXhXo
 sMojkEJiYdDhEeN7Vcp78sz62AJm75x/K46NL+nXK3hJptmm8DKcMha8/5wzr0dnsKLK
 rTylEe/a/WEG1N4cP8jDE2A1J/ebfWb+w5l9pVo8ADaSCLIHy8s+ErHSiscFKEs90vJG
 jkPIqwJ/cUyhCJBbAZOHsY6Up/WllS2EzcRSciNPYgY8aAsN5j2oSQ0O/+lmdecyWOoG
 w3MqzITjhPnki63Uz6YG46wdqKESYksZ3or0+yiMqPdUYbRQBHQ8cTdsTelqg/gkN91i
 silw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1TNdaqQZuZ4HfyuyuMRn9qdGBg9LUD+2fzFq4p99+SKlA4VxpM35N7dW7MC7+tmgIo+MKaNFzNV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoONo4NJdK+/NukIPNHl//MZLFK03h2G9xbNv2q0gn+g9teckn
 g1CRui1muEZHBhwKKot6LN3XR0/yvIN8kUw6e9ovqY7+MGw4IQVEnApWzCEeSW6nJiI1jB7htm1
 wHKxb60s8eO63EqVNlelAiGbSi6j8ozhMrhDp8w68d3AEyrnPVl9MuPPajbBGLtQ2UIgxkt8=
X-Gm-Gg: AZuq6aJWNDlKaE2MvVjFbQ2xOwhHVzR4qcvxiHZmH2nO7zIYKSb0x1r/42y4WXRj7eT
 0NXZAOEAum3IsobK+z47darVnRrlCq6PkASngB7vUY8U0NIyjgVdMP4d7lLM8gPCW9pwg0ETe7s
 gS8cCiYcf78pXcYLzZGArOuL2DMYPquxMl6MCxJg7O7IvSqliQ4eq7fdDeA/kWEw6c3mApwwCHr
 +t2mhOUdbd5KcWHrmHzTLsVH53k4ZxyptakoMKew46LrtlypqWkQyHJ/5yXq4dM9NBp7cxj1Mjs
 tzUaWQPlgbps67k6Noa3hEwW+YiCOJ+n9/U8iXkJZ7g+zhrOgXMxdOAQZ0SHYWt7ZuWDWDG9D9J
 +fTCT+/0TOZr4xiD0BhtaYUVWQl1W3YnTpT9xwYzKMKTjNxFWtUJsgF6uSDgV9SGoSfNEekl7SX
 XtDHlskUcgQsDDODESVCijPEkizxkWyCbX7GI=
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id
 af79cd13be357-8cb7be70d9cmr1716827485a.14.1771889700389; 
 Mon, 23 Feb 2026 15:35:00 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id
 af79cd13be357-8cb7be70d9cmr1716825285a.14.1771889699874; 
 Mon, 23 Feb 2026 15:34:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c600sm1876384e87.86.2026.02.23.15.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 15:34:59 -0800 (PST)
Date: Tue, 24 Feb 2026 01:34:57 +0200
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
Message-ID: <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214105145.105308-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: F3eakKLPr6NZ4RWhv7EIUss7j9-vB6YL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNSBTYWx0ZWRfX9QVypx8wtNmf
 /xdYiM6bRltRnsIWyik3IQ1wfNbBzUZGy2hL6g2nzCWqav6IPa6vffAEYqXGF/uDVAzjgYnkhVt
 JCz+fjogbADywMZMQk51VTHaPMxQErMxFw0hIU1t3eoFWrSWxDmQ92u9RuTP9kdQQfAPmB0nE6C
 cKGz+fSMZ+hC+UuOHDHSTQTunuKCJykfZLohRCVxlPXiwghPfLjlZMybRRy7SCnRoWJy1qDvlkW
 CGoTr73s2YgFQK9SrtGtVw2eMZUH6WvpEFXinmuhefPOZQXC9aHSE6gXI9ibYqL4J7sCBlVmwwV
 dNa6dpv3Urc+BfpynaRomoWWL+ElLz6eMWWi+tEQSQ5ERR8KCpCVHaEwa8rEpn1A0B1Vlnz1OGY
 RK56CA2xU+E/ogQcStKOwNL5vIRVIz/1p/W/46z14WhMhNV2S6Lkks0FVwsz+bdtn39GcW5xcNz
 Emj9ojZVbOOlwTwsvZw==
X-Proofpoint-GUID: F3eakKLPr6NZ4RWhv7EIUss7j9-vB6YL
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699ce425 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=BqgQB-vKev___VV0tjMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230205
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 87FBA17F9B2
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 06:51:28PM +0800, Pengyu Luo wrote:
> Recently, the hdisplay calculation is working for 3:1 compressed ratio
> only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
> use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
> can draw the conclusion by cross-comparing the calculation with the
> calculation in dsi_adjust_pclk_for_compression().
> 
> Since CMD mode does not use this, we can remove
> !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> 
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
Could you please point out, which platform / device are you using to
test this code?

-- 
With best wishes
Dmitry
