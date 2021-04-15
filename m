Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA92C3615AB
	for <lists+freedreno@lfdr.de>; Fri, 16 Apr 2021 00:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B826EABE;
	Thu, 15 Apr 2021 22:47:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E2C6EABE
 for <freedreno@lists.freedesktop.org>; Thu, 15 Apr 2021 22:47:01 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso2120740pjb.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Apr 2021 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=4QXyNLhNR/ybAA8PhqI1Y4BCgzCX+KpeDdgoizSFaz0=;
 b=L8G3d+gV+ZHqNkVAriDsrtVhQMCQV82uICqEb1zx1gUZUrHTLb/QtmAwXKfy4wXRNo
 sbi42TE/mnsc+Lp3EC3yZuCmD88NlzUjqVXVC0gKoWE3IyTBrFsxCEmEtKHEQa35W/3/
 eoBFIqvEgEVTAx6u4F3UxeGblQP8MygfDsj2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=4QXyNLhNR/ybAA8PhqI1Y4BCgzCX+KpeDdgoizSFaz0=;
 b=HXYw7hpmy0j/PmQnfabUagep6rWZtFBCJn4CaWvzlinVoF+xXXkFgZV+qbPHzpgetB
 /XlqTikIr0IlY77mzozrhXG6fA90tA7+2UPNB+kl+avIP6VKWfYb3UaMS1qc1hQp061u
 kP6BMlLjWDsrCBhKdaXBMnXj74W+uobKPsJ3nHz8LO/GSBlggdOvS7YOFmPatyQ7Ozb9
 MVzFYL0iDYrX87Gut0ORtbgVLwIdaebs8nC06orXNi9zurBk/lOhKTY+1brJfC7/1hLL
 DrEEaU/ppYEB7Kc4BLzCahuBk20LXQxAfaxVL09g1RCfdhRnzCg54SIO5gThWj/KYEpc
 2DUg==
X-Gm-Message-State: AOAM5306m//H9+OFNI/My8gPJGz7SYA1/S5MAP0b3pAqqbSjPeu3JypL
 Cm2uil8EVPWwrZI0Od22mQDUaA==
X-Google-Smtp-Source: ABdhPJxFhcnc0BQvrngfQ3Z5AFfIdVKhj/xb/yL3sabyo7p2u8N5bSvEyBbGwKVUGR30J7RRrB+6pA==
X-Received: by 2002:a17:902:b188:b029:e8:bd90:3f99 with SMTP id
 s8-20020a170902b188b02900e8bd903f99mr6372521plr.6.1618526821364; 
 Thu, 15 Apr 2021 15:47:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1ddc:37d8:5171:510d])
 by smtp.gmail.com with ESMTPSA id a128sm3038828pfd.115.2021.04.15.15.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 15:47:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <78036f23979206070bd9c9df180e2866@codeaurora.org>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
 <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com>
 <60bceecc3d4dcc71c66a4b093d0e6c0f@codeaurora.org>
 <161851718969.46595.12896385877607476879@swboyd.mtv.corp.google.com>
 <78036f23979206070bd9c9df180e2866@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Thu, 15 Apr 2021 15:46:59 -0700
Message-ID: <161852681935.46595.9941294298184495830@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/msm/dp: check main link status
 before start aux read
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
 abhinavk@codeaurora.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-04-15 15:02:40)
> On 2021-04-15 13:06, Stephen Boyd wrote:
> > 
> > Is it really necessary to have this patch at all? I think there are
> > bigger problems with suspend/resume of the DP driver in relation to the
> > kthread stopping. I hope that the aux channel would start NAKing
> > transfers once the cable is disconnected too, so that we don't need to
> > do an extra check for each aux transfer.
> 
> I am working on duplicate this problem, but it is not happen on me yet 
> so far.
>  From kernel dump, i can see it crash at dp_irq_hdp_handle() after 
> suspended.
> dp_irq_hpd_handle and dp_pm_suspend() are serialized by event_mutex.
> 
> After suspend, ahb clock is disabled.
> Hence next dp_catalog_link_is_connected() crash at acess dp ctrl 
> registers.
> 
> 
> aux channel does not do NAKing immediately if unplugged. Therefore 
> aux_transfer will wait until timeout (HZ/4).
> worst, drm_dp_dpcd_access() will retry 32 times before return dpcd 
> read/write failed.
> This patch try to eliminate the time spinning on waiting for timeout 32 
> times.
> 

Would be useful to have that level of detail in the commit text.

Maybe when the cable is disconnected the DP phy should be shutdown and
some bit in the phy could effectively "cut off" the aux channel and then
NAKs would start coming through here in the DP controller I/O register
space?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
