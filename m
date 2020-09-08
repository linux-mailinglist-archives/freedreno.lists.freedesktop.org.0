Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE41261B26
	for <lists+freedreno@lfdr.de>; Tue,  8 Sep 2020 20:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E766E062;
	Tue,  8 Sep 2020 18:57:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03EA6E8B2
 for <freedreno@lists.freedesktop.org>; Tue,  8 Sep 2020 18:57:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 34so178492pgo.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Sep 2020 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=bZ0hdB3aDnQdw+HPiv6w6/rS4ctBv4+DDy7Q7mzZQJA=;
 b=kQSLq1W11bCof3VZGivNs9jhTs6eQXMNg151pVMeum5ivTvrGyNKTmBC8o3aAVTMCD
 fWHq03en9zOkEUNKYb6mITKGyBNqVTB2ceHUt93ApjVkk5vDvZP7SZyD5G3hpSk3mpff
 TpEU3uBAzAcI94SB+dVKpTJKqYy/8/3vpSWho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=bZ0hdB3aDnQdw+HPiv6w6/rS4ctBv4+DDy7Q7mzZQJA=;
 b=lz+ULPX/K7Vr1PIYE2kStqkJC55l0vohcUT0B7rxs+eaDdulAkpBg50KZfms0Li/Qf
 hctpG4HBALUBe/V4x8IQuuEhpJJ6Q4OshBxFwnofn2AbLSlhqb/NP3vuqFZIkf1Cy9b4
 JTiUzM6oRR42PFW5vZ1PY7Fe+4/F1Cjh2wsmujLh4A6HhYve5o0/T7ovaY7urLXOBoFG
 cHWcMPUizKT2AS8wyzr9AV3KJLlnX+hqCVUedW8BQ9OKrArPvGHsXIXJpvARTA0Plywc
 ZDYSXoXODGKK+uVq5aw63Y9+XOiHIWGK/oui7UCO20Tq1KNUKZVzavvsQWuma5/TaY11
 JPzA==
X-Gm-Message-State: AOAM530ujJD/enhPBApgReZvx59/C6R5W6QCWADRFzFePTQCIUelc2xK
 d0P545oJog9VKXsnGlu04Opia244NQ7CjQ==
X-Google-Smtp-Source: ABdhPJwf6IhPcHFN4xXP49f62bCdnIGRRPklRPb2u3kzC8iwzMNMbimK4omnPZ6atruNND3LgaRG1g==
X-Received: by 2002:a63:b202:: with SMTP id x2mr126839pge.432.1599591441474;
 Tue, 08 Sep 2020 11:57:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id o6sm44291pju.25.2020.09.08.11.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 11:57:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <010101745aaf685e-49eb2897-ee17-40bf-89e8-2adebe8d022f-000000@us-west-2.amazonses.com>
References: <010101745aaf685e-49eb2897-ee17-40bf-89e8-2adebe8d022f-000000@us-west-2.amazonses.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 08 Sep 2020 11:57:19 -0700
Message-ID: <159959143931.454335.4137726843867018185@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: Add DP compliance tests on
 Snapdragon Chipsets
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-09-04 12:54:39)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
> 
> Changes in v2:
> - Fix potential deadlock by removing redundant connect_mutex
> - Check and enable link clock during modeset
> - Drop unused code and fix function prototypes.
> - set sink power to normal operation state (D0) before DPCD read
> 
> Changes in v3:
> - push idle pattern at main link before timing generator off
> - add timeout handles for both connect and disconnect
> 
> Changes in v4:
> - add ST_SUSPEND_PENDING to handles suspend/modeset test operations
> - clear dp phy aux interrupt status when ERR_DPPHY_AUX error
> - send segment addr during edid read
> - clear bpp depth before MISC register write
> 
> Changes in v5:
> - add ST_SUSPENDED to fix crash at resume
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> This patch depends-on following series:
> https://lore.kernel.org/dri-devel/20200818051137.21478-1-tanmay@codeaurora.org/

Can this be based on v12 of the patch series? v4 of this patch was based
on v12, but this has regressed and gone back to v11.

v12 is https://lkml.kernel.org/lkml/20200827211658.27479-1-tanmay@codeaurora.org/
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
