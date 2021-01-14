Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A6D2F5566
	for <lists+freedreno@lfdr.de>; Thu, 14 Jan 2021 01:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FAD6E8A0;
	Thu, 14 Jan 2021 00:01:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492276E8A0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Jan 2021 00:01:49 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id z21so2552081pgj.4
 for <freedreno@lists.freedesktop.org>; Wed, 13 Jan 2021 16:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=j5No6ehFyNUGBGnFH55sTeUTiuMaiV/KCtKu2WjO9nU=;
 b=BnYPoseV9pn2y6AghtZxd/frs7EpZNFmCFHEDX67t/JVVhoevvpnUdohU5tE7xpiZd
 Fv1Ab3khuxM2NPIlCl9pvHHTJ4SWb68d4myh+IYLaSJQOpqGYQLt7gFOEamxL7OVk4Mr
 TGkZrM+SLjNuPSEQi2592Zq/DmrRa8jG1yYS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=j5No6ehFyNUGBGnFH55sTeUTiuMaiV/KCtKu2WjO9nU=;
 b=daQsli1YMlam7cIxDmWEbovMvcKB1dzGhVN84q0jaXyOqJpR+XSqEw8wOGTShRNAmF
 HuAZja3OxaeQ9fsM03X5hNV+8cwQjIzG3Q7Xz9yWfLCw3YSR6VYGUgy4maWHzYO30iit
 y+JdRMpeNwX+VWsoXy23Mtf+HiDS+nEL+YJL/CEAHVqKQES6P0PWF1IOC9YIVXGj9Fhy
 azgFq7LCsdLjmzFZngVJIcLd4AlrRSqzHOR9LkYky0HxLRULkWdxI5gZekxhEMGiys01
 sPGYiZ/sK7SGXsEa1QjrgEFW0wl3WvW/LW+0ton3G/czlA0CO/1DBDM69AMwApL6VGzI
 ulcA==
X-Gm-Message-State: AOAM53033R2+qib65FnclG7fQVwlhhRQyYsxQsOT6JG8xdPF8BApv8Z8
 apEMRtLbfmAVq03tw9zbL2cc7A==
X-Google-Smtp-Source: ABdhPJz/UNH+WbuQbeTH+zfipea9NQjduVzBRKEt49n5Dikay54BXViatwCIDl+QG7xYHAboFU80fA==
X-Received: by 2002:a63:fe05:: with SMTP id p5mr4473115pgh.161.1610582508970; 
 Wed, 13 Jan 2021 16:01:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id gc20sm3675490pjb.49.2021.01.13.16.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 16:01:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5b1c9e0706fdaf4cc1ecbe740b8c916c@codeaurora.org>
References: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
 <161056955435.3661239.1548841852585636847@swboyd.mtv.corp.google.com>
 <5b1c9e0706fdaf4cc1ecbe740b8c916c@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Wed, 13 Jan 2021 16:01:46 -0800
Message-ID: <161058250690.3661239.88115129391615310@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2 0/2] fix missing unplug interrupt problem
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

Quoting khsieh@codeaurora.org (2021-01-13 15:52:37)
> On 2021-01-13 12:25, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-01-13 10:59:58)
> >> Both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts.
> >> Therefore irq_hpd handler should not issues either aux or sw reset
> >> to avoid following unplug interrupt be cleared accidentally.
> >> 
> >> Kuogee Hsieh (2):
> >>   drm/msm/dp: return fail when both link lane and rate are 0 at dpcd
> >>     read
> >>   drm/msm/dp: unplug interrupt missed after irq_hpd handler
> > 
> > It won't apply to the drm msm tree. Please rebase and resend.
> Both V1 two patches are picked by Rob already.
> I will drop V2 patches.

I only see the first patch, not the second one. Rob?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
