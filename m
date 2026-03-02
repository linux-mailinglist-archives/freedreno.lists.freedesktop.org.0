Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHqfNZKDpWmxCwYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:33:22 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5196A1D8959
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E970110E4B8;
	Mon,  2 Mar 2026 12:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCBt9oSL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsgCqBPJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8FA10E4B6
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:33:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62294auJ3753080
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AHg8RT610JbVn0w1EKQT8kZU
 r3JvP/ohxZA8ve4jZUQ=; b=YCBt9oSL5zoZj0C0T9YxAN1+fOrGFZuoPcCH4Tb2
 FsC6K8v2e/QXbrSAktn7xXGnKbC5YttPcdGBZUb+gwmoZXq5GPMz+HRXB/X//lBC
 Q7mf4EOxQPty977WjuqcWHuojmdga0XOkk3wHc95Jax72Di2gjHcjCgyP69hd72N
 8Utp2cMxNeXoTeblvwvQDpN/73emTsEsLLetq1AaE6/el/4WhJgCfP60ToxxwoGo
 0cgPrkGeWfxTE1gMFvHDJdnVJz/P6Dri4b/Vmyt6XNojKBoXYe1hqJX7hh4RUzC6
 RhwUqRAokh8AXuqDq+GnT+UMWpNxjNzL4qHPeILZtjLOng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8pu3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:33:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3a129cd2so4090888285a.0
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772454798; x=1773059598;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AHg8RT610JbVn0w1EKQT8kZUr3JvP/ohxZA8ve4jZUQ=;
 b=YsgCqBPJVvEgYg+dl9+CoWqIi5vZbJmU5BViY/b0Y/7hpIt0mArWXOQZwChQE9KH4E
 Vu6VzRKSYrdoZFjTHbV6x/iFxhPzs5KO3/LHlo043Kx8Agrof555JfcqzRu7+WV83CMV
 RwTLkLCxS8obzN3AyudUVNLWaYXf1M9hbE9C2YSlLj86ecdFMQ9DrpLrpPX8/4+aWOpJ
 Jbi/KpmriPrG4afmNOTxD0kEiMAh/s+L0ClT80I0w2fi/c749xD38Oto5rUfMJIbeCyF
 kMX0vKXTQroS2M3/YghLaj5t9g5Tv8imS6qDHKCSQuB2Sakt4TSyw/0vpuEcVdrbl/pm
 QoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772454798; x=1773059598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AHg8RT610JbVn0w1EKQT8kZUr3JvP/ohxZA8ve4jZUQ=;
 b=Qh5ANdV/mFDhQqCJciu69QNQ2z4jxeILyVHj7UXXsG4sqRVEwVGQNpI7mRMXwuCLln
 r0mq+LIYcm50ijUR1+wn2jCGd+/K4TKr+eghR5SyrLpr3R5UCeniORC9uIhmbVOladd+
 qdqM2m3vFcvI4x75WT8jHCEvj+eQPo5XzGAKXhnJTQxnEaa0h1WMxvlyOiEzqbncq3pn
 fMvKto7/EleLB11oCT7M07R5LqwqfVto0iAXNNk8PHIsGS8Wgk1aROvSiJ7RSjcuU19/
 Qt92RLJUT4DGDbbwE8QNS3j2hqxk8dNYUzRd4ucxphILThRsayuuRAMxubJrroFwX8gI
 mtlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXDapCe9f4gZDVEfgoYrSECwWay276uMHzxArnqzXzlt8CC9WLMcxzEwbdYsYoXAOBFVx8WqM4BHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLdNrHWpMjoCdbccKw7sHordXhKpMCqy3n2QAJ4E04eWJ8tP3N
 5p0PqnUYH5QTn2JUpyr050T/9KXcotBuPKlhBBoWLh+lxVdL3iUbWNDsOUmD7lVG0fMd+yiKQ7J
 WZJpvFsg3uq9CeKQDL/VJpitdopLd+6xPHGKa+yshOtKzsPGxXqWcIw5UdovUePo16ZoQgTg=
X-Gm-Gg: ATEYQzzQ+eruj/g9iKJUXUs9GgcQgoJLxg6C51ffooB/mMbo5ucvg7B6/LJO+/+1m2T
 aP1sgbjqwrx/LyQxLdnkx2unQdKInixf7G1nn6PjGTE5f7gEqFuRPmpHpIIhH1ef+XNKHZIzoA3
 RcWgtkX2puN6dY6UByklaoX2FZULEAmfstnVAN/J+6Gq5pIRI0tsN1zHS/7jqCIf7/GMOe8i9Hy
 4wRC76CpUcQCGAgGeq5EvQpFbvsNA75lYjsctWJeKT8JTKjcpBNGPsirCaTDzighmxNfdLgQm+4
 PygPdzzWJv/1RYsfoWlmT5bmevFbMY7UNVuC5JQ8u5Q7TT0vkzreW5spCV2B9Hb1WiktGNmDgwP
 jCe2W2/UiIqxj+YZbb4PD5schd3MCUrak8lPyKRJtMR4vS9NtNn9SkdIax5Psm6qFcIJn5eg05G
 7vvGgduXlHneEeKPRYRrzSKmWvKCHCS6uutCE=
X-Received: by 2002:a05:620a:7115:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8cbbf4042cdmr1777237985a.39.1772454798579; 
 Mon, 02 Mar 2026 04:33:18 -0800 (PST)
X-Received: by 2002:a05:620a:7115:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8cbbf4042cdmr1777235185a.39.1772454798099; 
 Mon, 02 Mar 2026 04:33:18 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0dbsm1696744e87.41.2026.03.02.04.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 04:33:17 -0800 (PST)
Date: Mon, 2 Mar 2026 14:33:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Message-ID: <odvdqfomdfiyl34ftovpc4pfyrdhnol76qbufa32axpmsvvizb@c3oclvxz72am>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZbKDFi-haiDa9345-6wbXukeeZudLW9Q
X-Proofpoint-GUID: ZbKDFi-haiDa9345-6wbXukeeZudLW9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNSBTYWx0ZWRfXzfHU5kFDPdjK
 Be8iwl6y6XMX7HHK9H6KPpV2Pt0FmDuRmlUY/jqLEAmdfR6SiEQgkszAaOxTVjvDfRsjmyuupqe
 mofwmjxedS14IVo91HQ6e+0TVt2E50JK6olXPiOo+ae/iTVsZJgti/rFgsOXqbrXgh417Zxjc6F
 cayrVGweLv+ntmiSfY1baUgoo9kdUnKURY7+lYRxMF8p9cGxk7KonpoFpfsd8Kz/sPp188E7bA/
 9wQHhr2f6SNw28twcpkp1B1EuIykJ+dIZ+dlDP0IabyJD8q2iEQMv9+J4duuSC7usMRitATTP4N
 GJH/A28PU6CM7TeisJWuANDIgHxAh0bKcRag/IUrla21b7sZVxOftrLqSXb22jdOIbjVEbo3WVd
 o3LY2WKHk1YJrsUGUIADe7fmHglFxzqlGPIYvor5sGcAm6Q0xgnfjyRRoSxPamDInu42qqVuwQG
 U333rs+iPdp2GOGPHdg==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a5838f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=_P5vsXOTX-fIJvdZQ7wA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020105
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 5196A1D8959
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 12:58:42PM +0100, Konrad Dybcio wrote:
> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> > Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> > question revealed that it's not actually used by the DPU driver.
> > 
> > There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> > VBIF_NRT being used only for the offscreen rotator, a separate block
> > performing writeback operation with the optional 90 degree rotation.
> > This block will require a separate isntance of the DPU driver, and it is
> > not supported at this point.
> 
> (in case someone interested is reading this - patches welcome!)
> 
> > The only exception to that rule is MSM8996, where VBIF_NRT has also been
> > used for outputting all writeback data. The DPU driver don't support WB
> > on that platform and most likely will not in the close feature.
> 
> Unfortunately, it seems that way. Fortunately, it seems like it's indeed
> isolated to MSM8996.
> 
> This patchset is tearing out a lot of abstraction (which would only be
> useful for that SoC though) - if someone decides to work on it, do you
> think this should be effectively reverted, or should the NRT VBIF be
> instantiated in some other, more locallized way?

I think it should be added as a separate vbif_nrt, added and handled
without touching the main catalog. The main difference point, xin_id, is
still in place, it will be easy to add dpu_kms->vbif_nrt as a
first-class object (instead of forcing the complexity of
vbif[VBIF_MAX]). In such a case I'd prefer if calling code passes VBIF
directly to dpu_vbif_set_*() functions instead of passing the index (or
it might be easier to have a separate wrapper around those functions).

My opinion is that if something isn't applicable to 99% of cases, those
99% should not care about the remaining 1% usecase.

-- 
With best wishes
Dmitry
