Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B274441D066
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 02:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BE66EB0B;
	Thu, 30 Sep 2021 00:02:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F866E2B4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 00:02:41 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so5082784otv.4
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 17:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=sz4qPh2dIGtWybWIz2+FjL1xXs0xQ2gcPE6MG4pSh9s=;
 b=G5lm0rNGleMtnm89OwP5wrX1UP7DVgf1ffpI+keySiETKAx+04oGYa2qSV9N45Dae5
 4oSFDuhP7WYfWr4MFksVnueKfrzQ5VwNgoqGiHqwEFI9DEoNAs7RrciO/LQx4rFXBuY4
 WL/6osoaLWCDuTBcByfs5EdFt7hXSfiLPRyBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=sz4qPh2dIGtWybWIz2+FjL1xXs0xQ2gcPE6MG4pSh9s=;
 b=QrioN7bzhH+koZiszBcLLw5RRk/08ryPqG13v7jlRmXACP+M5d3BNAuee/l9Ta4S4D
 uWeqWHMs0ZPH8cyChHRA7rkTQunUPZWFdLub3xrXTBUXTm/mV3uoG3uh2OwgtQaJoAML
 S5kYyGVtJRUBUQZceM5Rzj+m3WtSc+CeuG4NTrDgWZD06lkcr4Be+4+/4MpdSRJLvc2Q
 9Cdugfgmo2IDmWtmM1OWby9ElS/Z27wx29hkgpAXVwVODeej6rA+BxzPzxw1uIzFtcxp
 J59fgc4XuT+eJklk/LdU0wKB8TuFJizQuxSn5mkTPj4qs6dswKsMmfi5dgjk8KJEPjxc
 3pWA==
X-Gm-Message-State: AOAM531GrxFIAzNX6v77pesgXkx80JMLRkNEvNmJmj+IVoYITGsDNlup
 ufXsq5iVu4LHMLzux3irrSbp4M+E27gAZVCaEUnLPA==
X-Google-Smtp-Source: ABdhPJxnw99W4CrkwEhmaBpAMawQdJMBR5h0AmtsSMqnz3MManm3XK032vWPW2BVu2aphVCq7lnE3qq6RcZ6fDGC+FU=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr2543966otn.126.1632960161028; 
 Wed, 29 Sep 2021 17:02:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Sep 2021 17:02:40 -0700
MIME-Version: 1.0
In-Reply-To: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
References: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 29 Sep 2021 17:02:40 -0700
Message-ID: <CAE-0n52iO3rSE59OBOgJ1sZMckweoBxN5ih9fY2dg_ht9cctfw@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: only signal audio when
 disconnected detected at dp_pm_resume
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

Quoting Kuogee Hsieh (2021-09-29 09:17:04)
> Currently there is audio not working problem after system resume from suspend
> if hdmi monitor stay plugged in at DUT. However this problem does not happen
> at normal operation but at a particular test case. The root cause is DP driver
> signal audio with connected state at resume which trigger audio trying to setup
> audio data path through DP main link but failed due to display port is not setup
> and enabled by upper layer framework yet. This patch only have DP driver signal
> audio only when DP is in disconnected state so that audio option shows correct
> state after system resume. DP driver will not signal audio with connected state
> until display enabled executed by upper layer framework where display port is
> setup completed and main link is running.
>
> Changes in V2:
> -- add details commit text
>
> Fixes: 078867ce04ed ("drm/msm/dp: signal audio plugged change at dp_pm_resume")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
