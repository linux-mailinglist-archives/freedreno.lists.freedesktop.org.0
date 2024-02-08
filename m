Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88984E238
	for <lists+freedreno@lfdr.de>; Thu,  8 Feb 2024 14:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774A010E30C;
	Thu,  8 Feb 2024 13:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FO0vnxmK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5E910E355
 for <freedreno@lists.freedesktop.org>; Thu,  8 Feb 2024 13:46:32 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so2323933a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 08 Feb 2024 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707399991; x=1708004791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ScIY/HfFAFC0b03ICHw/iCduUDonnVRODJKogMNZR60=;
 b=FO0vnxmKmybCbHShCiCbQzjOyxp2Ik0mNnHmZreUks3fxWO72WvzMqMuW0BDO1eDSE
 V0sEhkCrh9NlQ4ny+26qLGtLmoQOolGl76tDGMqng6j1kJMrQkE3fF6uf9oAh8OAq0o7
 SrAy2pRZd8qTo8UNr/01oYbsHq/LU9lve8f/rgMYPvv6i4wA8fzg+tGQlkkJl/cBvA+m
 XSKswIQOLRRsogtnJVVTRoZyrPgM+OZqA3wiHgkQim74P2JR2Qvh1jXAz6x5PG6S1goR
 wqyof7hity2AaEC275yyhofgvJWXksr0Si67DjLwkrl203cvAqrJmw+itTwsIYy88AE/
 YtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707399991; x=1708004791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScIY/HfFAFC0b03ICHw/iCduUDonnVRODJKogMNZR60=;
 b=SU92cXsrQ772R4bl1X+Bd0eLlXMzQ37v0A8+6U4KmkA9R2K6vILD/2v/UTlCwuibjx
 VNpPJvm4GGtnJ2agFDIRxkx1S/RUFX/8/Udn0e1ZHPPEUyMzqu83qGvgnsLqmg/AgPrc
 rnWDSMQz+uxSJ7Kk5sMSLPfwSgqANLr+5o3EcfCaca5bmrsvRKp+JasHyPXSwJTWG3dM
 JR+qpVwnG5z4XSexbgs0jERQpJ4QWNk+Lo0ozbGpFhoxdeDfQW9TrJh+X6YS8RAG/ExY
 PwUJBVBQJOIfNcrrg+4SqUF3LbKWroZlGsS4oEdBNHsGbtP3oPMXJxlshA7F0cl1HRrs
 Qjlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwIzfVuaZYNgjkXnr3JlLg+adCGUiPF+945zYuZq+7FqwS78r5uisH/0cJMM0e9HeSe4G8uus4XoAoCL8qWTDoEGrvyj8psjIDZDpZ3ugG
X-Gm-Message-State: AOJu0YzhuFLRZfiSHKjv2wdqrVJjjuNixoZDwjzzNdEUSSU3vOofWpcr
 kfH/cA4o+4cWomVRf8TygEe8GoazNDiw3tPnTQSUIuaxGmrR5+GLEwZcOtuDdXM=
X-Google-Smtp-Source: AGHT+IGEgAx+YtgSvXCAni7u/Q8jcZGz0YDpaUwhJjgeCBWNA0up0ixKRS6a2nAtCknTAG1DqHHXwg==
X-Received: by 2002:a17:906:1301:b0:a30:be5e:c8e7 with SMTP id
 w1-20020a170906130100b00a30be5ec8e7mr6149015ejb.44.1707399990675; 
 Thu, 08 Feb 2024 05:46:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXHgo6p4vMeqamFxEUAZUBJTOGpfgaf7zXt6WvJjoWOxUuHPxt3L0HDV+aOXE8Ee4nigmxEyNtLEAVfjthhf3+6/6j7nMxe2NUNLrQjGUvDL7NwX+0ZbVlmeUeLbAVRjlF4JcOA+dhsDAiRj+AGdswPXrjhdZ+oLhKmL1F6APFe86LCXRrI/kmODJrSFskXiJXcxeSBdjbTX/pL2J0NoOTP01h7cz6CbeCBWGkHiXnPA9glRi14it47kfnZWnOQ1I7HSBq4td6n82iw/n5i0zDrYjqfMJHDF064Tr0L3Xahs6cpMZ+SFWPgOjLvngZFTx05Uoshk+uA0B0guYxoY5fWTLgNRSj2e8cnaY5hAiR077McfoandG+LW3Qn6O5IMtINkWa7pHh6ApPC3m5ov8BxMF0dJ5i5vzh+1ghmbaSWGINAlrAbKQ4kylfhGdLMJF1w2tlVpjml2q14i7SeLHoIHbJAUNrnuNf2lp5fQITZ2kqXu8PfUsXBl6/Q1W6cZTHd+YlBvyYUP40BNvVfX0YWtqbD7nC+y9QuEkVxKt3/RC1qk6HX/KTtqPSgqqQ5cRJpeLR4kVwEvF/yy8MjY3rAVvzUdQUyEGnWTiDNnYuiU7z+pOsOzKx1z78/96YllhRuTdqTw1sEK+iE4Q==
Received: from linaro.org ([62.231.97.49]) by smtp.gmail.com with ESMTPSA id
 y15-20020a170906070f00b00a3729ce6321sm53206ejb.166.2024.02.08.05.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 05:46:30 -0800 (PST)
Date: Thu, 8 Feb 2024 15:46:28 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
Message-ID: <ZcTbNGVGT/Kwtc68@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
 <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
 <ZcTZL+fls7A8O9P0@linaro.org>
 <CAA8EJpr3p286ff1pHhhBdF7GA=g8Pnv9yWDukwnnNaOuykPcTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr3p286ff1pHhhBdF7GA=g8Pnv9yWDukwnnNaOuykPcTQ@mail.gmail.com>
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

On 24-02-08 15:42:04, Dmitry Baryshkov wrote:
> On Thu, 8 Feb 2024 at 15:37, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-01-29 17:11:25, Dmitry Baryshkov wrote:
> > > On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > >
> > > > Add support for MDSS on X1E80100.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > > > index 455b2e3a0cdd..eddf7fdbb60a 100644
> > > > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > > > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > > > @@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
> > > >         .highest_bank_bit = 1,
> > > >  };
> > > >
> > > > +static const struct msm_mdss_data x1e80100_data = {
> > > > +       .ubwc_enc_version = UBWC_4_0,
> > > > +       .ubwc_dec_version = UBWC_4_3,
> > > > +       .ubwc_swizzle = 6,
> > > > +       .ubwc_static = 1,
> > > > +       .highest_bank_bit = 2,
> > > > +       .macrotile_mode = 1,
> > >
> > > Missing .reg_bus_bw, LGTM otherwise
> >
> > Dmitry, I do not have the exact value yet.
> >
> > Can I come back with a subsequent (different) patch to add it at a later stage
> > when I have that information?
> >
> > I see no point in holding display support any further since it works
> > fine with the default bandwith.
> >
> > If yes, I'll respin this series right away, but without the reg_bus_bw.
> 
> Please add a TODO or FIXME comment there.

Sure thing. Thanks.

> 
> >
> > >
> > > > +};
> > > > +
> > > >  static const struct msm_mdss_data sdm845_data = {
> > > >         .ubwc_enc_version = UBWC_2_0,
> > > >         .ubwc_dec_version = UBWC_2_0,
> > > > @@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
> > > >         { .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
> > > >         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
> > > >         { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
> > > > +       { .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
> > > >         {}
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, mdss_dt_match);
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry
