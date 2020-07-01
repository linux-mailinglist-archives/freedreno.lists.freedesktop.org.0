Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9D2111F7
	for <lists+freedreno@lfdr.de>; Wed,  1 Jul 2020 19:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFDE6E096;
	Wed,  1 Jul 2020 17:31:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E388F6E98B
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jul 2020 17:31:39 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q17so11286562pfu.8
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jul 2020 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4fNzrypwA+h6/cDmXnWYSRWs2TnExn3KjSMmEODDS5k=;
 b=eij/r8Vh/rQed6wZTqGpOc18VEuPZcxNJDWCztfwt/yJl5o9O50Y0Kioeg4lEoOUYf
 b5COS9gDdoCUd6jRHA4b8V3qeWtiUT35a4EVNWIv1kVBLT60wpQew/R3aqshKT3jEnh2
 6uh9PjDzwpNLFb86pW5QGPdxBz12d7V2eGx48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4fNzrypwA+h6/cDmXnWYSRWs2TnExn3KjSMmEODDS5k=;
 b=XNx1i/g7r5LCQmuTG8StBV7nb3bXK9+yo1sEG51AP2Va6ccC0K75dFX4ExffTAhJUp
 N/Jt0iaXJbVCy3WN+BuMciofHzRuBCDFOeFWlP5eCHplChCqIPPjmWTEFy9+AOFu7Psw
 7X6j1ysTs8IWWAsjTXfaEVfaYCy/FV4nsMidAY9StJOuPMEraZBEOuVdY8B0cjB3C2uk
 5zKA6JVuP4//Aj70UQvrU/7nbx/eOk3gmmWqPqCBK2yeb/alogqQqZ0QFEO+oROyEiq1
 urIUtcFlrkcwqzfSkBDYaAUlEZlhTEOrmz4FvA4e4KfXF/FEIXAYhGDGhmAaTEJTFGMk
 AWcA==
X-Gm-Message-State: AOAM532i93NHDF/rVOiXh/nuqs5jH3ZoquiC9qQUqQx1c5NDMJRCHSNJ
 SZ33ymIjlCkHHg9U0LxBd363/w==
X-Google-Smtp-Source: ABdhPJxDxBe8JvlXms+W1hWSshtDpF7DzlWzhcD8TjKp0cMR4Tp3lor5DHtOOMRLn11J3GiOW8kXnQ==
X-Received: by 2002:a63:fc43:: with SMTP id r3mr20981507pgk.423.1593624699558; 
 Wed, 01 Jul 2020 10:31:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id 21sm6435524pfu.124.2020.07.01.10.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:31:38 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:31:37 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20200701173137.GD3191083@google.com>
References: <20200701030842.24395-1-jonathan@marek.ca>
 <20200701171228.GC3191083@google.com>
 <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
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

On Wed, Jul 01, 2020 at 01:13:34PM -0400, Jonathan Marek wrote:
> On 7/1/20 1:12 PM, Matthias Kaehlcke wrote:
> > Hi Jonathan,
> > 
> > On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
> > > Check for EPROBE_DEFER instead of silently not using icc if the msm driver
> > > probes before the interconnect driver.
> > 
> > Agreed with supporting deferred ICC probing.
> > 
> > > Only check for EPROBE_DEFER because of_icc_get can return other errors that
> > > we want to ignore (ENODATA).
> > 
> > What would be the -ENODATA case?
> > 
> 
> The of_icc_get for the ocmem_icc_path can return -ENODATA when the ocmem
> path is not specified (it is optional and only relevant for a3xx/a4xx).

Thanks for the clarification!

In this case it seems reasonable to me to return any error for the
'gfx-mem' path and all errors except -ENODATA for 'ocmem'.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
