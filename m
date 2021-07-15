Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F03CA863
	for <lists+freedreno@lfdr.de>; Thu, 15 Jul 2021 20:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECB86E89E;
	Thu, 15 Jul 2021 18:59:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCC66E89E
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jul 2021 18:59:04 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so7237636otf.9
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jul 2021 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uARztaoGqxtCxUXEaCvWao2wggByc75Y4p//QGKTuik=;
 b=LqDvHuMNbdE0uDYqjIOxiAwbKh9hOZDODAww90m7DQpUrwC70XXUuSiu6YEaCAdaNQ
 ghSilahZ7d4up2ZoTWDFxx/t7+u5Tg3UodsaG+ERm94RSO2gVHm6/+cQHjynp6nShTG1
 mLnXZ2KFhfrXejXJU/K+whj+HikZ8JbISEJ5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uARztaoGqxtCxUXEaCvWao2wggByc75Y4p//QGKTuik=;
 b=iDV+WXI6WenPfkoLbQkCSkTh8Maqe7u3ml2WTGlunb46k/i2xjItzL3f6/qwE7PE5Z
 q9pBq8rC94rU4gIHUsbmG0qN94QYNQ8KEoxu3sSOxN7hT5QhvBhXkew4UFz38SWjdkQc
 UFAoeLi7x7k1Dj4zCZSAD1fSPplWFQZplNZzmPjBPFn2YEkMFUVKj5lJFVR1d+6lfWcu
 4nKeEry5QOwdY4XGOFNH9tfTPm/2QsIDh8Vqgj6gkH2I+AQxyIYe0e3Echa2CN08vOIX
 RXOUJNhzCSYZhBm3t8HVOsaFWWWJJxgrzwTIJMqYxImjyVjz87UFZ651bhbf6TFLeASA
 ZH/A==
X-Gm-Message-State: AOAM530+iTup7Bx5vWWnzCItVrMtvrPCHxrCROsBVuPIthH3811F+K0F
 NUc0lkMg7XW8C3dMtT1bozgo+Fs+gU9zMXxKfT2krw==
X-Google-Smtp-Source: ABdhPJz2Jj/5ttUOdkAzHnEsQQtTBLdlipJ0FFoTKaILvuwmNCpcrDU/Ba0wfcqwVexPBLr2ZVKReu7ek9znD8Q5/l0=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr4993040otf.25.1626375544249;
 Thu, 15 Jul 2021 11:59:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jul 2021 20:59:03 +0200
MIME-Version: 1.0
In-Reply-To: <ef24f67a334698610b7b8e607a727b5d@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-3-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52WyMKdQ96ji=5YLBxpndgB_CLsxscXaFexMPdLducrkQ@mail.gmail.com>
 <ef24f67a334698610b7b8e607a727b5d@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 15 Jul 2021 20:59:03 +0200
Message-ID: <CAE-0n53M1XWa1Ng-+bBLQyKLRzabbTOofOMqknQbF+PWuE6=hw@mail.gmail.com>
To: khsieh@codeaurora.org
Subject: Re: [Freedreno] [PATCH 2/7] drm/msm/dp: reduce link rate if failed
 at link training 1
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-07-09 10:46:41)
> On 2021-07-08 00:33, Stephen Boyd wrote:
> >> +
> >> +static bool dp_ctrl_any_lane_cr_lose(struct dp_ctrl_private *ctrl,
> >> +                                       u8 *cr_status)
> >> +{
> >> +       int i;
> >> +       u8 status;
> >> +       int lane = ctrl->link->link_params.num_lanes;
> >> +
> >> +       for (i = 0; i < lane; i++) {
> >> +               status = cr_status[i / 2];
> >> +               status >>= ((i % 2) * 4);
> >> +               if (!(status & DP_LANE_CR_DONE))
> >> +                       return true;
> >> +       }
> >> +
> >> +       return false;
> >> +}
> >
> > Why not use !drm_dp_clock_recovery_ok() for dp_ctrl_any_lane_cr_lose()?
> ok,
>
> > And then move dp_ctrl_any_lane_cr_done() next to
> > drm_dp_clock_recovery_ok() and call it drm_dp_clock_recovery_any_ok()?
> no understand how it work, can you elaborate it more?

I'm suggesting to make a new function called
drm_dp_clock_recovery_any_ok(), written next to
drm_dp_clock_recovery_ok(). Then call it from here instead of implement
it locally in the qcom DP driver.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
