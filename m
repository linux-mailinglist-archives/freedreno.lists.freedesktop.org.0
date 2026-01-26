Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gILbJgxCd2mMdQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:29:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AE586ED9
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6B110E402;
	Mon, 26 Jan 2026 10:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="twR1cFma";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5214610E406
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:29:30 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64455a2a096so3271949d50.3
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 02:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769423369; cv=none;
 d=google.com; s=arc-20240605;
 b=Zl+EgGWbd9FARZU0kBmv5HYJclTesHbrzpR9F5K2cDrBj0wXkM61eBE68pqs0mBlGV
 qXIMw4CaQrx1sItJYD3ci38TPHewI5Ifi1XxQj7wxFXN/cWKvx9gMFmtdGD5v/7NXALj
 KrqPeTZ1QZS+A9V9ndeuPM/i6VuzP8mTuvq5PfsirGabHgeWr5Js2Agy6cGModbp7vH4
 9nNngHMnu1ALMuqg51wUNpSf17IE6Jt85Q6DdPSOBSWZHTBYmZcN9LMGHA4xP8CPRrWQ
 efkfnAQ7+t7JrSnchAU7eYll6v8fSgNHQsJxz778qyXWcZ6vuxcIXybm43GJdJwlYs18
 W2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
 fh=7mzSxXmIO0XMN1WQxQl3/uT5lgNzcho9NQWUPmerhXg=;
 b=MvfoVIOsKLDw5zYT6JD++ZUOAD2vgBhXgZPI7LRO5N1xf03in5lic2+7YLPiomtO7p
 KBGftKj6UKTpIu5uNGyia/0EV6hmOXA38xfGqE6a8kfx+RqVDFntNYDxN3d7VG6Tte/V
 Ir3UB9Ft5ttC1ZM8zGLWLseNJq+IQixzz2+6lGIFSmbnAuSZBx/X7B2zeAm4BaXWPAbj
 sae9TqqajtC2S3Vd0vmVw4WXteGVOTMU19dW2VMpH8WZtx4l4pLrLXaEQrwE2GhC5ebA
 sEzXCtrwcuJMLTHaW7xCFVhAYNR9WdaFf4fTD1bp+ntLbF257TtuU5OHyjTg6RLC2U1C
 Y9Kg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769423369; x=1770028169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
 b=twR1cFmaYgGVCeudlh9QWanCoXbgGrmjAAvtsiKO/XRNd7zUN/UE4Ea87S+f4G3drT
 cVhW/HpWpK98c+YleR5mhJ9HnL1BCyLfBcudc/inxiwfWliLiOKUWiUV0Vbku6V2OMBN
 uMkog6l+H31MSP1SKVwmLOY+HeAOA42UdR6Fkq79wKh49113/x4RWPEWq3GEH2ouC4Dh
 Hu9BDEAcPf80wWSzCqrUgm4wru/USmbyvCzf2pS3fCcjWTdag/ohwBCFvRC38ICNpOu4
 BoRUZqBFeB1QLv3L+6XnhrBUlSAOj2NhDB1hRdOzTW1HXR+RVosaF7HGVBfmeBTD7GKi
 l6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769423369; x=1770028169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
 b=NoXJNdnRl1lCieI2qolX4vhMvcbaYplrsognxCUj3iXcqkdiKD/6DOK1pwZXpFJLpx
 J++LafmBUOKPIwPS9RHWU2ctXPwooh+RlXjUP27w7cgJIfGaV0+dZ+NUBoWOfKjEyjjG
 Uk0fJS8CBE91bSUrFiQUD3oLn7mRt7KHqM7Hr0NHMwJgrah7poPLTdMa5Uaz8cR4HbMK
 kOUfi6Rz7uNkd4gvBQU7jHFMFTOKVCSI0MIvHsJ/6LfbFRgwKry7pPdHLObUDSFDPW3V
 a++V/hwHrpSsJwFN0mVVXNQRklJ/zVZS0+KBKCNgVxR4XJsdn4N+nGoXV79MX4kyj5uu
 CuxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdXzDBM4LFDKdQiDfCCxZH8grtpbpQrPPAO5g2Qf0Ar9+5LGsBHpZn+RKC0fwWRwE3u3tcNrEm6v0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqTrwDgsmh+k31ex5+ZE3gsXmuB5ahCLuf5uCop4MapR/quP81
 TKlBOlazUuSpn+l7AFIc0XQ/eZyLxtGx9EYhtS6gMx1RF1rLiEarjfH3skeCFC9HbRjdS/AyqYX
 EI59oGcN0YueTOaf7PD3wIeobE7T0e2LOKZXfR7segA==
