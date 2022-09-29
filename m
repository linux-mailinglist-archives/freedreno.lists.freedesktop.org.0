Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9345EF845
	for <lists+freedreno@lfdr.de>; Thu, 29 Sep 2022 17:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B263A10EAAD;
	Thu, 29 Sep 2022 15:05:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30C410EAB0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Sep 2022 15:05:17 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id k3so53161ybk.9
 for <freedreno@lists.freedesktop.org>; Thu, 29 Sep 2022 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=b9uxRyoaMis4M/Del53oQhe/OKhSA38Po18Or6YilLY=;
 b=j/p76Gbz/6p+klZe5CzqnqgPqzGWALW2g91DrPRqYNms6dk5oGuWDhJHL1Tvx+U25E
 nv9/Y0D9beecD9wyAD08rbImhYmv8NXz9nzQnidMa8IRhaLbrWuagphyW2wJHaXf6e3y
 ORntlHyPdupf80tWY1phTwvXu6h2ci8lJbuNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=b9uxRyoaMis4M/Del53oQhe/OKhSA38Po18Or6YilLY=;
 b=bZxhloHyOMulCCRhgbzNtOS5GAsEeXXzRpaT8rGijFY9jBC9l6OKZF809RlSMtouHc
 OUZjhR9hlbsI/iDIJzBZcgJmq+7kyx9j2oHrblYJ4VDq7xIFja1dMkQjpDHrUbV+/HaT
 4wS+LWVlY823U6FG/K09l6x+Iu2d5GlQnAwMyFOUKPdcEkaz2I00jHmazdNHrGNziJS3
 waNb9elQNhEabeaHo+3Lomk/YwkHkQfbhZM9QkdVdirYLIfwMTjotzZaDxSPUgsHyUmY
 VBLjjMWkC7rbZd+IVr1AZIDhmB+K2+Psi7fMVVyO8yRbqn7afa9Hw6IzW8zPTpme/ew8
 MnmA==
X-Gm-Message-State: ACrzQf2Xhb1KGdo7/AVQL79e4znHlcgvTCO/0MJHCFrZe+lvjvgJB1ZQ
 E9Rv32K4/a3YH4Zr0S88Rw6aU8wBZko2OJQcbBA8iw==
X-Google-Smtp-Source: AMsMyM6mVFtECpxKgra3ZkQaG9b6seBNybgK+xW2wUNsy82MrfUpk07hV4+qwXFgEt9Ky8+H6uTmtZZfdLoFajaRwaU=
X-Received: by 2002:a05:6902:284:b0:67b:fc57:9104 with SMTP id
 v4-20020a056902028400b0067bfc579104mr3718530ybh.647.1664463915933; Thu, 29
 Sep 2022 08:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220928192605.247546-1-broonie@kernel.org>
 <68689c5b-327f-65df-0d34-a7e1a851f568@infradead.org>
 <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 29 Sep 2022 08:05:04 -0700
Message-ID: <CAJs_Fx4NzHVRvN6xd-unrpmv=Nc_PXYbHvYujhz7UZ=YRkRZ7A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] linux-next: Tree for Sep 28
 (drivers/gpu/drm/msm/msm_gem_shrinker.c)
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
Cc: linux-arm-msm@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 broonie@kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 12:09 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Thu, Sep 29, 2022 at 8:10 AM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> > On 9/28/22 12:26, broonie@kernel.org wrote:
> > > Changes since 20220927:
> > >
> >
> > on x86_64:
> >
> > ../drivers/gpu/drm/msm/msm_gem_shrinker.c: In function =E2=80=98can_blo=
ck=E2=80=99:
> > ../drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: =E2=80=98__GFP_=
ATOMIC=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98GFP_ATOMIC=E2=80=99?
> >    29 |         if (sc->gfp_mask & __GFP_ATOMIC)
> >       |                            ^~~~~~~~~~~~
> >       |                            GFP_ATOMIC
>
> Also on m68k, as reported by noreply@ellerman.id.au
>
> I have bisected it to commit 1ccea29f90329e35 ("Merge branch
> 'mm-everything' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm"), but I didn't
> see immediately what caused it.

I'll send a patch for this shortly

BR,
-R


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
