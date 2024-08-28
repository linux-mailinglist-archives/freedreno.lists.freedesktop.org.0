Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95AF963158
	for <lists+freedreno@lfdr.de>; Wed, 28 Aug 2024 21:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F8A10E0C6;
	Wed, 28 Aug 2024 19:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WeSXeaiR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A17A10E073
 for <freedreno@lists.freedesktop.org>; Wed, 28 Aug 2024 19:59:52 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f4f2cda058so9434611fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 28 Aug 2024 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724875190; x=1725479990; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d8zHkfisckPodXDwU4YrlbbeO+jKzfoe0P8xfdKKL2o=;
 b=WeSXeaiR/kgWD/UoLZllvpKtyfsODIbxbwlgWgIGE27BFOdDWsi8zDgkZ/kq+34Bmq
 apxduMl3nczwVWgDZ88FX2sJMPndFkqw/4oJKpK5toONZNK7ekfBxaoGNoWNwxy8UvCi
 nQk68x7K7LEb+gh2NRG9VxVIIJlUmNX/PdBWIKN1J/kxHFGF12HJNMxunH0jJmDemA+J
 jQw4XAb+RKdE5t1WjXxPX25xQvk8dlnr/KWgN9by9xi5V4bACp1WTDvRilXwa54mUmuf
 xuCh3PrcFFQCWKNBtUPiqfUpBL22NAqB99Ee9CMcfwCNQ3zgSN2jIXn0SsaaiVo2D363
 QKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724875190; x=1725479990;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8zHkfisckPodXDwU4YrlbbeO+jKzfoe0P8xfdKKL2o=;
 b=Zhy3/mSO7V+mr9VM0LXMgWb5vZpkLyPIprd1llHiRlYkrAWZ4qsIDK58WuK+Oli++L
 ujvDLPpZdXCvhet5t+fQI74FPcqxJZAm/z2dQrxjKPnVK3X0nvom0mAwZZafrexYIshS
 NstLyS5BlZhq9q9AErFOhqce0H/7P5ri+NblS098ijOmJQjt2XoU0Rdt2pAVy1SMKyi+
 x7wKNyuOJwQbXrnYAemJWyNim4zH+GO7URm9ep6aXkh+zRl1KaMdgZJ4MoeMTBQgoWQl
 YNotIYyEg/KUxijApmEPF0Fa7hLmpueZwPVYj7xVkNK6YmiXSKKzB6mBMRKlGnaazYpK
 GV2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWePnUfSjWShdcT2kIc/nYH9dleElDIW03TrHjvlXwIKXd9X9vv+p1CRwt/19M0ZjocAwxQfF73ciU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQFYiZ+UHKJW/UgyRN0w6nRIW4zjyoV+QP0nJS87TPQcS+VDrL
 55rq89ooQ3J9wdYtFhcTTTZ+FB5xMjs7Qp2yBBs6eP0qKlMxzu3fnYIqWTCWbGA=
X-Google-Smtp-Source: AGHT+IHUPZgRjwjhGXUYisGlSBvBIIptTwT7XL/6mzdnfRbs3tQwYO6A+cS/VdeREgw8PkHAmaFlbA==
X-Received: by 2002:a2e:a989:0:b0:2ef:2768:619d with SMTP id
 38308e7fff4ca-2f61299bce6mr827061fa.5.1724875189428; 
 Wed, 28 Aug 2024 12:59:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f40484c6c0sm20011361fa.75.2024.08.28.12.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 12:59:49 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:59:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
Message-ID: <fbhb7hlpmxxfqv5iwtuhuxz4nx4qifd6kygo5fxvfiqsh2idpu@tzqwxkxaszq6>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
 <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
 <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
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

On Mon, Aug 12, 2024 at 12:41:40PM GMT, Abhinav Kumar wrote:
> 
> 
> On 8/12/2024 11:40 AM, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2024-08-08 16:52:27)
> > > sc7180 programs the ubwc settings as 0x1e as that would mean a
> > > highest bank bit of 14 which matches what the GPU sets as well.
> > > 
> > > However, the highest_bank_bit field of the msm_mdss_data which is
> > > being used to program the SSPP's fetch configuration is programmed
> > > to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
> > > 
> > > Fix the highest bank bit field used for the SSPP to match the mdss
> > > and gpu settings.
> > > 
> > > Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > > index d90b9471ba6f..faa88fd6eb4d 100644
> > > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > > @@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data = {
> > >          .ubwc_enc_version = UBWC_2_0,
> > >          .ubwc_dec_version = UBWC_2_0,
> > >          .ubwc_static = 0x1e,
> > > -       .highest_bank_bit = 0x3,
> > > +       .highest_bank_bit = 0x1,
> > 
> > Usually when I see hex it's because there's a mask. This isn't a mask
> > though? Can it just be '1'?
> 
> I just retained the same convention that was used earlier. It seems like a
> mix and match right now. sc7180, sm6115 and qcm2290 were using 0x.
> 
> I can post a separate change to change all of them.

We probably need to do a +13 to all of them to follow the approach of
the a6xx code.

-- 
With best wishes
Dmitry