X-Gm-Gg: AZuq6aJstbNBJdpVNuHUXQtAIz6hwJk6KNjubAcxQLUwiLe3y8/RPNEyTClwujYUssK
 OdUWcR0QwrieBxV0vIbw1wZJ48OxhXg+M/rGFQuHO+dXGpQQPb4Co4hAl5xxAYo6v+WxRTk77Lx
 SI6ESkE5B7u1fgD1VIZF/Qe9HCqCEthHk3VVIv9uetIjshLJ2UVqiEaL4lgMF8Gwbqt6A84cZK3
 ASsYMEbRALtSsjUvf14kN7ZALBcQgTB0OmnrMEcm02lOrp8t+4PeRDeQEpJPMGzhPL8TowQJhbd
 pIJv7g==
X-Received: by 2002:a05:690c:81:b0:794:7a4:c847 with SMTP id
 00721157ae682-7945a9ae0f4mr67768577b3.43.1769423369077; Mon, 26 Jan 2026
 02:29:29 -0800 (PST)
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
In-Reply-To: <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 18:29:18 +0800
X-Gm-Features: AZwV_Qidxbgft8poJJthLOL2vexuHqw3nVMNWpER_nv0oJLwqI4juuemdIOjfJA
Message-ID: <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E0AE586ED9
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26/01/2026 12:06, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> >>>>> Currently, plane splitting and SSPP allocation occur during the pla=
ne
> >>>>> check phase. Defer these operations until dpu_assign_plane_resource=
s()
> >>>>> is called from the CRTC side to ensure the topology information fro=
m
> >>>>> the CRTC check is available.
> >>>>
> >>>> Why is it important? What is broken otherwise?
> >>>
> >>> I see. Thanks! Will add below lines in next version.
> >>>
> >>> By default, the plane check occurs before the CRTC check.
> >>> Without topology information from the CRTC, plane splitting
> >>> cannot be properly executed. Consequently, the SSPP
> >>> engine starts without a valid memory address, which triggers
> >>> an IOMMU warning.
> >>
> >> What is plane splitting? Write commit message for somebody who doesn't
> >> exactly know what is going on.
> >
> > Thanks for the suggestion! Any more revise is needed?
>
> Sadly enough the text below is not a significant improvement.
>
> >
> > Currently, splitting plane into SSPP rectangles the allocation occur
> > during the plane check phase, so that a plane can be supported by
> > multiple hardware pipe.
>
> What does this mean? Without virtual planes in place, there are no
> multiple hardware pipes.
>
> > While pipe topology is decided in CRTC check.
>
> ?? What does it mean here?
>
> > By default, the plane check occurs before the CRTC check in DRM
> > framework. Without topology information from the CRTC, plane splitting
> > cannot be properly executed.
>
> What does 'properly' mean here? How is it executed? What happens?
>
> > Consequently, the SSPP engine starts
> > without a valid memory address, which triggers IOMMU warning.
>
> IOMMU faults. There are no "warnings".
>
> >
> > Defer above plane operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
>
>
Thanks for the patience!


Currently, splitting plane into SSPP rectangles and allocation occur
during the plane check phase. When virtual plane is enabled to support
quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
a plane can be supported by 4 hardware pipes. And pipe number is
decided in CRTC check per interface number, resolution and hardware
feature.

By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane splitting
will be skipped for the first time as pipe number is 0. Consequently,
the SSPP engine starts without a valid memory address, which triggers
IOMMU fault.

Defer above plane related operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.

Regards,
Jun
>
> --
> With best wishes
> Dmitry
