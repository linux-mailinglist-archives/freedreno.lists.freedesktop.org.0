Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFkpHJW9fWnmTQIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 31 Jan 2026 09:30:13 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D1C1416
	for <lists+freedreno@lfdr.de>; Sat, 31 Jan 2026 09:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2CB10E39B;
	Sat, 31 Jan 2026 08:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2QJv/Ro";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHuwabT1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6910E39F
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 08:30:09 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60V4UEv1447384
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 08:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ufXJQD9GBYFDKvoyoQAHCQdu
 6g2pHLom6Qi1xTuFWBw=; b=f2QJv/Ro0/gHpr4P2Xv+gIpbUnf0BZt19QHen1iX
 zWHxUnWQ/Kkxk5bzOoUogCZyKH8WU+0uCAhcAQUtu2CqoOxj9sznVoS59l+wZpd1
 IJTe4l6ha6Xf+DgBer2L2ycij+vMw+Cp8MzzlUJtMLGzlXYi5fZBiLbtfeS9iy92
 u6fzcIJ1rN5Xa/j7Fp6627xnrTHWkwJBnSlB3u2GtUFqLtr5KUpNOTsJZwxRkAPd
 uLvOZ1YWpa04+EkHcVn5acVD86PNsoHhxlCMqz3fmvBE5xIIXvH+4xqQfRPaM1Ua
 TtdBKcIg/iHSpv8o4gZPQEDpBkQUtuQYAdwNDnAOPZIvbA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrrg1c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 08:30:08 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-93f57d3a1acso8931540241.0
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 00:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769848207; x=1770453007;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ufXJQD9GBYFDKvoyoQAHCQdu6g2pHLom6Qi1xTuFWBw=;
 b=dHuwabT1qknyXNCz/WH6ebgxxIfr5HRCMeH5ppSKIZSIt1V/UHLX3mSQExTXX4BVd/
 w4NeJTkv9SPEUd8DMG+H//pzdK7yQ6CNv3odJ6se+6N7H6Oef1crUEIFi2yrVyeLUB+z
 j6C/L5YpzQwvd7SeRpbN513ko9avrdbFNfFr2Z29wICo4GyWQuQ8Q+wdCeM97kYClzAC
 IgaoGFpEXulZURfsb5HaJhd1Ywa2no2SEbkGZ7qPOqUrRCONvdsfdT66zfXxJo3otZAf
 EZXGLKjxL87HmWFY153RiYdJbAMmXxHVK4nlz2dEBXMhKnT6SaO8bbUlyTF4kKVWt5St
 sPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769848207; x=1770453007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufXJQD9GBYFDKvoyoQAHCQdu6g2pHLom6Qi1xTuFWBw=;
 b=jax5S0R/CH97uXvue0jyGYXAYD/XP15XYTSP8427VJDwZtDSMiPzSmaMRHj1rH4kCZ
 De7I4EyQfNAUL+QKPhy71tuVcDV8/Q1TfvYoaxzij50h/k/XGEK3s1SPl0ev00vQDmnz
 k0XalaE17ZbAWkk4jtmL67odGvQwL0Lznef1UE8S8LOrq2Fv/3q8unk05o+0mrSCNFvt
 29vrDmOayxi1NVip/lzpFIFOoVI/lZF/cUzUxXNA8esbYDi+U9MEZhdgUa44gh/kuOTH
 /nFv/Yzb85cp5VGnzvKE4H1e4GbQZL5R3WvrsSp06Iu3zQBgqjtTI3o1hbdYQF70R/a1
 R8mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ1y93vi8icFMtiRaZD5dL4PCDntsvWElt2zotGYScijzyIZoRYNKx4DYUTU2ad/c9rc35d3AYbFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwUq7wvAIMGEKF61BlU1Z9ZfgcSl3HMc35SOKdtilY9LnJC65a
 8AM6jRvxmNOS1fV37sgxBZy064l6TWAnHYBgysB96vDppBGdhngoRpAh2cGH9jKvCAbgQEZpbAG
 7gzGKaGOBa7zwNoAYe7krRTPq6UoFNlusaQZ9ETu8MhH8+mtUDy16v4LN7uaEk+PZlYH1/hQ=
X-Gm-Gg: AZuq6aKkz3uTTBz1Zk8qKRb8UvoUyHOCYDsCW/OV4PVeB/axHFOXa3vUTY1hyUdSfwQ
 dMf7gA6JyixuCvfcFHORR0J8Bo7b3xjDmo4Drk0dx6iSqlfCeB4hSEiBw+hQU4RGXf5MD+na2NM
 ToACgshq4FRnzSRuUyslh6jlT5Dlj4/5gFMgqr9GjRX3M5XGmpCuTQAhXpy2Nn1eNMnGlE2YmZR
 TJB/FRD9sbyBK5dC3BRVSrIGv8Ohepa6wDAgZTG9oKo9ljV1hlrt30EfNKIybJskrHgLyzu7Ogi
 s/Ogxc7MurPhoI3JF1N8s0OkOUlqtWhgm51wCSLxZNn/3Somm/1/O/wueX+TyP/Ysk9v8ai104t
 unQtT2+Xvvnbs0Vuv7z4wMkq+2sF4imFoEt0qE50/3JOQtI9gr9mCv1xdpApkrQk2V21eU4ECsQ
 jz6Q5MgI+Cn3eQnYPB7d1KqMA=
X-Received: by 2002:a05:6102:c93:b0:5ee:a76a:8513 with SMTP id
 ada2fe7eead31-5f8e265ee7cmr2080905137.33.1769848207484; 
 Sat, 31 Jan 2026 00:30:07 -0800 (PST)
X-Received: by 2002:a05:6102:c93:b0:5ee:a76a:8513 with SMTP id
 ada2fe7eead31-5f8e265ee7cmr2080885137.33.1769848206973; 
 Sat, 31 Jan 2026 00:30:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074bbf55sm2300983e87.90.2026.01.31.00.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 00:30:06 -0800 (PST)
Date: Sat, 31 Jan 2026 10:30:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <iypev74zzv6l2ydzm3r5jfk6qabf45ujyhenxsyijegpcghwji@vpozmiehe65y>
References: <20260129024919.30449-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129024919.30449-1-sunliming@linux.dev>
X-Proofpoint-ORIG-GUID: XtwWXJ_TdXvMshnBqEfS9ufG5rRwlaYk
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697dbd90 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s1uS2ZYBl9SNm-zYMqYA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OSBTYWx0ZWRfX+xQXfva1Vy4u
 +vumLZ2DLLrwFyZLcxN5c/i/wX1X2kg2caS67360GnctBdAtxbUSxTH9Nbd7hFifY5FSseCY90h
 llw/DuNe00m2x6REnxhDxAfgQf34km/6Kqv4Ldg55GIzUApKLQd6fq1SuSW9aniex1h8CbJXL8J
 B4/R2eRptTyPtrQsuLDY+1Ip13Qj9AMUuxsSflpa+sHvl2eM2doxOLYL4RRaDuCgWslia8mIerc
 Q4Y4hLTlYsASbwonLWql2RMJI7irHvCUcPB4SCaWn7tXLo+EJ/7lagH0YW4FE9B8ZfiAJOD1Y+w
 MI50Jx3DkfXo6JIBNcixopQGPlQHNGauJDV8hWMzfT3JmI6xhqA0kAoi75Lk5x3Eqm1IwhTQwec
 feIPqr5ubPh9oD0Niu300i+gki43edM7H5HacrupLnl6KdDN6vnfqHe7zIFx9OqLuGclNbOfCNC
 t+slGCoboTE6b6tGJLw==
X-Proofpoint-GUID: XtwWXJ_TdXvMshnBqEfS9ufG5rRwlaYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310069
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,kylinos.cn:email,intel.com:email]
X-Rspamd-Queue-Id: 217D1C1416
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:49:19AM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>

Closes? (you can just reply to this email with the Closes: line and the
URL for the LKP report).

> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
