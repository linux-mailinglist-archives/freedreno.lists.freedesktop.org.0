Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05574648D
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 22:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF5910E075;
	Mon,  3 Jul 2023 20:58:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A15310E075
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 20:58:27 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bb15165ba06so4400740276.2
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688417907; x=1691009907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=61fmpik8Z7YpXgrDkPK5kpEXwSV1Qu5SSqMtqctrBCE=;
 b=gMurl/iB2fr/RoZYalDTgJLgpXie/a0X4x8szaBEdgzKSfrh4pEKJn23lnBEmUQDfi
 woc22T4tVyqd7FVnqvi8zWWMk6+3nVoVVCB/pT8dVJWbEa/AEf2J4UuCu6PcW8Sbd1Br
 8qOFetLuBMugyqKVMT7v9Uytor5XpV3NCxV3HaMDTVKAxO5vX1SfQidKr0gXSW+Atzbz
 qGAS0yIG7OxOGqA145AR6ObDC6cEB6yY7UTHU9DkxNALIP26GO/A7IwzU1JjMnm+yPyd
 AYa9BBFCj2DvwS0lm5u+lxbX1RgpC5qHjLu0frauY/vmlpMCY+jV53zb0sYYP0W7hepT
 bbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688417907; x=1691009907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61fmpik8Z7YpXgrDkPK5kpEXwSV1Qu5SSqMtqctrBCE=;
 b=he4GxjhS9iYQRf34qDX1sPi6tJUM9pZk8i8K2Kcc2QELePjjFkfKlCROWNzoYmHmb+
 uREOhE9PkFRfe4owZjz/PTb4xWJ7/hdmwgvLmOpUOffdLbl/iJQ42ElVUSHblX9VTQto
 R9NcKXIT6TeTXCb/pR8NtYSYFeY+07Sol6ngN8S/mxa5ERhDOYwr8/tVGg8HTj+kZxRb
 /lD1RmJciK7VQHUc8jS1IPtsIK5IILyrdpElB/VpcRti5FTkccDOkbJYfFFQCQCx0uNo
 9Hdq4S+YLoj0O92nDYNl+rZAM3rMDQF6PzWGBHqCo6ya0juUBfucGuHj6UzlAIxWdF+A
 HISA==
X-Gm-Message-State: ABy/qLY9s6kMRwDfohJdgGBqY9FYHaOB0OvbFPlx7WJM1TzpF5tO147/
 onaE9ZQdQP8aDu+/sscUWL0xkZnKO6JCPD1LCufwZg==
X-Google-Smtp-Source: APBJJlGCiOAwtwNc2ltkHxBFijycW7XEhOaZd/YQAt6du97DF0RFEHd8Oat44g+uZZ7DR2U8bLHQMcxI8lWY/h24HCs=
X-Received: by 2002:a25:744b:0:b0:c19:61fc:db04 with SMTP id
 p72-20020a25744b000000b00c1961fcdb04mr11076515ybc.58.1688417906853; Mon, 03
 Jul 2023 13:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-15-dmitry.baryshkov@linaro.org>
 <b11a9c1f-0f20-e12e-57cd-1bf7f9839e34@quicinc.com>
In-Reply-To: <b11a9c1f-0f20-e12e-57cd-1bf7f9839e34@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 3 Jul 2023 23:58:16 +0300
Message-ID: <CAA8EJprXC531DaTJR1XoCC0ZeHn4q3L2vt6zLMKmYPXyLrab6Q@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 14/19] drm/msm/dpu: inline MERGE_3D_BLK
 macros
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 3 Jul 2023 at 23:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
> > To simplify making changes to the hardware block definitions, expand
> > corresponding macros. This way making all the changes are more obvious
> > and visible in the source files.
> >
> > Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> the value of MERGE_3D_SM8150_MASK is 0, so to be uniform with what has
> been done with some of the prev patches to drop 0 feature fields
> assignment, do you want to do the same here?

These patches do macro expansion (+ obvious 0-field removal). So
removal of MERGE_3D_SM8150_MASK had to wait until patch 18.



-- 
With best wishes
Dmitry
