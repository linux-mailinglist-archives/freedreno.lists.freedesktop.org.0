Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841DBA06D36
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 05:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CC610E34A;
	Thu,  9 Jan 2025 04:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PMWwIWkW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACF810E34A
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 04:41:34 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e537d9e3d75so753228276.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 20:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736397634; x=1737002434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvs/mHJQMOdYczLfBV45iYS0W7vmpZ9giDxDReXGotg=;
 b=PMWwIWkWlA1fxkfGUrN+KjJMC9AC99HihrpDhJFdBGaFSo9Ar/pEwT6kWXM0GxwFIl
 IT22uFZHKPbvg6VYd7tm+1EAHl8nJE8dyk/J4gh8Ya3Ued9/PUoV9nHhG90fSIsS9HoL
 /iO2Q/ki4CZ6T0m94NklCVwGk4zxyd7t3GfmcNFY/5CTJ0y27ip5bOoXf8krNPM9PpU5
 2594zI1EETXdRk7j74G5Fm0uuDHVIDZJAiD13vanNphqyMPili2F8T5+IDpyHau7jdsI
 OFeNdkdfJI70mvCXCex70XUiSrcvQYPHeasv1IQflGY+H7NAr+nZwvN0t+4Kg33rNfw7
 BtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736397634; x=1737002434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvs/mHJQMOdYczLfBV45iYS0W7vmpZ9giDxDReXGotg=;
 b=grKUFxiqFe88BunhyozGV98qVooOKqyYH85HCGoe3ki6K2kJVZhTsZufHBNROx+tEg
 4x3Ou2PjLpr3IGPTNU0hgT/z0pSarpM/qK1SVeTgWw9YEnbHTqhBPoxq5RnRTy6S+/Sm
 HlBUgu4ibd/tFjz9vJdrfucbwV5Tmhktj8v8vyzXezvp/8cXt9HKobgJRrgaCRaVlB7h
 4fscYyQYjL1zmyUVVXFFpMjGF8kGrnc4yiwZHdbcOT+Xx9Dwc/ooJj3s1fyJoc+2IPFn
 aV4ODW1aUK5R8GyzKRa8x2GZi84TXxcDGFz/o5NFg9HOQmWVGrQ8cbQfsdnoYWzS4cDR
 E16g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsH0nd44L+SuaSbpr3+XdPQ/IzzcWnKKYbC0/5c3KVH93nr8cDB6DCUVPeAzQcz72DNxflVpESciQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx65CSXjpsk7J97kuDNI1YZZcnh2sn6oEwkIKWAo4A662Lj5ZQN
 QQTnvdKP8bYxIBeukGDrcB+8QUM8P4YhHUttgBSL9ls2Lt7J6Z2F78bAkmEoLgqKJRpvwgm3HGX
 tqay/FZqnqq7lFSzMPbDp9eedA6eotK6FmM36lw==
X-Gm-Gg: ASbGncsAuuLHqR62HquYHNHRky+ohNWti7sdwrW0alpuyH3yIc/2FrcFP8qX8EULlmJ
 W9DCckFp7/yQQ9za/Kblzseib51vUwxCmUM/9Qns=
X-Google-Smtp-Source: AGHT+IF9s2GUSi5T7LK6WS13hidqzx5TqfDPAlAGk/Zzi1kAOlWEP/BP72Us2yTqrtLnalb/C5PfgG3qgZc/bEjeS/A=
X-Received: by 2002:a05:690c:f84:b0:6f2:8e62:d8f0 with SMTP id
 00721157ae682-6f5312ae9e9mr43943667b3.30.1736397634058; Wed, 08 Jan 2025
 20:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
 <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
In-Reply-To: <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 9 Jan 2025 12:40:23 +0800
X-Gm-Features: AbW1kvbKKm8DJYo0dAIIJoPHVvNkrDYDyz7Pf_4o6XMiCwe4OMdmxohhw0h99BA
Message-ID: <CABymUCPm-+RYVGx6aXXPqgEcg+x7vhrN_HanJvvNrFkJj6o5Aw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=889=
=E6=97=A5=E5=91=A8=E5=9B=9B 09:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 12/18/2024 11:49 PM, Jun Nie wrote:
> > Add the case to reserve multiple pairs mixers for high resolution.
> > Current code only supports one pair of mixer usage case. To support
> > quad-pipe usage case, two pairs of mixers are needed.
> >
> > Current code resets number of mixer on failure of pair's peer test and
> > retry on another pair. If two pairs are needed, the failure on the test
> > of 2nd pair results clearing to the 1st pair. This patch only clear the
> > bit for the 2nd pair allocation before retry on another pair.
>
> Hi Jun,
>
> I think the commit message wording is a bit unclear. Maybe something
> like "Reset the current lm_count to an even number instead of completely
> clearing it. This prevents all pairs from being cleared in cases where
> multiple LM pairs are needed"

Thanks for the suggestion! Will adopt it.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm.c
> > index cde3c5616f9bc..a8b01b78c02c7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >               if (!rm->mixer_blks[i])
> >                       continue;
> >
> > -             lm_count =3D 0;
> > +             /*
> > +              * Clear the last bit to drop the previous primary mixer =
if
> > +              * fail to find its peer.
>
> Same here can we reword it to something like "Reset lm_count to an even
> index. This will drop the previous primary mixer if ..."

Will do.

>
> > +              */
> > +             lm_count &=3D 0xfe;
>
> Nit: Can we directly clear the first bit instead of doing an 8-bit bitmas=
k?

Could you elaborate on it? Or you are suggesting to mask 0xFFFFFFFE?

- Jun

>
> Thanks,
>
> Jessica Zhang
>
> >               lm_idx[lm_count] =3D i;
> >
> >               if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_s=
tate,
> >
> > --
> > 2.34.1
> >
>
