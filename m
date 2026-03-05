Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLJHFE7WqGnpxgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 02:03:10 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768C209AC5
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 02:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C9F10E1A3;
	Thu,  5 Mar 2026 01:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVsloXWb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj81qIoq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C93010EADD
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 01:03:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624M8WlQ1203235
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 01:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=; b=nVsloXWbcDlLhmWP
 AIVxAIZTCaPKqPWFbLmsztin+3B6KZLLghogAv5IERj57XfRsQaQJw+Twy3v3CDF
 6u7ba1nJwJO9DETN/VFjO+DFp8DYRVlgEuSqlYfWGAEFYWAgTfJaphUG0IVLilFf
 tVLpXNUQRLDgIP1J68akD0ULrS8Gks3y4F69oxIiwRgjxltP2wTRsaW+PWbcFd2w
 ttnCY5EIBsPHJPMKSneZOWJBh7rFl4FjwIjvy4HK1K1FKmpuIkXRibsvVyKHTDWx
 N7bnMnReIrarm8cwBhbpWXAEJIsXEMoHsIW3fjIUSOUtN+t0tON1zp7wDcT6yssP
 fhlrMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c3bvd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 01:03:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb3b6b37d8so4198118485a.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 17:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772672586; x=1773277386;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=;
 b=Lj81qIoqZYoonDvQwBAWfw/QtUMjGNlSwPwRnNQnilxC4S8tQeVu933IQEfZ2n9kPE
 k0SXvmeOd9FumWFEVhCa83tyibvZz0CdnQzuejQl9eOSfX2TYuv4yLcQzJWdttIYuu5n
 ErRVdm5KlS16qhK6G60UTFXW21dZSfyHJze5W2oUAW4r7TYOe81qrNu2lB01MwX9NR7A
 cDIY6bRnsdl21ESvv4LJVnH1BTlVTtsnpguSZfEB+NDXdtrJs+U9BqJ1ysKYfjuusjBj
 h8z8u/YH18Yg8xLxiMMSQ3LShhk9FGiwyvGfMG+V0UWVw4WXeCEubn/wnjDc/Ilba5Aq
 5Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772672586; x=1773277386;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=;
 b=g29/OcqNZp8msT1ko42BVcB1rEj49tAHeW52EW5PUVdmKG1lW10ZZdJFSN3WKmgkZa
 coulT7xL0bPbNG+2QNB+Zzyfsh8CLGo0cb3liaDb1q3KgCJERbBtBztOYq6U3eXX4/Uw
 esfV1K4km8OcQqFC1z8ZTPjn8ICNY9+TvUCKj4eUA7U5RlRrz47RqofYTJ2XtysBTlhX
 D/nE3fkwdXRDO7/5/s2QJxU9gYbsKTGaOPUIvWo4ZJUlZhHPSJ3p5iwG7OvLAEBLn8bE
 O7e6rvRQKNOUKtViD5LFWlHXen1Qwx7NTlXQPLQeVaFx1dCocF/7NWtnvB2wZs9dRIKS
 gIoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJiZP5eAJPPsyKkhYE3jBxulhmahzOveqpLmKx21pcW8M/ilBtfHO35fl2UCyAN+gAP30SyR6fvyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHJAgAC9Z36RdlJ4LpBSdWMVZyMpdueQrayTmSZKLWf5I+wMCy
 Q8ySylKKyxHHcVvuFYILkv12mkQls+uxeQLFr/cK86m9/uaKILJUSwELMJ85Cn+Sg0qHNNIXvf4
 v1fqh6Ze0+/bMOOloi/TWsgiRjbJ06CG3OT61lY1UgSNA9xFt8ftb1c/GfKQ04dXIlPKDwL4=
