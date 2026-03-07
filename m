Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RpGaKTnKq2n7gwEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 07:48:25 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFCB22A751
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 07:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078BD10E41F;
	Sat,  7 Mar 2026 06:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzMTdFEs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600AD10E41F
 for <freedreno@lists.freedesktop.org>; Sat,  7 Mar 2026 06:48:21 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5ffdd9a6155so1526391137.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 22:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772866100; cv=none;
 d=google.com; s=arc-20240605;
 b=OVyv37j0R26rVTQJNlpNsricPZ87LdeyuJjzhUI9W8ITecFJd9MKPWtmUY/gcETxZO
 PnZvNkZfs+18dhGR9cmz1FaUB+6FTCHo3KUDAWlGxnXhrW5lGS+6ur63xUA5fmRGldRe
 9ULfytWjajwnq+n5W80Y9nLHkWEH+1DVU19YJvbhnEJRA0w7bSOZVF8yCms/rzPfXqy1
 oGziGwwktI66LoUoYD5i9CiYqbWTeuFkqN0MuJ6ZvhMtNM/bPsxMYQRU7kNLkN/WmiDa
 vGH72C2j3hOKvSVdQUc91eCl4PN9EAcll4Wrk+W4SqfbRx1U6ZcxS6x5C7NpZLU7UDyj
 HR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hRmLXS/lUmRTfDQsR0+X9BfBWlcLxAvlkJqbJwNWd/w=;
 fh=pF5SgW7/aWQfhgH+UapDob28Rpd0kS7HIBEtsKIPB0w=;
 b=gMBXqAAPDdCvScbAA3FuxssKMlFgKrL/yfIjXqqz2tYmMhWIS3dadIAA3jO42dGX7y
 b9hrv3Y8RMLZ5trbS9hMO9pwvOp5vZrtMrr1NwYMK10FENj1XQwpJAuKx4CNUTUeDgug
 ezDizRTw3A5fhylfJHvdkr2AO1mc/7gUCxzH6ZCmu/7KSPcP7v1yHBlWAYgM530yuNzu
 smQZ6D3hIS0YyJslSRU030s/HaPxCzRGydvZPNttAIpT7DTkg3hTBDtdzXCYIVQ5T2CH
 LzQRkKOdOS3BMOV2M9jOPf+AyEuepn082Ih2aWO3WMGSIcrITqTdN5BjryzYNTbskwfQ
 8ptw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772866100; x=1773470900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRmLXS/lUmRTfDQsR0+X9BfBWlcLxAvlkJqbJwNWd/w=;
 b=dzMTdFEsm9uGJgOHXUrR9bS1lsbpIKnwAfFVSQnbuUV+zgk70w7eCtwbFlheRyDmba
 s11gp9jIXtL2LglNgS/ItBWV2kUBS5POjC36/mLl5nBepI0Hy8J+/x9ozw/yBHkvgkLO
 GflUHqnF4TqOWJfXQ6qplHkEDvDCv5cdv3YEe/s+g43qXgHY3GGeNCvnChawFvj8rcFu
 RuJALUCR0WwB68pHE992cPlDj+UCJuktOs5sIKz6syma5/6w9KxOPD8fhO74itOoexC+
 xrPqau2oWiVps/+wTFeeF1bDCgGsbf/sizmGrZ0Wx1QUqNDKdI0+I4RdTbt7mry/jm3r
 B9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772866100; x=1773470900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hRmLXS/lUmRTfDQsR0+X9BfBWlcLxAvlkJqbJwNWd/w=;
 b=Z5bgWATqWP+8zQQO2I26KWflFIEheHqFBUw31aXiIqKe4o7+bMeBG/HtubcP+gm5oT
 AvGzmgceg4GdPm/KWve785kIJssvxtPiMqyjMX7qmfziWRmC2o6ST1CJ8nT5vZFvBPcu
 a1IolaanXdDsxpz/7cqsh0kZ6n+Jk9fweXSSuFAk91shoJxJyV9j/kju2JOs71kn96Gt
 p0L8AB4wGzuEU/4s/Dhhc/PZLnVh+uI0WDbQyN3cgjG60tPcG+FbO6vAUGbvlZjkW/r6
 zN6i6je3/6tQM5Jjcg0+eXFzuL3KxqC0TWsoTV+LVAw1Nbx6NhPmaetGF3Ave0fBoboZ
 k2pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa4HBx5HK4k5o4wK8AeviOIrmwAiWCR+NhfTJ2AhFTyHa4p7W5SBe/2wkbO7b6cOoS2v3tuBeD+ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgojWHDHQeH3Mx1FG5A+NQcV0UFFw4QN3RHE1no7mGjZBaL7Ok
 OGOexnIMAm7bVbu2nZoNzdgpEOtRZZt/IemnBoWl+GUTcdE0SVDGyT/qLM6MoX2C9giurquca8C
 fsO/NtqSuyBzBGC+KopXI7IwZtzNtzWQ=
