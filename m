Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA853115DA
	for <lists+freedreno@lfdr.de>; Fri,  5 Feb 2021 23:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B9D6F51C;
	Fri,  5 Feb 2021 22:50:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C626F51C
 for <freedreno@lists.freedesktop.org>; Fri,  5 Feb 2021 22:50:10 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id my11so7275325pjb.1
 for <freedreno@lists.freedesktop.org>; Fri, 05 Feb 2021 14:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=gKCMWJy86du3XdDODHHkwDL4EqHeNQp1OLhPf7Jz0/g=;
 b=DeXiiiz5Xu4mcDBbUqmfnVGscCw+wn6NsdbMyjAgmzY0DOwxWhcYOd/PnXNYyBohsH
 kYceKhwQiG+aY1UbhHj+Kxmycp6RYnmrSDn4qOIt132V+xkdfuUzzL1LBYYDUIerwPc1
 txnAFI8K2L0gYegSqTqvFwLAFkxZc02oP87Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=gKCMWJy86du3XdDODHHkwDL4EqHeNQp1OLhPf7Jz0/g=;
 b=Lf2JRieG43cDj8UJHo3E9heEkKHklooc5a3wtcxvtXPNm3UTg0tI/DhCgPB//BvUYS
 3O/LCcECAV8lIGfyCviv+XAQUckuTLFkIduPEC1LWliV1atu39rUjtLABVNJtnX3mTLx
 5fmGAz8I7cJmHLreQcntVeVPYSw/sgit6cCjrxCKPtb8fxYTr+YsLtzVhkIQ6dO3ozal
 NWtjVqCK+7w4CNTQ4rDr7A9mayoF5soSpAnK3VbWQjkSqQXiOa1O4QfEdLQ1TQGjCEyv
 mYAA0InfYbcXAFz9f91qIVOBWVBe8XIEL68rp1xIvIKQckNNsANU6UBvwXiP54PX6yXQ
 Z33g==
X-Gm-Message-State: AOAM533Sn6SmqEFGi2G+2CAs2dX16eIgMP0hDr8jkQ5UabK5nnMQZycp
 vwXtUCcq0EfldI6Co4TXRb1zZw==
X-Google-Smtp-Source: ABdhPJwGvnWZVMON25jxMBQujRQW8J9vouiPFt6BaQnmk2Wd20tbSiNga0UjbYPbrvJYFU44SNIh9w==
X-Received: by 2002:a17:90a:8b15:: with SMTP id
 y21mr5929152pjn.82.1612565409676; 
 Fri, 05 Feb 2021 14:50:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3d74:5f76:aaaa:6cb8])
 by smtp.gmail.com with ESMTPSA id s126sm6639348pfs.81.2021.02.05.14.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:50:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1612557878-19743-1-git-send-email-khsieh@codeaurora.org>
References: <1612557878-19743-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Fri, 05 Feb 2021 14:50:07 -0800
Message-ID: <161256540764.76967.2035577896654812758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: reset dp controller only at
 boot up and pm_resume
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

Quoting Kuogee Hsieh (2021-02-05 12:44:38)
> DP_SW_RESET is the global SW reset that is used to initialize DP
> controller. If DP_SW_RESET executed during connection setup,
> two HPD related side effects may occurred,
> 1) pending HPD interrupts cleared unexpected
> 2) re start debounce logic which trigger another interrupt
> This patch only issue DP_SW_RESET at boot up and pm_resume.
> This patch also reinit video_comp before configure dp controller
> to avoid missing VIDEO_READY interrupt.
> 
> Fixes: 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after irq_hpd handler")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
