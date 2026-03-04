Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDpeA/NIqGlOrwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 16:00:03 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F32021C3
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 15:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3F010EA38;
	Wed,  4 Mar 2026 14:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6CBpzz7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBvBKHod";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F5510EA37
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 14:59:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624E0aMJ029424
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=; b=J6
 CBpzz729j7YRvYSk83icgykoKjI4sE96+e13QscHSGYJAx5n9Aq0k9uPMIgmnX6J
 J2skZuiD6e9YAECGdIWa48nkKTXWIBE0w9ynxD04dv7x2Pn9kvzqIFyqDEywG8Vi
 sZSulTmcwwVdeO2KRTODYesyS1BNvMlT/RAHwHDO23HtzYsxVZ4s2IWKtoJJ5yhx
 fm8kJ5fqUC/D0P1QTS2KBvx9UymSIKJc5qJr4OMnJf8zT/Vl4gnAOS6syQ4VSLBR
 unGbvR4BY/W5CBsg9bpWuHhGNEBMJtI4cWcFXgdfaKv1ufHx2ywTWaZg7WO3WuZh
 lcsrpChIcKOqxt294tRQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fg60u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 14:59:55 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7d4d668425dso75619783a34.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 06:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636395; cv=none;
 d=google.com; s=arc-20240605;
 b=d3oJSTisg1OxnoVPAELNZgmCVS1ojT9S8ocvuh5/WRM2jbroD3j9A7TniibxtyFlYv
 gK2WdqZaYf3UwdD0q9IpB4mvrfzKp/PRiodh2DGhZvA5iTChy8gV9XrbAkZ03ejmxqTG
 bn4QuUPl3Gh+ib7/Mlqa38uRDZWuhmMXvRbwBiFwj5ZgWgnPHt0TuKfTS0cAE7TBlRXZ
 WsWPSIAoGdXo2jk8jTE526MMjL96sTY4zNB/b84kMjDeEagHuPQBcD4EeJv8lBA6S6J4
 ZyDkg4I/ty30dbWlH3DNP53h+q7G2qe8Ecs+ehHbTxPOKrWeskypuBEYulUzmOxk8coS
 57qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
 fh=ZASoFHKA4ber52g+TzmH9V1L4gOXiHkN/zmXhXhqKyM=;
 b=HYi3LFzpDn0iTH/r3+A0RKYe4RkSh5CdCq3ga3EIHXpS+H+FuuRyL+LcfuuHtjOtxa
 dks36JyGPL/jPQ2MMEj4HSjIT+LuUQHjp4g7F91g05ZhUWnlH0K/lQWgHdtJI2JDOyYW
 u4WDZ1wMflFFD9OUZaL0SujgUIxPlWMQ3CqGxaPe2eL0LlkKV1SDu7dZZhlFIhdAXw0r
 xBexK54/U+DBqgrMMfdZqqiUmlResOE/M2lwy5yX+m4ql6EvVVjjWeSN96ZZjGAWdlsI
 J1TlYmXYJvyANYQhRPG+blHZSsL/Edw+5EINFgbhj7YwEfK8BPoVgvFMRBwKZXN9f6Bs
 NmSQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772636395; x=1773241195;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
 b=EBvBKHodchrvDPNSx/FoDM06gdAOgf72D2kCsQofwc0meARq4GR5gECcm9uVN49dSE
 s7v/Xzj8PQtORT0ZEJrN+aYaXO1FdgT7FciNRxAAU3s+NYSWXjoqqbCiyhmchZpPdnpD
 nFFNkGx1EJzAElBQp1Jah0cOa+XuD+DwSTZ+4ZGlpOXX13S7yBHxks4XWkYklfuUPtGp
 ggPj1dh5cD2JwLXUywfhGN6JfGo3kdpkzprK1Va160Fb1NCuz0GXYgm/+aqChsDwH61S
 SrtL9WTyJHWTd8u46e7T/yBKQmZ7KPV2cwrdM4eIY7/WXMAQfwcIRltTsMALUE91qVhl
 P+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772636395; x=1773241195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
 b=VkXa7ALCtfZerevEbyRfEHMLTfbwnKvgY96XEen5HUpjWMwP9UOrqg3bWqZkHr5FMD
 iUiPbFv+M7h8y/qi44eQt4PFFaZMfT2OSJfZaccZgHw7HXgClu2CBxhxKGslZoAewHvF
 i9AuWH1YJFE3a0z9Cv8Ri7xZuyOxSzCV6xx0flK7oxm+QqcnLpnZbD8tt74mfyKPqF6x
 yCdax2CvvP3+mo7TmwnZQ0OKwfD19MBB2FsFoTLXikckoNlqMeAhdQVrMi83FWHjRjzD
 OwYBbungHnSPLEyHhwrCSrK19+PljgtCpCJMLGyAW4dbHbtfHyzJ2/CLKw01F4UauLnp
 aI5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXczM7ErfEHCHfHz7YqXWGxcQJ0SyFkhbQU82KrbenSuGfWd85Ihj2Ipzf8eIv5urgM1QM49OsKVwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQMIV05NrDLllXXLYs55MDrsgstflyg/fzu23OpVVRweniawuK
 4a1HjpgrnWN1m0dSX0ZJNb2JWLynxpnOugFbv6xRjmB/KecLysR0nNytJCpKdEieH/6QVfEA/Ar
 pNmf2XsGULR9/Bqa9elQBPKoRApIu5deh+jKj1d8lA+WzNecdgjIygjvvipgAqEoCW4KxgEYVif
 c1cuc7bV4C0Bu91P9S5SssyB8puVzKhP6KDJi1vN33w5KBRA==
X-Gm-Gg: ATEYQzwRI8Lt//2a7seuZXzb141wv4cjybqLWT4uCEmnu0ydLosRYIHLgobYfnZiVHE
 T84pkkuWo0BEnh/I5wKUyomyTfk1ZOIM/S45oNzsKq8aUHVjb0Olk/wHeKK43wL7qzJsBenpw7x
 3qFCu7ax7N9hRUQL4yhc5cLfXLxyIidDu5GufD7oYIf0+7rl+LomWzm+1dYcE4XMoJ5oc5SpO+i
 mSjpCZFVNUJjr8dxe8Jci1H60vi266ZKtFE3Q==
X-Received: by 2002:a05:6830:4709:b0:7cf:d819:a2d2 with SMTP id
 46e09a7af769-7d6d38f9de4mr1354763a34.31.1772636395015; 
 Wed, 04 Mar 2026 06:59:55 -0800 (PST)
X-Received: by 2002:a05:6830:4709:b0:7cf:d819:a2d2 with SMTP id
 46e09a7af769-7d6d38f9de4mr1354741a34.31.1772636394669; Wed, 04 Mar 2026
 06:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
In-Reply-To: <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 06:59:42 -0800
X-Gm-Features: AaiRm53q2Lnqqf6i6iUSVbAXPETTfxfsXanwpvbBC4vy0B_vFlelVg_-LGAl_JU
Message-ID: <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 5d8dSAMwz8b2skZvGdtp--OQU_0kPvYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyMSBTYWx0ZWRfX2WyF7HgvnQNa
 weoMl+meA+QnhbYsWhsXyUB10izpzOqKJhBSj+uxVIJnLjLc7xjVdLbacdM6wfyWR6xAlauPFzj
 la3YHkFCU6KhOs72iiZaFNur8lYBI1Hx/AnGTJ1E70HdiEYBpndS3QEL3q/LgDLY5cIcrvaZ4gR
 32mpgvRw+ki8a8mgzcTUi+3r2WTLHjTvRakuMSNdCcuJzesrJLQr/tOWmlxU6TxSKrDdWKKt1Wv
 3DbxD/hGyIur7p6dzvhLMDctQ7fgLkASsvpNzRTj833vx0QL9U8trj0PRHEh+d1Gc7kD77k/3+h
 aRE6ile2XD61I0I08mLk5HrYhYLzRRddZNEAndyaVLlGYldfExB0468Boq2nGDlHuSocsTWOe5g
 K5eBLtxKa52HPDRqfNTbV92AYUI39ErCIwswSyTAnehzNpCxmCjG9Ubv/6utZ76lLOgK+/BKLOD
 Rl8CiM5kl0XZCeJ1MtQ==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a848eb cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=uh5CrAVrB7YgaaNdy8UA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: 5d8dSAMwz8b2skZvGdtp--OQU_0kPvYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040121
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 910F32021C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 6:57=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > MSM KMS devices, pointing out the need to use dumb buffers, however dum=
b
> > buffers should not be used by the GPU for rendering. Restore GEM-relate=
d
> > IOCTLs for the KMS devices.
> >
> > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only d=
river")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note, here I assume that dumb buffers generally should not be used for
> > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources=
.
>
> That is problematic in kmsro.. (but also unsure to what degree kmsro
> ever got used "in production".. the x86 drivers don't use it.  Android
> and chromeos didn't use it.  Etc.)

(also, allocate from the gpu render node)

BR,
-R

> BR,
> -R
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index ed2a61c66ac9..f82c9a36a166 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] =
=3D {
> >         DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM=
_RENDER_ALLOW),
> >  };
> >
> > +static const struct drm_ioctl_desc msm_kms_ioctls[] =3D {
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM=
_RENDER_ALLOW),
> > +};
> > +
> >  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *fi=
le)
> >  {
> >         struct drm_device *dev =3D file->minor->dev;
> > @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver =3D {
> >  #endif
> >         MSM_FBDEV_DRIVER_OPS,
> >         .show_fdinfo        =3D msm_show_fdinfo,
> > +       .ioctls             =3D msm_kms_ioctls,
> > +       .num_ioctls         =3D ARRAY_SIZE(msm_kms_ioctls),
> >         .fops               =3D &fops,
> >         .name               =3D "msm-kms",
> >         .desc               =3D "MSM Snapdragon DRM",
> >
> > ---
> > base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
> > change-id: 20260304-msm-restore-ioctls-2a1792311a09
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >
