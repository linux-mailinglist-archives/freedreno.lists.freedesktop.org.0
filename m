Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF05751459D
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 11:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012810EEFE;
	Fri, 29 Apr 2022 09:44:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C9810EEFD
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 09:44:40 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ef5380669cso79426797b3.9
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYCGVCEJksGGCdRlgIqjR2lhvuooSLq5edP8oO1Q4Gc=;
 b=qXTCKdPPbH69hhnz+M+TPUAGCmNzy6PuGKgWs0JHwB2aoBg7hrjTPaMZoAoIQDoWSs
 0lmnwzpo47pGHqJUzmoSLgH0xxs4vpYqKs5VaNkLhIjt4xe9NBaCxYnD5rZfSLgbIvMm
 zgsM0ilvnK84KcGPdNndif0vtYd6QRYkZJD3a2KzeKri4hyAji+GDZtusBC2mSHRCr6p
 SHFXwtn+sHZPaLC6Fb5Q0NESuoOi44uDggQGTZz3h/jeU4OWkJiRd3uhm2tuN+g2bh9f
 3Z9w0ZVNZJEs1+L18TcczTi8dfVqr4yn0gF8OPbL3O5iS7U8siW5kSCj9kKn8nzEQQc7
 3MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYCGVCEJksGGCdRlgIqjR2lhvuooSLq5edP8oO1Q4Gc=;
 b=QQyRG0wLQ8P2eS9UcUYCGMRL2TS906jK2BLdCGD7ksF4aQNh+Y+nmkDXzTPD1R3zOq
 j6ql2tN507tYnXO7crvBEPL/HWXjDTewSqo6FA8KNIY1ud/mMhSFZOaAZSBdqTNDOpsi
 5+yhtg5D9fZ5++Qz/M1bl9x6YzZGhwM4+HUazS7vIWcigaRRQxdNmOG3rOqtX6JUd6w6
 s2DhOgHwCJK6KhSuNTYzfHF1Nb4PS3QyPt0yMmMMYtIhnFD4IB94I6jahmzRux6/S0ai
 AHkmXbxqroCw4XeM8tVEYAi6e4+y2jPUhx5t+sy7MHwXOjG6UIu87xwksppw9vSiGMqp
 8OUw==
X-Gm-Message-State: AOAM5314dbhDNDeoYR01trkdrngq6v3/MD9fwCawy17g+Oi0EOuy7kAK
 s2m5WsvYKFWAcGTA3Nihkpadxd0znDFI/GPL7mkdEg==
X-Google-Smtp-Source: ABdhPJynZzoVZwfjlCOF1/abA7cHNOUV/ui+HyQTclEHfZp0K+s8TqPA+IOfsxjsI1xMK2BMg4DLPDanu12s14nmOyg=
X-Received: by 2002:a81:5603:0:b0:2f8:3187:f37a with SMTP id
 k3-20020a815603000000b002f83187f37amr15645499ywb.255.1651225479645; Fri, 29
 Apr 2022 02:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
 <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
In-Reply-To: <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Apr 2022 12:44:28 +0300
Message-ID: <CAA8EJpqCwe_mr60SpFNfK8rE84RoA4EzAaPw-rC-PGmdB99ytQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate
 directly
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 at 04:20, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > The only clock for which we set the rate is the "stream_pixel". Rather
> > than storing the rate and then setting it by looping over all the
> > clocks, set the clock rate directly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks! I think this series can be queued for 5.20 then (probably not
worth rushing it into 5.19)

-- 
With best wishes
Dmitry
