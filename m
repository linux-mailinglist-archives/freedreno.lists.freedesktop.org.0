Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6F7794618
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 00:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9360710E731;
	Wed,  6 Sep 2023 22:18:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4508810E730
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 22:18:54 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d7b8d2631fdso312816276.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694038733; x=1694643533; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEcTm+XzAutmtIHBz/dQY7Dk0HGJ+IZm2yIDEFBU9hs=;
 b=tXqjLwjzyPN630qWED8kV8XfXZ5btlqq3ZMWysMyJ7r1pnf/GF2rqXi53/mEGeMTdu
 +mQXi2f5q552l71YEFIukwAsWafGuDGKXCfmXom9fjNY1oxwoQY58gWH08T1Y6lEi4gz
 eYykRUJXYuCRPqMW2qL+fV31M4HH1ErEtDoPnOv2i6nKxxD5IPAUZl/+W0ATgCkfqGJv
 0YC6T5Xx377C02E0P3jrP7JpS5VwT0hY3fedKuyeJhzcWMrEQi9tf1XVwszMRKk+xEz2
 vQM308mttUzZCDEFPizZn9V4qzxYha21n4kxk6XLU7OTRHYtn1k292QmuYG2ZYRDT9aN
 DnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694038733; x=1694643533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZEcTm+XzAutmtIHBz/dQY7Dk0HGJ+IZm2yIDEFBU9hs=;
 b=M+gZgXjONrnt66V1UUsInDjzJausTdkqRKHqY/gDqxq9VbzHTrf4A6NfNTL2LpT3YU
 5CsL9Hm3mrPPApOxNU46dexJFTeRNbM1i0RBYCbkoGOqdsDdwIwZVX/89/5+hpvK4WV0
 WcG8VK6G+JLZBmtxQw5S/LV2Ok4nTtGcIRbUNN9jc7ShPS0UbQhuEZDkgNcq37WthbSH
 WzdzMk5hFZwz54UuTE9HhU1rzqOnFexSxh5dL1IgC+zQP6iW71OW5g+ROfbmYrWMs8EO
 rIZryiqfafmxiHwnGZSCe8gNysvtN0PAUD5EHGMsCSTeL5bykEtzm0xUkZjOuZX8pvrR
 nJ5Q==
X-Gm-Message-State: AOJu0YzN+Xa0hW2NIm94ihxX/8iqo0jVGoJBfX5H1wl02kzjWk5omOi9
 FIxvBSmNnID//lUZuoTg/4bVnOzXndIaOQ2EwFr2dfpCoxbNtSz8
X-Google-Smtp-Source: AGHT+IFbQ1dhqzJXEeGW73jpwvBotnPBYOgj+Q3yJ4ybSLAVHnNCHtXVhevoeZrBqNfl+r3ytMkYJmcUNUWUETNKu1s=
X-Received: by 2002:a25:c0d7:0:b0:d7f:2cb6:7d8b with SMTP id
 c206-20020a25c0d7000000b00d7f2cb67d8bmr10275064ybf.63.1694038733402; Wed, 06
 Sep 2023 15:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
 <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
 <CAE-0n51oha3TmMHRX7pedDzO1iOxXhbYS9nT8rdamki0LyAbqQ@mail.gmail.com>
In-Reply-To: <CAE-0n51oha3TmMHRX7pedDzO1iOxXhbYS9nT8rdamki0LyAbqQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Sep 2023 01:18:42 +0300
Message-ID: <CAA8EJpq2i2+pyb4SQo-U3ZpVOgXec1s8mg3w-9u4onrYiQnVyw@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/6] drm/msm/mdss: generate MDSS data for
 MDP5 platforms
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 7 Sept 2023 at 01:10, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-09-05 10:43:49)
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 348c66b14683..fb6ee93b5abc 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -222,6 +222,36 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
> >         }
> >  }
> >
> > +static struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
>
> const mdss?

Ack

>
> > +{
> > +       struct msm_mdss_data *data;
> > +       u32 hw_rev;
> > +
> > +       data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return NULL;
> > +
> > +       hw_rev = readl_relaxed(mdss->mmio + HW_REV) >> 16;
>
> Or like this
>
>         hw_rev = upper_16_bits(readl_relaxed(...))

Ugh. That looks ugly, I'd say. >> 16 is more common.

>
> > +
> > +       if (hw_rev == 0x1007 || /* msm8996 */
> > +           hw_rev == 0x100e || /* msm8937 */
> > +           hw_rev == 0x1010 || /* msm8953 */
> > +           hw_rev == 0x3000 || /* msm8998 */
> > +           hw_rev == 0x3002 || /* sdm660 */
> > +           hw_rev == 0x3003) { /* sdm630 */
>
> Can we have #defines for hw_revs and drop the comments?
>
> > +               data->ubwc_dec_version = UBWC_1_0;
> > +               data->ubwc_enc_version = UBWC_1_0;
> > +       }
> > +
> > +       if (hw_rev == 0x1007 || /* msm8996 */
> > +           hw_rev == 0x3000) /* msm8998 */
>
> Then we don't have to worry about these two having typos.

Ack

>
> > +               data->highest_bank_bit = 2;
> > +       else
> > +               data->highest_bank_bit = 1;
> >



-- 
With best wishes
Dmitry
