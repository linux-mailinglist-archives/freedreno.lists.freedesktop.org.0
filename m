Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /mzpITECh2mQSwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Feb 2026 10:13:21 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B8E105494
	for <lists+freedreno@lfdr.de>; Sat, 07 Feb 2026 10:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FB010E034;
	Sat,  7 Feb 2026 09:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb5Yoqmw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+EQjD5S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABCC10E18B
 for <freedreno@lists.freedesktop.org>; Sat,  7 Feb 2026 09:13:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6174dW8h2495083
 for <freedreno@lists.freedesktop.org>; Sat, 7 Feb 2026 09:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZnhPfRcyvXmJuJSiZfwzyHe7
 jzBv7YRscb6FfNKJ8LI=; b=pb5YoqmwIkiTWV4BTcm1MMbKPi8Nhj8aVVJ9cG0V
 76vEeGsPWhJQvNxzHJ8PWKegr7VI+D3ohps176Htydpl7W7TIpa6xyJuwzx77CKv
 7lnMXr+R44bt00GQQDerJ6tRzTxjKffxtBjdfvazdUICpCLw/lmUx+i/1ZbFBHBN
 SbPYC+3vvn2mIanSL520174D1KMTlY6eWyOP8BvojNVLWmLI2A9V7Y8RQy+Mh5ly
 A35LSKrwrNt2j7/oKzG/S8CON1vrgh2BEasO410oXbLnL2+rkOSK113dj+8wQpnz
 1OgG7trhbL4JNF077BfOwHlDF6vf9/RYVwJ4hWnIUF0QcQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xjg8ch3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 07 Feb 2026 09:13:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-894971e3b60so86035146d6.2
 for <freedreno@lists.freedesktop.org>; Sat, 07 Feb 2026 01:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770455596; x=1771060396;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnhPfRcyvXmJuJSiZfwzyHe7jzBv7YRscb6FfNKJ8LI=;
 b=h+EQjD5SVJaE7DWdLxdly1/6oVpVoRHT1P2SNJ+mSHj6YN42+JkA1972p+CdG8R7OT
 bfL2onXrNz4O0M0hXPcYyt0j4rqauHJiLWbR+BXOUOa+uG9LFare5/kcpcYlmgs98UC9
 HaajIcbPyu/R7/F/FvXpoJyTwSQHEgS9q+lq40j4ZsZiMU5QKS80TvtXlzfLOaUguR0e
 U8NST51mrTvFAfAuOYQoy4WsQkvWFgWy7a3YkdnbM5zsHdSWXkZaOtZl1DmGKoacYTdE
 FZ2ejTbMALW+EETueZdf9UPCEpiHqSxcgUAoPI8wQtv4OlNFsrNzFgA4NHbUqMgCe1z/
 6OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770455596; x=1771060396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnhPfRcyvXmJuJSiZfwzyHe7jzBv7YRscb6FfNKJ8LI=;
 b=sn2TWx6fVQ12LQneWMIkObddEVQXRwnROvksUYF/HTZFRe/RvyyF2kIKM5LqcTeJoR
 cWB9HGUpc6kt7tk9BnD0C3xPpYpw0iCiPdBSsaGXbjaby3YmhwvIImNVE0fY5h7CDmbq
 ylsaelvRt1YM6Y2wCrbV/oL4NHiS8QCTB6xSxlfcXT9Ul1CCZVqHlUr8xfUts+zl3UlM
 ofJF2WblB4PPTsc+gosc/0S2Qjv1+B+SQY3BxPrObz/R+O4ztwYxnb2v1vzxpjNYTJft
 jW9Cbs1TDABdpwZ/3Ebdb/CN6nNOFTscts+s+83mCk59jnbsOGVdDE39vGRiT4FBLCCD
 pVRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKO3nnN2ODk+piEurJyt009kBUecqTgfM46LFHZYxio1bnqqMEhMUvAVzvj1nrxfyNLp/JX3KvYxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiLd+M/SX68jZxvvghHBzAhmLAA7Juiv04oZepSoTHTspiCCP8
 6I//7LNvretxAb/77sLRqDQ63ox9QD9AN9WGWsG2M8Nb5XQFTjtZDMJ4I0ayZseHVCrM/ZTnjtN
 zKTIqcw+vG1xzKJ0xuy6AaAEjfsAJaEE1wmkS8SkrYkxQH4C41zng5W6leJQKfWNMpnBfGf0=