X-Gm-Gg: ATEYQzxc/miA6cudgwSkD0zptHX2LH3yFKngKOax1HUvxz+YIyiaob1niGxL/k1gb+N
 sIKwdt1F//BUBza8SPxqWZu7apwZmn2djCCafgc45eHRddFr9lLmGa0dUo6VFWkPaH5aTOK7tCe
 mc86QChh8sg5is6Oy0l8wGEBb1+opnLxK/RnerzPzDvh82gQ2QI1LhaTU8ydRKA9bWHPBR61Ivy
 r6JmDMUbsHbeN9sBTgkhSPJn7aH4NOXWlGDfyicSnoBJoh0DScoreRLS+VUDWq33zQsvx1e3QhV
 k63Jkkqm
X-Received: by 2002:a05:6102:c10:b0:5fd:ea47:d317 with SMTP id
 ada2fe7eead31-5ffc8edc536mr3588422137.15.1772866100236; Fri, 06 Mar 2026
 22:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20260306092553.37973-1-mitltlatltl@gmail.com>
 <n4ytt6euoeh5igk7a4rn4zawpr4psckahc76375ls7a4qqcty5@7bxj7otyuevw>
In-Reply-To: <n4ytt6euoeh5igk7a4rn4zawpr4psckahc76375ls7a4qqcty5@7bxj7otyuevw>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 7 Mar 2026 14:47:59 +0800
X-Gm-Features: AaiRm502i_G8lNln1FvqaR8RKnFFtJwjyfIVaHU8Qf-bf8HfTg4sZ9nSgY3iuS4
Message-ID: <CAH2e8h4-ZF52a7kMU4YJ7fmaRb-H57FXofzcohvC3hoHBd9DJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: setup RC model properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Rspamd-Queue-Id: CEFCB22A751
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Sat, Mar 7, 2026 at 2:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Mar 06, 2026 at 05:25:53PM +0800, Pengyu Luo wrote:
> > Using incorrect parameters does not seem to affect the display, but we
> > should use the correct in accordance with the DSC 1.1 or 1.2.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++---
> >  1 file changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index b60b26ddb0..276c63d2ac 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1843,10 +1843,35 @@ static int dsi_populate_dsc_params(struct msm_d=
si_host *msm_host, struct drm_dsc
> >       drm_dsc_set_const_params(dsc);
> >       drm_dsc_set_rc_buf_thresh(dsc);
> >
> > -     /* DPU supports only pre-SCR panels */
> > -     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> > +     if (dsc->dsc_version_major !=3D 1) {
> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "Unsupported DSC vers=
ion: %x.%x\n",
> > +                           dsc->dsc_version_major, dsc->dsc_version_mi=
nor);
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     switch (dsc->dsc_version_minor) {
> > +     case 1:
> > +             /*
> > +              * For DSC1.1. the upstream lacks SCR parameters, the dow=
nstream
> > +              * parameters are unverified here, we support pre-SCR onl=
y.
>
> It doesn't. It's the same as DRM_DSC_1_2_444. Please send a patch adding
> the comment.
>

Indeed, I didn't remember this correctly, and I recheck it now

> > +              */
> > +             ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR)=
;
> > +             break;
> > +     case 2:
> > +             if (dsc->native_422)
> > +                     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_=
422);
> > +             else if (dsc->native_420)
> > +                     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_=
420);
> > +             else
>
> It's not that we support 422/420 output... But yes, it's easier to fix
> it now.
>

Yes, this will fallback to 444 unconditionally now , since I noticed
dsc programming takes 422/420 into account, I added it here too.
But calculations don't take them into account, like we use scr_bpc * 3
in dsi_adjust_pclk_for_compression(). Should I remove them and add a
comment?

Best wishes,
Pengyu

> > +                     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_=
444);
> > +             break;
> > +     default:
> > +             ret =3D -EOPNOTSUPP;
> > +     }
> > +
> >       if (ret) {
> > -             DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC R=
C parameters\n");
> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC R=
C parameters for DSC version: %x.%x\n",
> > +                           dsc->dsc_version_major, dsc->dsc_version_mi=
nor);
> >               return ret;
> >       }
> >
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry
