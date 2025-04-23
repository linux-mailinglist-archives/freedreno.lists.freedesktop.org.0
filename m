Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED835A97D0A
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 04:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B4C10E643;
	Wed, 23 Apr 2025 02:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ur2bOFrx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8075510E3F1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 02:50:36 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e72bb146baeso2638935276.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 19:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745376635; x=1745981435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
 b=ur2bOFrxUJvC9XxZKckueyI0euBYgS6GRUYE7+1V7DXafbFl3OKI34U52Y/EwL/w0n
 dROy2LkAh1YZeFAfsQ3vOJr3dYeRfeDBOkF/+ZWZPwvDo+AmP3HFSR+1Tn7bwogFSgdQ
 otmNOr8NeCLz0BEILQSjcCo6DJqT3QRm8SSNe5MkW9taXPOXeABxQ/qDAWRcKqolWIoJ
 l7NX3N299zgUeQhWBuwCUOABz79p/BMDh0b7SjJpCSCqeBh6QnlWuBqdKj/GMFUOohGx
 xHn6zmKswPXV21WP+PXDeWpdXdDZfgA5BGHEiLUWxAXcGpk7Mmk3bsnYT8xdZfCyCR2+
 i80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745376635; x=1745981435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
 b=YfS7xdmvEkLK5RSFySGfdB/dUvxC0z6/w6HChLac1OphjWT9Q5c+aCDWqIDx++x/R9
 1LMLGh709uVby3E0NY6NhWJtuYmd8RyxiTDvu6lg/EuFc3GGy3jXs8t1vuigJ0nqce6L
 1YjnUZ29YUKz1iuXMHQhnO/TzfACzSwOpbiaNXsljLPQr7IOQnKJRtCQXnZifx5pp1S8
 maL0s/bNsxXekDFP0Vfm7bYTE2IpMS4KylZlnATJFnOlLssjhfkq5Ds9bvkx+bTLWydu
 08T3DCKMRF47HMTQeogZkmALYvWHlom/3dsN9KIbWFlLCG1SmUGbLcuZ4ZqQ2Dm0hWeE
 JDYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkq7qksQt7ab9Ba1HyrTFx54QUmf9tbRNAsReSk1EnfU15wFou0Me+9WkYEASy+qNfMov0y3tFg7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ81We9LkJ1Z3tqk2XiDZ5vlsaqvnqgh0vbT5K1OqH6nTDiYi3
 lQNU248JvLEfawcgvopLxuLtAoFs35CuUxxmGhZRmWR3Gic8jy5ce+9abM3cYI194qekUIYmnHS
 Ui8BAe1xHsq7b8FEm756mjNXTWs5Ld0d0Wdc7dw==
X-Gm-Gg: ASbGncsYiPlr4C+MPh1CkqH19pvn4oZuPd85QX97hiyTal2jtdnkuXrqhITjcYEwQqy
 LrkP+quDQOHzub88f5Hu4Uj9fmJ+HrwgldM/DRdVhPPrHdS5fHa102thF7KkTIfkt6Y+cx4NjKE
 Q8OIQPi/ACOWQu6QAdDTbtfw==
X-Google-Smtp-Source: AGHT+IFS7GMJaX0GM076iPvZ4Mqv8sbSOQ2aAa8tFq8e5VIVWaIK11j6XpLBL5g1xrPI44TmKCq1OKq9pAfO+Q9jung=
X-Received: by 2002:a05:6902:1381:b0:e69:371d:67ef with SMTP id
 3f1490d57ef6-e7297e9ab9amr24210024276.33.1745376635244; Tue, 22 Apr 2025
 19:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
 <20250418183236.209236-1-mitltlatltl@gmail.com>
In-Reply-To: <20250418183236.209236-1-mitltlatltl@gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 23 Apr 2025 10:50:23 +0800
X-Gm-Features: ATxdqUHPz54vm6pZFuzIqsgbIcK5d4qHYfWOJGGxPj-jtXf6WoRf3GOGq6HIB5k
Message-ID: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 marijn.suijten@somainline.org, quic_abhinavk@quicinc.com, 
 quic_jesszhan@quicinc.com, robdclark@gmail.com, sean@poorly.run, 
 simona@ffwll.ch
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

Pengyu Luo <mitltlatltl@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8819=E6=97=
=A5=E5=91=A8=E5=85=AD 02:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
> >
> > The first pipe pair co-work with the first mixer pair to cover the left
> > half of screen and 2nd pair of pipes and mixers are for the right half
> > of screen. If a plane is only for the right half of screen, only one
> > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > assinged for invalid pipe.
> >
> > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > the 1st pipe pair will be used. There is no concept of right half of
> > screen.
> >
> > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > the single SSPP and its multi-rect mode.
> >
> > To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> > are needed:
> > https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=3Dhe=
ads
> >
>
> [...]
>
> > base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
>
> Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
> topology, I want to test this series, these patches can't be applied to
> the latest linux-next tree, and I can't find the commit id in linux-next
> or msm-next. Where can I fetch the tree?
>
> Best wishes,
> Pengyu

This is staging patch set. Code clean and formatting is still needed.

https://gitlab.com/jun.nie/linux/-/tree/sm8650/v6.15-quadpipe-staging?ref_t=
ype=3Dheads

Regards,
Jun