X-Gm-Gg: ATEYQzzHuMxFZlyxrFtpp4F7LKKilVitpsUCwqQW/+ccEnr+aBN7EDtXm3O0ihu2pVl
 E59KPewBQQDQNP+4mJpcHdpbZKcvTtI6bhgSD7qcJluk4Zzj6O/V+hfROmGjChAmIyQsZPtsQwR
 g965L6xWYiemTs7aa5HrFfgwPw1h0DjJ1blik8wfnJ6L14l51nuJI8gvgxIroWlhnXeGkoiuRYJ
 8+43v18IA4ymQWjmGIFXErErZmLzzA5XAGQlpHX+680bAqlD3b+HIeAh1tPmWfhb0+uWFYsZfSD
 a7vcCoGmcAzZ171tuV+lBGyKPYSvkeoyhGPkdtBdVhGY7TEMcRigcBLnxnSAzz0al/y+zRVA/IO
 bU7FLPa/Ke8lMNlH6aYzbZRjjP8ZMVDpMOAUe9QBBqnSjdTt90bBPofwMmytFnTj6Sd85HjsiOr
 SgRiy7GfK7S4CoU5zWnSWIVrla5rqmyzWo3yQ=
X-Received: by 2002:a05:620a:f0e:b0:8cb:4cc2:c5d3 with SMTP id
 af79cd13be357-8cd5afc4322mr502515785a.73.1772672585536; 
 Wed, 04 Mar 2026 17:03:05 -0800 (PST)
X-Received: by 2002:a05:620a:f0e:b0:8cb:4cc2:c5d3 with SMTP id
 af79cd13be357-8cd5afc4322mr502510885a.73.1772672585079; 
 Wed, 04 Mar 2026 17:03:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12a6e4c01sm870585e87.1.2026.03.04.17.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 17:03:04 -0800 (PST)
Date: Thu, 5 Mar 2026 03:03:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
Message-ID: <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
 <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwNiBTYWx0ZWRfX1JCnAgxSuFD7
 WggSC0g/QwimTi77TQe9FDjnDHSmwLEBhGDMF2bQVtEtO8DzONj58ng30dcZER+jL9ebjbI6mBF
 H7S4mJ70WmFY46I6moRkb+KdpMoTXN6N++g5qlGl3miGq5dYKXzYcOla0P9U4PF93VI/mY1T/Pa
 Z2vC+0Yb8UH4b7BMrNsM5j/izmzGFC7gIj/UyrXha3pCMCHrb/9uscZtU4EsWIXs6Z0Q/3nohrT
 zfaQAizgqwXQwS6wSYNHzB4h4tkSUaImMikcGeLoRxv5954Efn7GAPL9nT10xmTz2U+fxVeb3So
 j2PoU6bfUIsjdRdmM4lOYwNCLAhy19zOt6jMRSMjP/okyInBjKg10iRd4oT1U8lLWIXpf7ZOzXt
 L9PhQvtT4w3J3BeZSt6NhhlVEjz4PXzWUHhmsY4JAaNURHYaIx8fZNd5KY0iYt+43uYI1qmJ8WP
 SrwuwNSwdCT+N2X6Tlw==
X-Proofpoint-GUID: ddUKDf0PrxzDwNSFohpkLP1KwRf8funn
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a8d64a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yEwdYLOYgBwwZM1KkmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ddUKDf0PrxzDwNSFohpkLP1KwRf8funn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050006
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
X-Rspamd-Queue-Id: 8768C209AC5
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
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 06:59:42AM -0800, Rob Clark wrote:
> On Wed, Mar 4, 2026 at 6:57 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Wed, Mar 4, 2026 at 5:34 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > > MSM KMS devices, pointing out the need to use dumb buffers, however dumb
> > > buffers should not be used by the GPU for rendering. Restore GEM-related
> > > IOCTLs for the KMS devices.
> > >
> > > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > > Note, here I assume that dumb buffers generally should not be used for
> > > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
> >
> > That is problematic in kmsro.. (but also unsure to what degree kmsro
> > ever got used "in production".. the x86 drivers don't use it.  Android
> > and chromeos didn't use it.  Etc.)
> 
> (also, allocate from the gpu render node)

I think Asahi and VC4 allocate buffers from the GPU node and then import
them on the render side, but unfortunately iMX IPU driver doesn't seem
to support PRIME_FD_TO_HANDLE.

-- 
With best wishes
Dmitry
