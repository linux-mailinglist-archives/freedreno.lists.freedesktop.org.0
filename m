Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74866A4F7
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 22:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D6610EAFC;
	Fri, 13 Jan 2023 21:16:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F56A10EAFE
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 21:16:42 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so302127767b3.8
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 13:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tKjknO1S6jYWVxSGQFzTMNbopxapdQjsltHlJg7v1PU=;
 b=hkYPK9+j3r7+rTaq/4IW6XpKf+QsIeI+mRd9qZNFHqLCTqZ2NcwQfyzLwNanKbGsS5
 QyX3keDoEselbsPPQTsHPJdw8L3CFbhcGpVIPuOkiE/vv8Ypgwtk2wC08pdGBbWNSKTg
 7vYl0dZ6gWYasTQOLHf8RlcfD1ySCO/V1sOpTArGzgE9F0qB+RqaeCyv5FYkawKs3sjb
 lwhUmWfGcOCdAemX0+e5FjkAorRuQzR1k1f3F68uwcniz+sYhvLwcUDb+QcjCMWeWM+n
 QUmWdx8Sbx7sAUk/T9Qs5yYqlwd5sHt6pA+8jQbSJfgUcboJMiims2YAhUScRlFve7gS
 Ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKjknO1S6jYWVxSGQFzTMNbopxapdQjsltHlJg7v1PU=;
 b=AyeLDVfnTGDwkscM+nLKNRRtuLBr4UC+NTB14GWYiVHcIvEB3JBNIKqmY09S9ZD71F
 etGocPT5d/MOp5MeMnsk5cBS9H6M+G8c6DKTmpzTkwjR4bpSrNU46GY4FjGkUD5eehYy
 l9F1I2C6lzmHeaYcS+6EckWGbIGso+Co+nOvVFZ/AwYmAfKXerpGuKMFRewJ4gaQ9IQ3
 CYr02NqxJWrZZqGh5iwNYWbsJQMXE5i05c5WjuCa6e+wnorVEL6G7OUx4a6pdlOLYxDy
 V+8fN6DqY8vL7fTpN64Uz+fHY3yCLIWs+9cJ2Vogh8RwusyZQIVAweVI5qx6Gn8OIX07
 ufCA==
X-Gm-Message-State: AFqh2kpwztPlskkJNTaMbTcDvbCcRIbe9p0mcVbMduwVgVp3JAj8rbhU
 g0j/oSnzg39Vkv9eAMp16Z2XkLNPRkNmhaxQqByDRA==
X-Google-Smtp-Source: AMrXdXvsHEnIy6VGFnj70dZWryEQgbOdRjanNoPmgQkBINp89rrbnDHuGYzo6EqaHzcoIKAU676ZVQ9agsfIJ1YQD3s=
X-Received: by 2002:a81:f10e:0:b0:4c0:ab4f:6e2c with SMTP id
 h14-20020a81f10e000000b004c0ab4f6e2cmr4190616ywm.485.1673644601362; Fri, 13
 Jan 2023 13:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-3-dmitry.baryshkov@linaro.org>
 <eae9b5ee-3bf3-8fd4-6d8f-6ac265859ec6@quicinc.com>
In-Reply-To: <eae9b5ee-3bf3-8fd4-6d8f-6ac265859ec6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Jan 2023 23:16:30 +0200
Message-ID: <CAA8EJpopVvFfvrb0rPNhodichLSKsRWo=TOmfXLH38u32hYPoA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 2/4] drm/msm/mdss: correct the ubwc
 version for sm6115 platform
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
> > According to the vendor DT, sm6115 has UBWC 1.0, not 2.0.
> >
>
> Can you please point me to which file you are referring to?
>
> The internal docs I have are still showing 2.0.

If I understood correctly sm6115 = bengal, thus:

https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-sde.dtsi#103

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 2219c1bd59a9..4401f945b966 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -532,7 +532,7 @@ static const struct msm_mdss_data sm8150_data = {
> >   };
> >
> >   static const struct msm_mdss_data sm6115_data = {
> > -     .ubwc_version = UBWC_2_0,
> > +     .ubwc_version = UBWC_1_0,
> >       .ubwc_swizzle = 7,
> >       .ubwc_static = 0x11f,
> >   };



-- 
With best wishes
Dmitry
