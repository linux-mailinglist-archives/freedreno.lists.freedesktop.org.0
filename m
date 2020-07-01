Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB08D2111AE
	for <lists+freedreno@lfdr.de>; Wed,  1 Jul 2020 19:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9950A6E98B;
	Wed,  1 Jul 2020 17:12:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A266E98B
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jul 2020 17:12:30 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id s14so10154597plq.6
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jul 2020 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PIlFXACKoqWB73ZXLVGFX7w5yXzBN1zvDpdle+NdF80=;
 b=DOAOc949O9CUTB+Gk2mL29U2MdsMP2mbZoYw5KIirj1hGMX9xijMLGqUblzFwv/G/x
 zJLDTmWDlimFSXz69VV7pahROybrgOB8GTQiPcbvVRSnL2MgK3/feKTv1rmquCDZuzZm
 WYqptjyZpI0e2YgEWodOUQ/yOC56fvUSP9Ge8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PIlFXACKoqWB73ZXLVGFX7w5yXzBN1zvDpdle+NdF80=;
 b=C7dIAC6JCfmjpCRiNm5Ocpues0w6JrBTx2QOfQEH3HF4BhUMaYFMMkwbvdrQ2ZFb5J
 K5CmEUUyzF/VetuIsxMbIKyUlOpk/qssA9Nk6RGL35JX4Pofxk3VJPrNkogj62olfJUf
 musx0rH4dEGTDD64X4uLOIMbXxDIlZOSRf6zlRN2QVC4FJsXiM/qv4hYen5YCoenusWE
 RLFZryyuhgttm0sA9G0RVxV/2sw8dXJxfbmNhHZeRVW1EWBsQMqQca4CuJQINC9axjfy
 n0sP7qA9An0BOcwgx549CZD3L7YBm7FWdTuz3y/uTl1KJUb7A0ZPIorhby+QsRd/k3He
 +s0g==
X-Gm-Message-State: AOAM532wOf+UEzC0H8vhLs89b/8l2h6EA2JqyExvtJibIYzOv0Hm26NH
 H5RoFmjNPHBVpkthgFwDaJ3LxQ==
X-Google-Smtp-Source: ABdhPJwFtwJvcus7uKKghQac5nLaOjUhOE2/wVY2iBvspvnGYTdn39aGqR8AXvaIifgh9x8exKT2bQ==
X-Received: by 2002:a17:90b:4d06:: with SMTP id
 mw6mr30824966pjb.190.1593623550056; 
 Wed, 01 Jul 2020 10:12:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id a9sm6736188pfr.103.2020.07.01.10.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:12:29 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:12:28 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20200701171228.GC3191083@google.com>
References: <20200701030842.24395-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701030842.24395-1-jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH] drm/msm: handle for EPROBE_DEFER for
 of_icc_get
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
Cc: Fabio Estevam <festevam@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Jonathan,

On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
> Check for EPROBE_DEFER instead of silently not using icc if the msm driver
> probes before the interconnect driver.

Agreed with supporting deferred ICC probing.

> Only check for EPROBE_DEFER because of_icc_get can return other errors that
> we want to ignore (ENODATA).

What would be the -ENODATA case?

If the 'interconnects' property is not specified of_icc_get() returns NULL,
shouldn't all (or most) errors be propagated rather than staying silent?

Thanks

Matthias
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