X-Gm-Gg: AZuq6aKKJmcGIW5If6sKgQESfqx25hoq+R1hb0x5h5EHI8Z54sRpC5K28jiZ7BrJN6a
 3y1IdNrjtnb5SqahAYMN5lALxXLCh9XRpSgYZ+gTamyqfZXl5VQkGOva2CKiOyNATTld4ThVe9k
 Xbx7Sh4c9RCbjtjFoWT5cvvRypVLcXz2YqADPLIyx13M+aaRERpGLUn1prQAbmhWaecc18cd15B
 PijsBKxmr2K+h8lLiipEgCGmFf2+b+GwRvba8Y0ycV3uJyMlzs9So+M/52Kd+/Nublx+5TO7ptB
 asUOo0Ygm+IcmQrFKmbzTXQ9pCBWrjRmt5HcMXq25yuCbIs9t2b7izLuydpeO6in5579U5mwnNF
 ZcYh3UwXh6hDTFgra5uWzMytlCq40RBanKj07G1VaNIZfPxcc6vQlkCeTpGGPRDwIGCHGBwH+dl
 ms9QSmhayn+F4K/ijKL0km2So=
X-Received: by 2002:ad4:5dc2:0:b0:896:17e6:b3d7 with SMTP id
 6a1803df08f44-89617e6b59dmr1404086d6.68.1770455596442; 
 Sat, 07 Feb 2026 01:13:16 -0800 (PST)
X-Received: by 2002:ad4:5dc2:0:b0:896:17e6:b3d7 with SMTP id
 6a1803df08f44-89617e6b59dmr1403876d6.68.1770455595931; 
 Sat, 07 Feb 2026 01:13:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-386b63adc3fsm10918031fa.26.2026.02.07.01.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 01:13:13 -0800 (PST)
Date: Sat, 7 Feb 2026 11:13:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kees Cook <kees@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate()
 allocation type
Message-ID: <734wzdoihl2qn4lu4inig5taw5n2aovabpce5y27qb5kiftnwh@ynnugouvaran>
References: <20260206222151.work.016-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206222151.work.016-kees@kernel.org>
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=6987022d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8
 a=parfbKQTulTwLggSwN0A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: b-126DTEz-I93uZN1e5Hf9BbeMCbVnnp
X-Proofpoint-GUID: b-126DTEz-I93uZN1e5Hf9BbeMCbVnnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MSBTYWx0ZWRfX42BVnlVeuHti
 TDWtwkph0TkBwqzzW2/tCIvq19gpa4v6kbxb+HMGkUTf7CQ8yHTZzruuCvdM5H/m+csZZYpc1il
 u+yDivkib0D0NOtSVgpJvjm/6WO9/s3ZO+2Uz9xphOuhWEzViEMaiT+w7YPqOFe9otS49o9BiXU
 zNY+V6pW+TUx1vCKEsB/eqlwqmYKsSAqCBrQgEWtpw2VUC0G2fofZfxFdlad1gfiUuGuGaNzBXt
 +v7+zCnevT5hvBLTe717aIbn+R8/ttlUBkl/07/qkSStXdTjsDV/yC8Bvw+mPaVZ6N7tPp2CFjQ
 IfFeFyx81RmbFnXCSPRrfXYceeIfby1jOnMRzk+KyisJ4UUAv9Y3WoskHxEk5Tw0u2rZsfqbRn/
 7LTfT+7sLOwmMWyMF7nHJt6AtqB2e8KWcf0HQIhqjLR7a76G3Ai2YqIP8LzZLacHKy057Q/mhjy
 UDpuxwRXWZXZEGlrFCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070071
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 91B8E105494
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:21:52PM -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "void **" but the returned type will be "void ***".
> These are the same allocation size (pointer size), but the types do not
> match. Adjust the allocation type to match the assignment.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: <freedreno@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
