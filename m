Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515F1B30DD
	for <lists+freedreno@lfdr.de>; Tue, 21 Apr 2020 22:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48E6E32E;
	Tue, 21 Apr 2020 20:00:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138C26E32E
 for <freedreno@lists.freedesktop.org>; Tue, 21 Apr 2020 20:00:18 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h69so7276175pgc.8
 for <freedreno@lists.freedesktop.org>; Tue, 21 Apr 2020 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
 b=YWDFSsi9ryGa8bDJzYeDNw+vx+TvNzV2BxgbgfORIvrP64vyZ1imeGOhyAgmGNngvm
 eCYaSD73vnaoGoKUeQgCKH+Hr66n7gWLTjfCaUfz+rjOnTy5EdTl9YkbziW6tCDs5Jff
 8eLrKW28QiInsEbBv0ijdwTtski0qBKHoilQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
 b=uleEstdRbfH4k64nmrLrEQpV0AjvE2D2dPvA83gPl1UsgelICPp8dZoohtuzkmh7Iz
 mfIjiDRlELLR5DZMNZxSBLRZWcFA2zjVdrowpr2QTbdhM18yPzb8goFfUpmP36N3rXjo
 zpBWMHMUwLa0meIGv6il6YOjOIOrlzRsmm4epMxU7XVH6ArX2VPbDdIDP89EZkmN5/ma
 wOT8zBlA4Xm/DOXc/fPSeCtlR9u+kKfvDnDD7l67HSy7EW3OssvksXWmhul7lpWLdc+C
 Ji9iBcfxYsDK1p8FF4Cb4Sjc+p9DlklbaeozzXZzcCyAeCSN+BRgqfCBbTd5N8MLGyX1
 Q62A==
X-Gm-Message-State: AGi0PuYQ8hhyMkNAeozRZAyRUOv43r5ua8OagksGuJ60tTtbz2JhLuCR
 Nu31wLQtnLlIHeDHG3Yp0O0naA==
X-Google-Smtp-Source: APiQypIRuEpl74OEh/r7qvhYCkgt2cE/s/0bvJj5YQ7FRv0j5NRQrJj0QGCAqQNBlGDnOqKGb1/peQ==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr23894600pgk.429.1587499217639; 
 Tue, 21 Apr 2020 13:00:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 20sm2423112pfx.116.2020.04.21.13.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 13:00:16 -0700 (PDT)
Date: Tue, 21 Apr 2020 13:00:15 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Message-ID: <20200421200015.GH199755@google.com>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200421045508.21137-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421045508.21137-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [PATCH v11 1/2] drm/panel: add support for rm69299
 visionox panel driver
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 21, 2020 at 10:25:07AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Please keep tags from previous versions (like my Reviewed-by from v7)
when making minimal changes.

Also there is no need to keep sending the bindings patch, it already
landed in drm-misc.

> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..3ef4cc80044a
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c

...

> +MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> -- 
> 2.25.1

The last two lines break the patch:

git am /tmp/v11-1-2-drm-panel-add-support-for-rm69299-visionox-panel-driver.patch
Applying: drm/panel: add support for rm69299 visionox panel driver
error: corrupt patch at line 379
Patch failed at 0001 drm/panel: add support for rm69299 visionox panel driver

Besides the broken format:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
