Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D4F43DB2A
	for <lists+freedreno@lfdr.de>; Thu, 28 Oct 2021 08:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906056E060;
	Thu, 28 Oct 2021 06:33:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12756E060
 for <freedreno@lists.freedesktop.org>; Thu, 28 Oct 2021 06:33:24 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t4so6932988oie.5
 for <freedreno@lists.freedesktop.org>; Wed, 27 Oct 2021 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=012a/Vm5/ys3I7xHUTpKoav2CLUL7YSpnaZKJZYXlbU=;
 b=kB6S9D3z3JDO5QzXuz/0sV2WOSEVXZ2qgSY0IZnKfGAJcuUfZn8yCNPiCiar7BGtV6
 p76fd7ObCQ41N8/bGr2+zEQdqFjOZb6RHaCKFtlNwaLIE9o7aFPPtECLa7F04KSjB4T0
 unmdhb6IwfpxRslLEclYxHgHi9c7Ote5ZJZH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=012a/Vm5/ys3I7xHUTpKoav2CLUL7YSpnaZKJZYXlbU=;
 b=2jvXbStmv254WoN2GA37lthSra4JSSH27W/AQU+d1FB+W3HH4VEgWlT4RHrUzSSVei
 hyDibRy52Ou8Banx08x6Ov6UOZbDqGgz3vkWrcP19x6X6ICeAHY2A+PC6sD7tNWvIZMz
 Ov69N+b4EBukrILf7E3rxAT4MaOLnnzA4psLbsFlsPrHvxx+nbMnKfxrCzI57iJASblk
 2XJivKSQEv8RBk7QM7rhe3wipVMNzTWZ2/cWRkheCte1aBhD43bfdIlPIYpZJD3kcOdO
 kJuNQ25dipHIrIdxjPPP6EQXYXXUy7T+S7Rl2EDzxfXCuYJznQTJvnHuH5EfsCW1mkVD
 deIw==
X-Gm-Message-State: AOAM5308pH+7FyxH+jgzV+DxFnvTAzDuvtv0n1d5ChB+5bjXu4nT1ylK
 aA0PFCmI/niu8qyP1NQ/P1fsWtpHQj4S78CourWEJA==
X-Google-Smtp-Source: ABdhPJwKfcrcVbkDjjQUjrvG2947KpA9p0L4TJMaJtoUfNTXn8AL7+GfwN6Z13xYxPFcN24NqTGRjkARDf39SksmrAk=
X-Received: by 2002:a05:6808:a1d:: with SMTP id
 n29mr7024899oij.164.1635402804016; 
 Wed, 27 Oct 2021 23:33:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:33:23 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-5-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-5-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:33:23 -0700
Message-ID: <CAE-0n52b5xKboi6b-J0m-W_rbjgSzyJqhPrMVaZrm65L2GeOFg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 4/6] drm/msm/dp: Enable downspread for
 supported DP sinks
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

Quoting Sankeerth Billakanti (2021-10-27 18:54:46)
> The sc7280 eDP sink that supports downspread will fail link training
> if source does not enable SSC / downspread. This change will set the
> downspread bit in the DP sink if supported and indicate SSC support
> to the DP PHY driver.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
