Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CA8445AA
	for <lists+freedreno@lfdr.de>; Wed, 31 Jan 2024 18:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB3C10FB8E;
	Wed, 31 Jan 2024 17:09:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D010FB8E
 for <freedreno@lists.freedesktop.org>; Wed, 31 Jan 2024 17:09:22 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-60406f4e1d0so11909037b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Jan 2024 09:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706720901; x=1707325701; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v+9ppG/cDRjOPXvM/ttUkSSqu1lpu+kmdsbUzCZE3i8=;
 b=b/C9u0UORPIX/4lrjoRd1HR0U3p8OZ4M7DGNR7Yi14RZG40Jh/uTAdKxipQuBFqKDI
 GLuHmNXP+4F+zIvB3i1bgA2M/u8IXgfBgiWju4HmeuZkCke29ydft7UdnGlVEmxLvVuy
 81Dcfh62K1ZznDX3BvoJjYBtZZlz6byz7h5OuASxYYfyFCz3YSoJbWNTYyr7cEfZmRd5
 KFmcAmK1HvB4eMJrwUNa4CBV0JyKa6Haw/TFsmVc1UnHRu6+VPz+PSclqZQtcAH4iEoD
 WtmjSGy8pIv3mOLcB0y3CDFR+oOSGZfRfFckJQsJKm5JQpfLNaOXA/MmRNzvOcjqMxaS
 MskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706720901; x=1707325701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v+9ppG/cDRjOPXvM/ttUkSSqu1lpu+kmdsbUzCZE3i8=;
 b=VvXCHU9ty5aXIFJ2Ww1BmPssdp5AyxtDbC6QAxqzqlQXUtwLMSZXFVuppAWig52v1X
 RbYm6GI6yWAybKKE6AbsCabowKMUedEkbGZoVbUa6kE9kZLsnGMNklruJ4CTGMpubXRU
 b0xxaDUexqvQOicwmqWV7Y9ooGuQmHh1NOAupG3u3Ghcmcp13Ycdl30dhYF1tWNbkud0
 Obgm9ubewoIgf3scDsnwOwy43EFNdAIIp/2iS/fWK2rpQ3vpPXdslvNEJKc4CsR2A7G6
 86pGI2/7WUEMkubnrUqxaZ1lA6brxwVDCwU/5GJVeFgjxJ3FCDgwHZuKZgSGPmjqvTUU
 xtRw==
X-Gm-Message-State: AOJu0YxXS0s6FXoQKkFJ3S1Qh/os8WDi09yIePT+JKSPGyho5Fz0NMXT
 DsI4MCYZtB6gwz70siw4rWDTRjv5JoavjUhnt3/pP51a0mBpZsxzyBOtTtKOwCcyacwzTPcB8QZ
 8gdiMmet5zjiC5wSdziBxD9HFQApEQsfBM3xFEA==
X-Google-Smtp-Source: AGHT+IEjAoxuGHt0dRHpkQSUr2ocD7zocOhX1KcS7P9exXx9WLr9h/lmNgtDKQ10CwpzLbWx6M0j/D680+qaAJX+4Kk=
X-Received: by 2002:a81:bc0b:0:b0:604:b8d:379d with SMTP id
 a11-20020a81bc0b000000b006040b8d379dmr1929231ywi.49.1706720901173; Wed, 31
 Jan 2024 09:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
 <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>
 <Zbp9jPF2FspZEk6q@linaro.org>
In-Reply-To: <Zbp9jPF2FspZEk6q@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 19:08:09 +0200
Message-ID: <CAA8EJpqpk_W3kDtQ2=eCQ5gY0PgTcejfjifOApC-tUwAd6S4BA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dp: Try looking for link-frequencies into the
 port@0's endpoint first
To: Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 31 Jan 2024 at 19:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-01-29 17:08:29, Dmitry Baryshkov wrote:
> > On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > >
> > > On platforms where the endpoint used is on port@0, looking for port@1
> > > instead results in just ignoring the max link-frequencies altogether.
> > > Look at port@0 first, then, if not found, look for port@1.
> >
> > NAK. Platforms do not "use port@0". It is for the connection between
> > DPU and DP, while the link-frequencies property is for the link
> > between DP controller and the actual display.
>
> I messed up. This patch is not needed, plus the author is wrong.
>
> Will drop in the next version.
>
> Sorry about that.

No problem, don't worry.

>
> >
> > >
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_parser.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > > index 7032dcc8842b..eec5b8b83f4b 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > > @@ -97,7 +97,11 @@ static u32 dp_parser_link_frequencies(struct device_node *of_node)
> > >         u64 frequency = 0;
> > >         int cnt;
> > >
> > > -       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > > +       endpoint = of_graph_get_endpoint_by_regs(of_node, 0, 0); /* port@0 */
> > > +
> > > +       if (!endpoint)
> > > +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > > +
> > >         if (!endpoint)
> > >                 return 0;
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
