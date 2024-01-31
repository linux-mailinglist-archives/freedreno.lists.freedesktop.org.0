Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2DF844589
	for <lists+freedreno@lfdr.de>; Wed, 31 Jan 2024 18:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8788410FAA0;
	Wed, 31 Jan 2024 17:05:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F4910FB30
 for <freedreno@lists.freedesktop.org>; Wed, 31 Jan 2024 17:05:16 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a35c0ed672cso491169266b.1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Jan 2024 09:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706720654; x=1707325454; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BUi9VE3WcG0AerBnR/I4iBGlcSiIv3dP498x8byF2A0=;
 b=MXGP3DkPUtD4iEl6tZ83BBdjmEDF3wdqS60kEalOtswbdtaVTfbtl/cAs4XRQzMeGU
 O9OmNxLWTy6O5X8AqtCKM6O2plH+QaRtki0m4PJ9JVHtmBG/5IrUYq5E2vV/c1UbQ41q
 pMQF8j+2tw1cl+3ZpQ6H24iG5Rk8WX+/hXoxQy5X6lNTcT1Wpw2WHYbN2wC6J6c8ACCI
 mAPNOqZyTlX7pAsXX4qQmcXKb/QSHNV9EcpEHvo5Y8qFJRyslpx0B5I5wpugRDQTPp6j
 ZJptr6seFb4aL7v6e6F2zQRcogY/765Ig4OoENyco+inkQd1G1Zcmd3oxYoYgry8w8el
 nJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706720654; x=1707325454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUi9VE3WcG0AerBnR/I4iBGlcSiIv3dP498x8byF2A0=;
 b=NNv8ROIOZQZb10Hk8yCnBqQqy9BKOgnc+S2aEWkSxZ0UfUhTNnsWroPJDdrXRoq7qU
 GJgPP3OQBitOeLCn0YCiBaMrmAjPBKsxNZSNTUbXRkLJp8K0V0U4ikXkT42WnivbMHNK
 7x2uGkyI5DTAN+rbwYEICCQC8+wNS2uEiJwcx93em8/+VjEUDvhPQ2aY1FOrZFCUzEAl
 gKlZveBFUQCuIO5ulCOheng6n9l1xNbrYhByZXviOhRQiwZW6day927kxgT2cvY7WIyl
 JavmqZIaD5cNkoZsaBDNikVwk5917BAHiZE+Tur8XSfbJhK4aBGoSRomXYpoLgvlc2kW
 c6xA==
X-Gm-Message-State: AOJu0Yw94XX6Guqe4MjF5CbXu93vBloxRdBaF4RkSYVAW+mHmwuC4v8h
 H9f5wGjIkOyFmFi0ACgZwVvcaamTxSnWywn6rr4EvnMH2qQkcDi7Unks/AflNC4=
X-Google-Smtp-Source: AGHT+IFV90oJohU7ErajKDUKCpuqHRW982RiDbML/oPjY4Vabr8rn5VWmS27dW3UAmgTq8H7qQnuAQ==
X-Received: by 2002:a17:906:fc26:b0:a35:3152:c46b with SMTP id
 ov38-20020a170906fc2600b00a353152c46bmr1558869ejb.60.1706720654433; 
 Wed, 31 Jan 2024 09:04:14 -0800 (PST)
Received: from linaro.org ([79.115.23.25]) by smtp.gmail.com with ESMTPSA id
 mm15-20020a1709077a8f00b00a363a304c91sm1581384ejc.211.2024.01.31.09.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 09:04:14 -0800 (PST)
Date: Wed, 31 Jan 2024 19:04:12 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 4/5] drm/msm/dp: Try looking for link-frequencies into
 the port@0's endpoint first
Message-ID: <Zbp9jPF2FspZEk6q@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
 <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>
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

On 24-01-29 17:08:29, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >
> > On platforms where the endpoint used is on port@0, looking for port@1
> > instead results in just ignoring the max link-frequencies altogether.
> > Look at port@0 first, then, if not found, look for port@1.
> 
> NAK. Platforms do not "use port@0". It is for the connection between
> DPU and DP, while the link-frequencies property is for the link
> between DP controller and the actual display.

I messed up. This patch is not needed, plus the author is wrong.

Will drop in the next version.

Sorry about that.

> 
> >
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_parser.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > index 7032dcc8842b..eec5b8b83f4b 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > @@ -97,7 +97,11 @@ static u32 dp_parser_link_frequencies(struct device_node *of_node)
> >         u64 frequency = 0;
> >         int cnt;
> >
> > -       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > +       endpoint = of_graph_get_endpoint_by_regs(of_node, 0, 0); /* port@0 */
> > +
> > +       if (!endpoint)
> > +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > +
> >         if (!endpoint)
> >                 return 0;
> >
> >
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
