Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078A025879E
	for <lists+freedreno@lfdr.de>; Tue,  1 Sep 2020 07:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14C86E15E;
	Tue,  1 Sep 2020 05:42:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5776E15E
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 05:42:45 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id u3so8427075qkd.9
 for <freedreno@lists.freedesktop.org>; Mon, 31 Aug 2020 22:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TjPySNIpD++R3nIfiDfbAnLHmr0c9i/LGC5Y9ogD0v8=;
 b=OAbWCK0Yezbsh/mzcgeE7sC/EeQQhZZ8WSfMp/Fmv/B7Lk2xTWpDZL7ez5bf5UDPWK
 4Tue7VtzfuaCr5qUWiEay3FADaV89uAXqiEQ2f0UU/LKgixPCrQhkFXl83SKtXawRPug
 3VswzBVU7BhUiPiBt4EI5sghR0SBrIxLZku0fNksghFQsFPBBSKTndX/FfB6TpJMrVJJ
 TE/FJhQHMSxivxBOC5CwlJvVL2inpaqTLLxgpXo2oLYU/jPdXYGaBWizv/c5P/4Twm4n
 oUcO4KIExFshItVD3J8hb+p6lpoDxm4JTY8Saz2oGC55/ChiWAPX6WIBTSDYFkqzsCAo
 81SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TjPySNIpD++R3nIfiDfbAnLHmr0c9i/LGC5Y9ogD0v8=;
 b=SSVExZG33vY+eXG8/lsMnyvgt51LCaVu3pP3Gd/om9ZIriUjTNSrnwBFzc67B90zW8
 ZMH4FHHalpYfmDrR2PTvBsG4BQaoNoA8mYX0TXvvdYzbj/j5fifvnkZum1dBdsXawxIh
 VaWFMG09J7fsBerPMA3TCKmNQpyFs2TEKmTT0jc8W7hqPCBP23RrfV1wqcHy7dPh5ELJ
 viiLUpDx6XSwqd9IB33R2x5hjdpRKAVl694n/rC85vzHbMfXCyvv4XiNSzBoVhqcugHR
 HABDIvyl30xVcigvwSz+vC53/HbPvxpgEYpqn1cUyX06cB+tXS4fAAhDWTgI7NGsnnRD
 AxcA==
X-Gm-Message-State: AOAM531bcy3PAYYSBgYLBQb1eWW9xYRyu+eBOGYj6G3RXsnc7v2mjs2X
 mOtY8OZ8U7KM5sVB6etRxpIHfA==
X-Google-Smtp-Source: ABdhPJzptDekz3V1QxRTxrgjsN9RM1EoaAMnK6eUWK4D92iBVLom/mgdEqgNNG4GBVYJ/DvH3YX36g==
X-Received: by 2002:a37:b307:: with SMTP id c7mr270811qkf.33.1598938964675;
 Mon, 31 Aug 2020 22:42:44 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id s20sm354299qkg.65.2020.08.31.22.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:42:44 -0700 (PDT)
Date: Tue, 1 Sep 2020 05:42:42 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200901054242.GC54956@uller>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-2-robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 01/19] drm/msm: remove dangling submitqueue
 references
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 iommu@lists.linux-foundation.org, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 14 Aug 02:40 UTC 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Currently it doesn't matter, since we free the ctx immediately.  But
> when we start refcnt'ing the ctx, we don't want old dangling list
> entries to hang around.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index a1d94be7883a..90c9d84e6155 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
>  	 * No lock needed in close and there won't
>  	 * be any more user ioctls coming our way
>  	 */
> -	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> +	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> +		list_del(&entry->node);
>  		msm_submitqueue_put(entry);
> +	}
>  }
>  
>  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
> -- 
> 2.26.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
