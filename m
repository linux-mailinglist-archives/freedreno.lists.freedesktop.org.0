Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EA351C9AF
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 21:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5650710F317;
	Thu,  5 May 2022 19:55:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 449 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 19:55:02 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0AA10F317
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651780501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnqJVZbPVeI46s0enhoaS6Hy7uEfMjKkZf47zK1+eGQ=;
 b=dp5QrYv9svJ4sULxPsV4K588qLZCuiCyrXDvwmoIB65ItmJ6+e8G69+seQ8GsYVVcLnZJV
 JGgn+gmWh1mLBTkizbyTf8hEDBy8qNf3Qwtlf/uCH7pWM8HJd2tll/O/OsH2VVRGLkBvuq
 vEuqozInoTYIfp2Vxu3nHk8yX2tiutA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-ZQAdT1sYOnyL0OZKm24qQg-1; Thu, 05 May 2022 15:47:31 -0400
X-MC-Unique: ZQAdT1sYOnyL0OZKm24qQg-1
Received: by mail-qv1-f70.google.com with SMTP id
 o12-20020a0562140e4c00b0044a67ef728dso4028800qvc.8
 for <freedreno@lists.freedesktop.org>; Thu, 05 May 2022 12:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DnqJVZbPVeI46s0enhoaS6Hy7uEfMjKkZf47zK1+eGQ=;
 b=19nhMcAbNFUpmMueoMXj3JJupc/H1GvbE8+IzEJ0hy0c7mOcn0QdCVRkx5rxiTqy+O
 n/6rCl70gd6TwJTranrSu93pm9RGp4w9T2D/d2eZgYWWFg2aRxjAz7MwkOrhx5+E6PfF
 dyVZC6VN4eX8QGeTSfiMfjeCoHFrrrFfwyKXLU5/ULqS8/KaPW/hcs+KWJGw2xKS9x0C
 L0LOsRxfXs54IxTjhDMeH5+ppZggPtY1Ncig/sK25AgstKLsNAB3UqhSjh5/kmxLZxpl
 wtMq1S4U/zyH/sEr+EAKicx61Uayk9zXwOeOrr129CS4+8l545VOCnBM9dpKye+TrVMq
 Q8ow==
X-Gm-Message-State: AOAM533FnIHUavhuyDzRtovQJftOoFnqi4ARRjjzitVUhVGtA0K+oxHp
 uegl20pnqug4edjR3D89xBuTFe5XTi/QO26+BFjW1/Qi8nmYsrTY5mgme/N/PShZERL57tJia7G
 ApvsLR1567e8Qmo5sn7WNOPlcSfOF
X-Received: by 2002:a05:622a:1899:b0:2f3:b09e:dbe9 with SMTP id
 v25-20020a05622a189900b002f3b09edbe9mr12328376qtc.199.1651780050730; 
 Thu, 05 May 2022 12:47:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw9VxJIDFIIwB9AlGQDX3a0wArIewXNGv5CEduHIStpRGXI2+xlxlAMXfahblbt2mKcwJawQ==
X-Received: by 2002:a05:622a:1899:b0:2f3:b09e:dbe9 with SMTP id
 v25-20020a05622a189900b002f3b09edbe9mr12328357qtc.199.1651780050495; 
 Thu, 05 May 2022 12:47:30 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 m21-20020aed27d5000000b002f39b99f686sm1290873qtg.32.2022.05.05.12.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 12:47:29 -0700 (PDT)
Message-ID: <b1a7310afc2b09dd0575826d0df973df839ef5ac.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Date: Thu, 05 May 2022 15:47:28 -0400
In-Reply-To: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm: Document that power requirements for
 DP AUX transfers
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Imre Deak <imre.deak@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

So I think if Ville is OK with it (an ack at least) I'm fine with this
documentation change. I think it's worth me noting for other reviewers I made
this decision based on the fact that the documentation is for the transfer()
function - which I agree shouldn't need to be responsible for powering the
panel on.

Since that doesn't actually specify what we expect the behavior for userspace
accesses to be (since we could in theory add more behavior in those codepaths
around the transfer() calls that don't exist for the driver's own AUX usages)
I think this is totally fine

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2022-05-03 at 16:21 -0700, Douglas Anderson wrote:
> When doing DP AUX transfers there are two actors that need to be
> powered in order for the DP AUX transfer to work: the DP source and
> the DP sync. Commit bacbab58f09d ("drm: Mention the power state
> requirement on side-channel operations") added some documentation
> saying that the DP source is required to power itself up (if needed)
> to do AUX transfers. However, that commit doesn't talk anything about
> the DP sink.
> 
> For full fledged DP the sink isn't really a problem. It's expected
> that if an external DP monitor isn't plugged in that attempting to do
> AUX transfers won't work. It's also expected that if a DP monitor is
> plugged in (and thus asserting HPD) that it AUX transfers will work.
> 
> When we're looking at eDP, however, things are less obvious. Let's add
> some documentation about expectations. Here's what we'll say:
> 
> 1. We don't expect the DP AUX transfer function to power on an eDP
> panel. If an eDP panel is physically connected but powered off then it
> makes sense for the transfer to fail.
> 
> 2. We'll document that the official way to power on a panel is via the
> bridge chain, specifically by making sure that the panel's prepare
> function has been called (which is called by
> panel_bridge_pre_enable()). It's already specified in the kernel doc
> of drm_panel_prepare() that this is the way to power the panel on and
> also that after this call "it is possible to communicate with any
> integrated circuitry via a command bus."
> 
> 3. We'll also document that for code running in the panel driver
> itself that it is legal for the panel driver to power itself up
> however it wants (it doesn't need to officially call
> drm_panel_pre_enable()) and then it can do AUX bus transfers. This is
> currently the way that edp-panel works when it's running atop the DP
> AUX bus.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  include/drm/display/drm_dp_helper.h | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index dca40a045dd6..e5165b708a40 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -370,9 +370,17 @@ struct drm_dp_aux {
>          * helpers assume this is the case.
>          *
>          * Also note that this callback can be called no matter the
> -        * state @dev is in. Drivers that need that device to be powered
> -        * to perform this operation will first need to make sure it's
> -        * been properly enabled.
> +        * state @dev is in and also no matter what state the panel is
> +        * in. It's expected:
> +        * - If the @dev providing the AUX bus is currently unpowered then
> +        *   it will power itself up for the transfer.
> +        * - If we're on eDP and the panel is not in a state where it can
> +        *   respond (it's not powered or it's in a low power state) then
> this
> +        *   function will return an error (but not crash). Note that if a
> +        *   panel driver is initiating a DP AUX transfer it may power
> itself
> +        *   up however it wants. All other code should ensure that the
> +        *   pre_enable() bridge chain (which eventually calls the panel
> +        *   prepare function) has powered the panel.
>          */
>         ssize_t (*transfer)(struct drm_dp_aux *aux,
>                             struct drm_dp_aux_msg *msg);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

