Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LrcD3HjnGn4LwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:32:01 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61817F848
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519B110E460;
	Mon, 23 Feb 2026 23:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV3LT70c";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrOQxfNw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142B310E460
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:31:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NJFXX13151846
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=; b=jV3LT70cFUxj/uMr
 8Ey/Xh2rL+iNxA+GPFKTaTLCnRZFL8R/2gzGZm6YwljL0ZdmR7+R56p4Hi6oGrqT
 8LXJg/u1AeFul6Xa2xMBrrOZf+LNL5QGbinBOlQCie7oQyaQzlPfqkY96xghSOoT
 14FEtvpo289C3O7tX0Y8l2KvDlULEGl19LPAGNsYaUd4kE/l5c4Fx+AJwLKf37Mn
 d6Cx0LDY7Z8NDV6P2NU5dsbJdtCns4PBnvXjQAmRq8W/SgGyS4nTfcCBaXp2ApXK
 73A32INRXWd44YuxzXwudyZjKEHkBQlV0cpsQlMptRnnk4I1yaS+Ppct50SSfqh0
 I6kHGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj89yfm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:31:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb6291d95aso3420294185a.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771889516; x=1772494316;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=;
 b=LrOQxfNwsgb/EmvqfeGS5zywt+gVbilhKtQmmbBHkxVQtnootZXwZgrSwywoqJjSm3
 pSZ9daPjVez6eK0osaxlHLBTozRpimivoHnvAVLSQY6eS4H17+X/zrsKTOyADBWTDXZN
 jZyqH1Ip86rQ00j6HlTiYY9dIGY8QJXdvM2LvKJGjf1aZQOINwFUb+LZpLTLWLmq4qh4
 ikn5k4MCd6X8vHCuAU2nM418dnv0VBYiYixOw7QW242O/HKKXRQAb7TLEsAZg/QAICH7
 00pCK+FQ0b3IPsTZlvU5ojfIXp+xZEAZhnWdi6c3n0xHYtKF9mFVjUCShgh7khwQRWs9
 nPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771889516; x=1772494316;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=;
 b=Nn4WACjUz2hc0/wsyJfVI0aQnZTNcdCWOHD+cNHxvE3T2w4f2qDBiVi54kKWk5MlR4
 pnVjRgq6IJHrvJFkHU6VhU0Wu7vZLAB9Ezfl3nV600BxIu/w/NRsHDmeiUBhLhrr4jA5
 ZEQj/rLrTixHUT4Hj9KKaTajmBGpORZeG8msGeP2oeXe2IPXLln0ftimsjFD+R6Z3jtt
 bJ3P5aLlxvck79egpVbzCo2FRcTROqkFYFbdUIaWiKtgIZFKLeIXZgVzCJY0cJORLazB
 ksMFAH3i92FkB1KmD9FGYgSzPiinq1LVbXK2VtzzCtsRzLG/MCMLUD4ZurhNy8FOqQc1
 bYIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURxYlCUW8Z1bbwaHnvygN1vBFUnvRN7l61jFx9UXLTRVtXW15L61Pr0Yl+k9LwB0jrSs5E/nS94Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwaxqbKwCr3gITgAc0xIJQZQnE+ORwFXqCLZiBJm3fpktOnCG0
 z7Eh5ourwGbz8gWrab0O08NEpt8f0tfcQBtHhUAyDd6Nyv5YsdzOwWbvbpfQXCiccusnruLv5tq
 xVyEyvZkNmP6j6uugWwocA7bEe34o4xkqgJXfxfCrahrKuNBCnI3ZIT2mf1/LyZvyQcakzk8=
X-Gm-Gg: AZuq6aJcPrwxCrRCWjQTNyBj7Bzio+gkRebvmSC1AYsGFW72lmGy3+AyUImstzzLuEP
 66Xxr2lFTUKf4bh5Aq2HVWCHeUq2o+sHBWs6UqnfeVk2PkJ7tjszsSYMcvrAqGg6/8rBQ5c+lOj
 /btvPy80GqM2eiS3Z4GRRhkLAteB6xNPOQN8Z8QCwAlqgS3x6HvumVPnz0mHtxpCQ3d7bmOdqMi
 FnY9D0pylDXp3A+iSFoDf/7k2UAMnZdqeWggQxeo8Qb7nTURiXkYUbRDrsWOkpaSbXsXCq1KJi+
 OVwAKhB4ocCZ9mKv30O2raV94xkjJyPF9zGcCjkGdwLovEiboCYLCsZj+n1v9hMkTFyz4fdLIWz
 6V2qYtNzwExFVMzjm9BYoezwnv6u2kBCjOGEePRasBjaz6oOxtMsbdgzfgOh9W9zNfGS3aA6x8Q
 lthUrEhRVrozUHNGM/IrU8WcnykarQFI/YLt4=
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id
 af79cd13be357-8cb8ca0a6ddmr1049864385a.30.1771889516519; 
 Mon, 23 Feb 2026 15:31:56 -0800 (PST)
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id
 af79cd13be357-8cb8ca0a6ddmr1049860585a.30.1771889515893; 
 Mon, 23 Feb 2026 15:31:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb0b8f0sm1809097e87.14.2026.02.23.15.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 15:31:54 -0800 (PST)
Date: Tue, 24 Feb 2026 01:31:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't use %pK through printk (again)
Message-ID: <r7n7bpgagciyln2iik2iybctzujyfrbqpxdynqv2saxapcmicw@yymbsq5ifhjh>
References: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNSBTYWx0ZWRfX4lufh7p431Fc
 6D8LqT/jKWDlzIELdzARmMEi7P4B5bXf0xeLYgvJrzx736qUnvTI9HTXuymRdy0PhMr1kxbJwM6
 07eAX91mV9dxs7zzXWCxeAu+BGui0BaGjtyHBC06Poav84UHvzQgNdjgy6vrljLdr4NKGEhczY2
 O/n78HHriNbkJsQtggqmoQExxRcZz1JZRiXuhVOQUd0+Y9uImFl8vWCVQRh5hNIYgJ/aqcZVL8U
 rxn78mGHBd1I6COV0XxbQJPCHC6OhwB27iUXeXyxW5JsMRojRQ+x6t2sG4drDQ8DRbzkVQKuSA6
 odOMqKiOpQV67hvwX9igqahl7dUxLKQsFqUOJsdTlkkigGytVGm34h/DP96fR+xAeVW1z7SpE6r
 WwL473I4CtbvaqvmmPOKhzMdNsIoaUckW/DoxNjeSugaxHf/I0FVGMFB2+TAD7aeRQvlkRKWwvA
 qmo5eG3ZUqa6zM1wpXQ==
X-Proofpoint-GUID: DQXDFHIXm3p04HxLq76e6lB2MyMN5Gwj
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699ce36d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=EcddL8Wb1xXwbACcv5wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DQXDFHIXm3p04HxLq76e6lB2MyMN5Gwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
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
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9C61817F848
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:16:55AM +0100, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> 
> This was previously fixed in this driver in commit 1ba9fbe40337
> ("drm/msm: Don't use %pK through printk") but an additional usage
> was reintroduced in commit 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC
> driver to provide GAMMA_LUT DRM property")
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
