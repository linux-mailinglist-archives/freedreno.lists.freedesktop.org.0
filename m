Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24F244B527
	for <lists+freedreno@lfdr.de>; Tue,  9 Nov 2021 23:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4087F6E4CA;
	Tue,  9 Nov 2021 22:09:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AFB6E4CA
 for <freedreno@lists.freedesktop.org>; Tue,  9 Nov 2021 22:09:25 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id bf8so1371670oib.6
 for <freedreno@lists.freedesktop.org>; Tue, 09 Nov 2021 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=DPT5pWa6cT8nw3Zv9xh5xFmmq85YU9JvkFn3DJbbeno=;
 b=Eepl0E0INMovuY9E/5rpog6e/jKCyo5Mf5NMvqE+gygcSEWSSwfak8b9jRvDyxJIwV
 XbsyCcK/RVQDnUuh1ed6cRQNrYmeYfIzc4Rcw8U4qaSagdxJ5nO9ylDvR6Gpksurt6KS
 5RZ3DEDXQvUcXuCz53c1nTjSQHHOQOSASdlQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=DPT5pWa6cT8nw3Zv9xh5xFmmq85YU9JvkFn3DJbbeno=;
 b=5WMayYkY3ksx6TAzqydI/PRXng/aTRcyXghBRSbxuEoWV6c8IOwZ/eHMEJtW266h6t
 e9bMcLm4zmXQLipbrOYiylIJjfwwYovPK0Nll4lldsagcn6IZI503b4NzYsNyu5Cpllq
 OBM2eNkRPDXrAuY/2nDRvFfV7iu3Z53ymyMhD9FQfCJviw0aEAQit/6ApggYM7YWISwb
 pXNz58nDdvRycrbF+bJPXchsq8lvzGoJHLlUR7cvQP3Pz99bcEQa3x43NlJ2pCuJW5U9
 kup7znzxi2LNAYflQXjhcfOorvWBbPioYKWfVGxpCgeQS0RXhVOHresGhDCPzDFFMgzS
 RbLA==
X-Gm-Message-State: AOAM53385Jzcn1j8G2tOdFp+1mT2uDzpzDr49gIS6J9GYmziGw/zEm+U
 db5xr1WOGJbFyFlfGKBrXwJZcp3JyGHOzmadYqW+/A==
X-Google-Smtp-Source: ABdhPJyq+WHaMv+pQAv1iUIqLn4EAtyzQnLJaulAUyKW2RUle/i+EGbpt/SBpZiLkLkmUM3ZrpMeVk6x9TtFHDQkxCA=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr8942621oiw.64.1636495764284; 
 Tue, 09 Nov 2021 14:09:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Nov 2021 22:09:23 +0000
MIME-Version: 1.0
In-Reply-To: <20211106172246.2597431-1-bjorn.andersson@linaro.org>
References: <20211106172246.2597431-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 9 Nov 2021 22:09:23 +0000
Message-ID: <CAE-0n51evrWUseEKRbdsfx9nLHuv5YdS89OE3X5Ffs+LLN-35w@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Drop now unused hpd_high member
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-11-06 10:22:46)
> Since '8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon
> Chipsets")' the hpd_high member of struct dp_usbpd has been write-only.
>
> Let's clean up the code a little bit by removing the writes as well.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
