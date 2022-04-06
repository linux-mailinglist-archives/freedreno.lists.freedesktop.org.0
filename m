Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD524F62A6
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 17:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4129510E178;
	Wed,  6 Apr 2022 15:09:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDB910E178
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 15:09:16 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso1912294ots.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Apr 2022 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=n0YAsSJflCGF17Y0CR0O5w5xtp+VT/eBUOzd06C/67A=;
 b=nt6HFrO6S4nJO5qShNjR/7i7MnFB2r+0qZ7G8mTuqwFw7QqpnlX7iOCRWBtKU9dmWN
 02o4oH2sKqTiuuOMFcHpXVZpAHLAYJB0cPL+gY9LCvFyYHfatrW/QowE2xVkXKDcFh6N
 PcDJys37DNbIh1Ivdt8hT6c7TqNwvLPrVRfrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=n0YAsSJflCGF17Y0CR0O5w5xtp+VT/eBUOzd06C/67A=;
 b=OE0AbLKVK8ArXbiQF1OG+B2LmcjPGvN6Btc2tOyUBxZ+zTcoydYY/npRh8VC+zPRSh
 Wd12wIxssSiP1zHAJwOgLdTBwYbsYA/wU0ZiQE1Ky7zaCk6Cl4wNKi0JVFOnRBgTiHeC
 NYWagBK7h9ODgp4Yv5JHQUb/eXL5l0BK2kpG7ulYvnqhD52nW8j4lA1rCQLYwvUVvElw
 QPMJ4WskC0taUJNTTTrjOV7WJPlRCVXG3HDy5RJV6rxB8tkHZhJhLaNr8sgYAlasoahS
 sQh6b22OETsTT/7mtfEUSPfxgeSgkMG1+9nz438t9FAb69p7yTJOpKQKzibB5h5lkxXg
 XGcg==
X-Gm-Message-State: AOAM530CH6+oSxypuO4o3pPJG9n8tFaLBASNuZJhKQQrjBC/opQ0WFgB
 vaHqT937MG529kstg76a4Y4AY0bWjuRZkc4ZLH2AJA==
X-Google-Smtp-Source: ABdhPJwY2K8gzH413UXm6KXC3GBFZaVngaMQK8CtDE8wz/y+//wltFYxSuFffZiD4gecnGqEKCSEQx3687G9pOM0Q30=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr3142392oth.77.1649257755820; Wed, 06 Apr
 2022 08:09:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:09:15 -0700
MIME-Version: 1.0
In-Reply-To: <9868aa33-c423-5338-6205-ec61c18c67c1@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
 <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53p7MsvwzqzzyHdRzX2XV9_Lv7poTuZMQowha0=f=QZSA@mail.gmail.com>
 <9868aa33-c423-5338-6205-ec61c18c67c1@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Apr 2022 08:09:15 -0700
Message-ID: <CAE-0n519eqMMzv0HXmnYob4RUtdmMbdTn=T5EPc5pDQHNHcGsA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/hdmi: properly add and remove
 created bridges
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-06 03:21:25)
> On 06/04/2022 05:51, Stephen Boyd wrote:
> >
> > Is there any Fixes tag for this? Still seems worthwhile to have one even
> > if this is a lockdep warning.
> I thought about this before sending v1, but ended up not doing so. Each
> of these changes is not atomic. A call to drm_bridge_add() without final
> drm_bridge_remove() in the core msm code would leave dangling pointers
> in the drm core. A drm_bridge_remove() is not sensible without
> converting _all_ users.
>
> So there are two alternatives:
> - leave this patch series as is w/o a Fixes tag
> - squash four patches into a single patch and add 'Fixes: a3376e3ec81c
> ("drm/msm: convert to drm_bridge")' tag
>

The atomic change. That's because bisection could trip over these
patches and then break because it picked the middle of the patch series.
One atomic commit fixes that.
