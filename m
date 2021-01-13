Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F72F53FE
	for <lists+freedreno@lfdr.de>; Wed, 13 Jan 2021 21:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE3489259;
	Wed, 13 Jan 2021 20:22:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630AE89259
 for <freedreno@lists.freedesktop.org>; Wed, 13 Jan 2021 20:22:13 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id q4so1713152plr.7
 for <freedreno@lists.freedesktop.org>; Wed, 13 Jan 2021 12:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=uYdhB/IsYvawJycPiJl/5+j+upKU06AcD0VCLNhUlaw=;
 b=Rnw8wZNgL/NU7d2j/IIT/v+xRriznTX2qmL+omKVWccZWTvuTw7vDiomDS6UqXCVtu
 RDi9A8BkpwgPlvTPdfZPVe2go7pOrs5TIR1bdHo9kHujsG0rM7sKTOUJ+lm0Y8jnkZBb
 VFVtI49gAXxI3why8VhPZj/v+9SFTgJJD2Q6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=uYdhB/IsYvawJycPiJl/5+j+upKU06AcD0VCLNhUlaw=;
 b=MxckprurpD/zlaQ7fhJNKi1vqUjcCdNfMEt6RPScTW3+HL2VM9mLCvCagHyuXzY3Ta
 U7mQItfLZ3LRpQuU+GL+oLOuXZ3nKFhUmjQwJAuUTi6rPgB5XGEf0R9ysuzmHB+UrXfb
 XhkNDFAsqBa2kAlg89u2GFJmNMNRE7Hdrq9BPAgckqj/Rg9mqXJ7Ai6oqRc9J/eKXfbJ
 PD9iHjlqzvPSFL0E9cqn42uMDaMEagDQCTbangnN41hkjruqdJtYdQKPSC0hsslALaUg
 WDRBSphloRXKkC/RxawddWElTwD/w6bT3i4hacOgWuUNv9osOmx6PgAOTO6bmtzZhTiG
 dkvQ==
X-Gm-Message-State: AOAM533anrSAr1NuKx3sNuPkjPabuHZ/j18ZhHyOKudoIcoq/Mx9HWzi
 T5MW7Rw50CG2r7pcZCgi+x1k/A==
X-Google-Smtp-Source: ABdhPJyBYSOo7yqM0F3+0FagAGnq8EmkmQDZ6U/aCeqO+pjCFDUxsNUGyXyAWMpF2WReDekTNDdTcQ==
X-Received: by 2002:a17:90a:8985:: with SMTP id
 v5mr1011035pjn.27.1610569332989; 
 Wed, 13 Jan 2021 12:22:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id l197sm3488968pfd.97.2021.01.13.12.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:22:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <17a116011ae60194834210a4a0c877b3@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
 <17a116011ae60194834210a4a0c877b3@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Wed, 13 Jan 2021 12:22:10 -0800
Message-ID: <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dp: postpone irq_hpd event
 during connection pending state
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 tanmay@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-01-13 09:44:24)
> On 2021-01-11 11:55, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-01-07 12:30:24)
> >> irq_hpd event can only be executed at connected state. Therefore
> >> irq_hpd event should be postponed if it happened at connection
> >> pending state. This patch also make sure both link rate and lane
> > 
> > Why does it happen at connection pending state?
> plug in need two state to complete it.
> advance to connection pending state once link training completed and 
> sent uevent notification to frame work.
> transition to connected state after frame work provided resolution 
> timing and start transmit video panel.
> Therefore irq_hpd should not be handled if it occurred before connected 
> state.

Sure that's what's going on in the patch but you didn't answer my
question. Why does irq_hpd happen before connected state?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
