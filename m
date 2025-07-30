Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBBEB16860
	for <lists+freedreno@lfdr.de>; Wed, 30 Jul 2025 23:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C6C10E236;
	Wed, 30 Jul 2025 21:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NefG+6+A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9B810E236
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 21:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753911895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
 b=NefG+6+AoB+nFdpZ+Mvu2NIzuXZlagaCp//jX+1tbnrdjPncw7v6yX2nAiBAio1zkx6niJ
 gUHhSY3aAFEOzAafEwReh8wVfBbiY6PRCmjRy2pqoIkoRfBRl6CzHHeh/74hcaFFuKN+Lj
 YirNP4/+yqXVhT4auVKrq63d+e1PXqY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-9cZQfZlNPPeFEHATLd-dgQ-1; Wed, 30 Jul 2025 17:44:54 -0400
X-MC-Unique: 9cZQfZlNPPeFEHATLd-dgQ-1
X-Mimecast-MFC-AGG-ID: 9cZQfZlNPPeFEHATLd-dgQ_1753911893
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-af8fe47fb7eso13829966b.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753911893; x=1754516693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
 b=jJaPXyqN1d2nmn7nosrb+5k28heZnqb+rIXoDuMPuFfDtAlJ+fCuq7+ByXDsYEiH4M
 KGvyc7Ap19eWebIemscrGn4gV+ezh3knRL4pmvcI8wjNeoIxZwsXIQ99WwLunZOpj0x1
 pp/UuNN006RilEzJdCSM/RkHXfb6zexNnY9E/HKLLNXmKg2Kr3StKlWH4VPEDit5vAi3
 9b84Y8f307OZqKyP36aR7cyjUbnMwOGa56KsInv6+2HMd7rbR3GDwtrExm7r88hwYgeG
 GzsIUaXRuyhKJBzuBx58D8qD5iZaOlsnS5L8CKP5TVF6Amr2LvItmZGw+E3fsyW4YMAr
 T2Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs7CDODzy44HXQARQvL5csz1FdG9RytaegXnjc5X6gtdZtEVXEUg5BwGkUNptQPudplwiYchWm1/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPYTSg7+iDexzcy0kko5MwIxMg0nYC7+lNNBA/PhefNr8gEaW+
 yMDbmYGBQU257kOoe60JkaWqVtTh8UZ1LxHXVdxGuvwFxfLDuXHUWbptl8YHNdPL+6SZ3NCLV7A
 B7NkFpBegDfVUF8R5PdlgeqZwKp/3ocYLSFL3nD2T66MUt3GHjQNv4i7ryS1rOwKLFwcll+SzZx
 A3JI5XNQc1iquiFiVP3qIw1VjZxDq5yF3vm9ahiVBcPDFA
X-Gm-Gg: ASbGnctbOyirQZ/SMd0vPDcm+WLYIzen1epjxIjiJ17xC1ED0XMedH16rQ6gBrLOaf5
 muTQfzvYU0aoxIpgD3rdxb7JsiAR4JwDRc5d6rLZUTKGK2tlo+c+rVK97f9hZc/CFgg3nvXCHpj
 K1EaXqw/Kf3fjGKItkkJAQ
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af8fd95983cmr588748066b.28.1753911892808; 
 Wed, 30 Jul 2025 14:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETx/Q8z8JkM7YCT5hwYxMVdj/tg+Mt8q7qzSVGG/eKji/F1PzdcrMN7TdxkQSZqczHP8nko8qLTPufvPgLTYo=
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af8fd95983cmr588742766b.28.1753911892317; Wed, 30 Jul 2025
 14:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
 <20250711-adorable-winged-petrel-3a55df@houat>
In-Reply-To: <20250711-adorable-winged-petrel-3a55df@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 30 Jul 2025 17:44:40 -0400
X-Gm-Features: Ac12FXzMGo-MKds2pkAwVkvrlMlbQL40TOGBvmpmqZ_c-U-gdfMUVGNxYave4ac
Message-ID: <CABx5tqKuOcE83t+BVz=1WudVtBxJYTzcjWJ_n4se0JQWeU_Y1w@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
To: Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BVW6t6pQ5mi2nrFmMoKfqyZzyuefy4V9wFrGi-mWbT0_1753911893
X-Mimecast-Originator: redhat.com
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

On Fri, Jul 11, 2025 at 3:05=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Thu, Jul 10, 2025 at 01:43:10PM -0400, Brian Masney wrote:
> > -static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rat=
e,
> > -                               unsigned long *parent_rate)
> > +static int sun4i_dclk_determine_rate(struct clk_hw *hw,
> > +                                  struct clk_rate_request *req)
> >  {
> >       struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
> >       struct sun4i_tcon *tcon =3D dclk->tcon;
> > @@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, =
unsigned long rate,
> >       int i;
> >
> >       for (i =3D tcon->dclk_min_div; i <=3D tcon->dclk_max_div; i++) {
> > -             u64 ideal =3D (u64)rate * i;
> > +             u64 ideal =3D (u64) req->rate * i;
>
> There shouldn't be any space after the cast.
>
> Once fixed,
> Acked-by: Maxime Ripard <mripard@kernel.org>

OK. I'm planning to submit a v2 of this series on August 11th when
v6.17rc1 is out. Unless the maintainer that picks up this whole series
plans to drop the space on merge.

Brian

