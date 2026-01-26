Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JFwGq88d2mMdQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:06:39 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10DA86682
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA4A10E3EA;
	Mon, 26 Jan 2026 10:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OsFi79RV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5719610E3E9
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:06:36 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-649523df010so3733448d50.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 02:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769421995; cv=none;
 d=google.com; s=arc-20240605;
 b=hVaC8da4UgpUhezH2f3m7r1Lj/GhdiF/sjaI7UX+DYsCjNKbRZ/zbJSusUwTVmRHpN
 cIzUtB1hQabXCs2VJ3BMHvxLyAa85Ep/THcdUqOCD5YHtkVi8ftJ05Wi6rD3fgR0sXcH
 AfyiwYCfrg8NS2g+0quS4YKb1JXywYGpY3FQY4K7XJrm/Aec/W8FbQQOZ2wknPovXql+
 TethL9bpAG3GSx+W70XUPzuyxNsSgEH+ARNDRXTrCf7cVylSrN+CVDpchIphWxw4GGxB
 q2u1qLguiXV1MUB6is4o/wd12uRFRKS0cIBW8uqh10lDvXi6BKWeKXozF4+E+vxVBYCR
 UBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tQ9l/WeI/5nyh6dIopUp3AzhOz2swBfPl0sUm8R5bI4=;
 fh=HzbjU1alfG5Lvw49yQbUHGb1cf/OjMMARYFA9Tq0r8k=;
 b=ELoilSBLZXkfDXyPa+JrTNeBvs6zIU4w1aZLQjp30PdiUSNKirLWiPL7Z/H9Q0zW67
 PGSQjjuPNpOi9+M9MPkWTtJz6GFqK+TLXtlGX/gSunnb4QqzaMXvLlraJAs+OGgG6nZP
 yvMig8yLyd0NtdGzQ/B+mL9NuloQq1JTVMQrRJwcEcRfKEpKiMN86AOs4dL0t2QuOXPI
 bY/5qJHJMmQCJMZQgRlsc8etLNftVUwpZfqvnPmsm4MA6mzBGbwtFB/TtnlW3yCztVhW
 zCkspAsMNO7qOC9vd3JOZyx708vsxzcC/poy1bdHoIxUtm7tR/S/WOzALv118baRUg4u
 Ctqw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769421995; x=1770026795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQ9l/WeI/5nyh6dIopUp3AzhOz2swBfPl0sUm8R5bI4=;
 b=OsFi79RVSbLOK5doXdure9C4yFArVAl/WT79ePgnpwTqLPLfzaONHgXJhSzvX3s+to
 Umhtunt5WDsxQk+q4wTu6vaKNGlPpPRhwyeu9TmconO4I0hGpMtg0vu12osxYM3m+UKE
 PezEkNjLGLaEOlk1SuBj4udPB23cFeFDHSih0H7TsDHYPNgyLKdKl6avigWXa862CfXj
 vi9yTDI4gwsxtK1zPzzCWE3c/4aZAbzfBBTpKRKw1pKJnR9hTS/1NxliXLMA7+qDLTbB
 g10Twh+Wv1blMLtOX4bXT7PWOEmPDGNGta4NHksv+VZn4EPwU98g5r3TuKaiZN7lhH5M
 ZGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769421995; x=1770026795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tQ9l/WeI/5nyh6dIopUp3AzhOz2swBfPl0sUm8R5bI4=;
 b=xB3gyAzwSQlzfjnowOmt1x0khIMLD8p3LtLJQ4PYv9iwEc0pi9JI2VNPSvRrJWtzAf
 jXGi+5Hbc0iUO/wLVG4cewWOt/o0SOSQoHDSyvIy977rzpucLR8RfZwPhXEv7YhhL9Sx
 UOHeib1qibJEgMmKV9MTNEAvTvuVMhjS6s/D3aAiStCsyRLG51HtEXF5b9hSBrYgDhnf
 Ee6URrbl1LR+vUQbZAnmSiRqW4sHWDVn8wseMoH3xgCDcfYihUv2jDnoDlrBCBPo/Jxt
 OB1V37FbXMGUM6BQp/Zymr5vzIIVK/sYYh/lF/1GZY4Se8Zq5SPX6uPXDeKeBU2io348
 nOJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0JNviilrMpIfaJOYv0ra7ZERj33Z/F7EmVvzBKuY68NIAMxkGOINvVYKknq1cDpqtm+j3mUjSFLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW1DhdKEreiSABUKzyiDnj2jrEN9jvQnvCRn8Z/zesNkdAp0DS
 615X03u02CcgbW2Z9vNy93PcOTLPTtGmZgigl5R8+xqFsDXIES+h+BkRW4UBVkq4rMlSAMesIuz
 iUVtIN3aB+CXTvPPu/OnvpSGdy8Uu/Ybhrxb3PrYkqg==
X-Gm-Gg: AZuq6aI0zvQD/DtI/iKnYn4dtZRXQmV8jlljjAOjCjaWvQ6kDLBUKqFQ+kJKSw3TMGg
 O6eCZqvHs0WnAHsFyqn7y0QCSUxiLlrqyCOSOLJMNZliS3H4Yz5PzREkWxifTM/jD5m2adi5HJc
 SXtJ6dBYF8PD5Eb5n0qD3eMq5evBhE+hzEnGDsdVEpw8HcUrYhP2cWWa+8tzyCg6ZnC9IG72pCX
 /9RZ7028Q+sfTKhSKs/cVlqR68ccyeRqjfNLiiOVl3OhsT61zzwiHC1GQjCULm11uafYPiRFS70
 TCbv0Qe3Xl0=
X-Received: by 2002:a05:690e:251c:20b0:649:4f44:86 with SMTP id
 956f58d0204a3-64970bd6222mr2249927d50.27.1769421995119; Mon, 26 Jan 2026
 02:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
In-Reply-To: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 18:06:24 +0800
X-Gm-Features: AZwV_QgRZ1B0Lknd_Q1FCCCl8eWQj_IXq44DYTqAuSmzS2FFL3bMdBwa8bSwm5s
Message-ID: <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: D10DA86682
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > Currently, plane splitting and SSPP allocation occur during the pla=
ne
> > > > check phase. Defer these operations until dpu_assign_plane_resource=
s()
> > > > is called from the CRTC side to ensure the topology information fro=
m
> > > > the CRTC check is available.
> > >
> > > Why is it important? What is broken otherwise?
> >
> > I see. Thanks! Will add below lines in next version.
> >
> > By default, the plane check occurs before the CRTC check.
> > Without topology information from the CRTC, plane splitting
> > cannot be properly executed. Consequently, the SSPP
> > engine starts without a valid memory address, which triggers
> > an IOMMU warning.
>
> What is plane splitting? Write commit message for somebody who doesn't
> exactly know what is going on.

Thanks for the suggestion! Any more revise is needed?

Currently, splitting plane into SSPP rectangles the allocation occur
during the plane check phase, so that a plane can be supported by
multiple hardware pipe. While pipe topology is decided in CRTC check.
By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane splitting
cannot be properly executed. Consequently, the SSPP engine starts
without a valid memory address, which triggers IOMMU warning.

Defer above plane operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.


Regards,
Jun
>
>
> --
> With best wishes
> Dmitry
