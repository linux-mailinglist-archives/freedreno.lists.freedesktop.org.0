Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7C38F38F
	for <lists+freedreno@lfdr.de>; Mon, 24 May 2021 21:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C36E5B0;
	Mon, 24 May 2021 19:19:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566418921C
 for <freedreno@lists.freedesktop.org>; Mon, 24 May 2021 19:19:12 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso26292587ote.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 May 2021 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AsmfRYALyOOPiklFnGLxIxG22/ZrSMjEGdTaIKdv2bU=;
 b=Z6K9qOtHmxNbIvyG9A4ac/vZr8tgn/cWTSgKRQvY4akWmBp6biiPaGssozi+HjDJ6N
 J2iwMafMFTIkGAGFdavLMTAX576r/cJrnUVzQoc5vnJOl4iJDionu1Toua7Pyr+Ggbdt
 05WC5Vk9GH6M/SjqEXJINc5HHx2d/+YYaawdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AsmfRYALyOOPiklFnGLxIxG22/ZrSMjEGdTaIKdv2bU=;
 b=EfNUKEE6upnBk4/WXbuFfEhJP/sc8egJAD2lH97aOFDchryd75/nSXNrvrLFJDevAt
 OgGoGOk2UiEKfNhLVD6GHEl7T2Ds/YYaWZQt9oaW1yF5XpDmwMN6zoU2+3rHugBWjfog
 RqPotfBjESN1pW7hazmC/u3EMiQBIh8/T9J1mDMSQP9pLCVw/llWFF7OYhNwACY0ncye
 jwVwf6woKyctJ/0wYGHsoE8aCTRPMg3VMINLdIVTDJFZu777QutMOzpMX3JXvki+hAWZ
 vHfYxVBff0MqHYgV6/g/m6VwrhFXADSYY1A0S0V/K+uQ6u38zPiVEt+KCFeUCwJIICTR
 UiMA==
X-Gm-Message-State: AOAM533JnUfZm/sIfBU7fuMomYNgAGc0HSo01UBrP4BuS2XCCRk/OVzk
 56vWf/zVV73Hdv8UlH/VeUsGLNctpBvuH6ms4ZtL+A==
X-Google-Smtp-Source: ABdhPJyZvnN47Xm+9vSAQTY/yVMkjuiMef8z4kEdnt1y+yOYDWPBCdNJk6g1rCvHRsb/g3TvNREw/LN0Y4VqyfCekTY=
X-Received: by 2002:a05:6830:3154:: with SMTP id
 c20mr2433314ots.233.1621883951712; 
 Mon, 24 May 2021 12:19:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 May 2021 19:19:11 +0000
MIME-Version: 1.0
In-Reply-To: <1133b2c21eb8f385c16c610638a17d9c@codeaurora.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <20210507212505.1224111-4-swboyd@chromium.org>
 <1133b2c21eb8f385c16c610638a17d9c@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 24 May 2021 19:19:11 +0000
Message-ID: <CAE-0n51G2NGyE4w1ebdBd1svVPA3QvPZX6kivKA1m9o1XhE26A@mail.gmail.com>
To: khsieh@codeaurora.org
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dp: Handle aux timeouts, nacks,
 defers
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-05-24 09:33:49)
> On 2021-05-07 14:25, Stephen Boyd wrote:
> > @@ -367,36 +347,38 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux
> > *dp_aux,
> >       }
> >
> >       ret = dp_aux_cmd_fifo_tx(aux, msg);
> > -
> >       if (ret < 0) {
> >               if (aux->native) {
> >                       aux->retry_cnt++;
> >                       if (!(aux->retry_cnt % MAX_AUX_RETRIES))
> >                               dp_catalog_aux_update_cfg(aux->catalog);
> >               }
> > -             usleep_range(400, 500); /* at least 400us to next try */
> > -             goto unlock_exit;
> > -     }
>
> 1) dp_catalog_aux_update_cfg(aux->catalog) will not work without
> dp_catalog_aux_reset(aux->catalog);
> dp_catalog_aux_reset(aux->catalog) will reset hpd control block and
> potentially cause pending hpd interrupts got lost.
> Therefore I think we should not do
> dp_catalog_aux_update_cfg(aux->catalog) for now.
> reset aux controller will reset hpd control block probolem will be fixed
> at next chipset.
> after that we can add dp_catalog_aux_update_cfg(aux->catalog) followed
> by dp_catalog_aux_reset(aux->catalog) back at next chipset.

Hmm ok. So the phy calibration logic that tweaks the tuning values is
never used? Why can't the phy be tuned while it is active? I don't
understand why we would ever want to reset the aux phy when changing the
settings for a retry. Either way, this is not actually changing in this
patch so it would be another patch to remove this code.

>
> 2) according to DP specification, aux read/write failed have to wait at
> least 400us before next try can start.
> Otherwise, DP compliant test will failed

Yes. The caller of this function, drm_dp_dpcd_access(), has the delay
already

                if (ret != 0 && ret != -ETIMEDOUT) {
                        usleep_range(AUX_RETRY_INTERVAL,
                                     AUX_RETRY_INTERVAL + 100);
                }

so this delay here is redundant.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
