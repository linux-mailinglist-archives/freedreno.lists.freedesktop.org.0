Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD53FA63D
	for <lists+freedreno@lfdr.de>; Sat, 28 Aug 2021 16:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8406EA55;
	Sat, 28 Aug 2021 14:40:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5466EA55
 for <freedreno@lists.freedesktop.org>; Sat, 28 Aug 2021 14:40:35 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so11846895otg.11
 for <freedreno@lists.freedesktop.org>; Sat, 28 Aug 2021 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5YPoL8GlpbFtSNjK3CYZgxgeOeetG15fvTthzuY2WMc=;
 b=iVWEM1beHr4kq2zNmhblRgSN3FGepoKEmyL4yElV1Ctij9bUPoWDx72laKDCLFu0/r
 KdBqgnRmDcf6v/Ut6bhfq+iUmWHKKH/+6ENEJYcmuvHqBzgxRTXrxY7CXN+mhqb0BYfU
 JIsRVh1vXfGNfz3aii0PcBHTgbhBV8sp4cojFlWasi6VWv6L0bLGeflI5Db1Z0SJHC2w
 g+Jz5QDAUPspAB8f6HGy67XQQb3hPKc3WbhQoDFCD7QsmDpRRa2b84fuckfol4OIBBVr
 HzLx4qcl5Sr3DWMjTyBFeWuwHW2HK9iZKjobSIaKa/NcLp9dT05T/EzdUSwKh+OoSMqb
 J4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5YPoL8GlpbFtSNjK3CYZgxgeOeetG15fvTthzuY2WMc=;
 b=ab7va9G1DMLV/2oakNE6VDwyZBtXPyOPA361jJE13feufy3rJZzaTPugXDy6hCZqLO
 hUDK/4ommEZh9wjX2TPw0U4Nxp5ShKbhNo/5tmSkwwzGqmhyJSDonXYcWxjAowix6ot7
 4ZYVyHGlr0KIrap4L0ymGqnedArnF4aEq/b9pyBEJSNMArgGL63tshwQTyekWf2VBuc/
 IoEmlJVKhn+b5YOZcr93Pw7Sh8D6mzzBpMn5Qm7v/pwMHIGm84DFW0oHZk5T6csdU7qE
 bZjjJ4M4URmrhNQsTUxFo4Lwx1auKUN6sF8xty8YUQk8u83VpT3hr4Uy8YcdQQGeO9RZ
 tclQ==
X-Gm-Message-State: AOAM533PYN02sk4K1qPsBiWAzxqnOaejZpaVBb3XxiURgtGu08UNrm3W
 lRkC56osqd/Oix90BoyYHrVmOA==
X-Google-Smtp-Source: ABdhPJzKJsmSdUekZjhIgLwPoay9yS3v22MJnOumK09rmQaevnM2pWN41fMpQJqzK/xbyf2unTc4vw==
X-Received: by 2002:a05:6830:402c:: with SMTP id
 i12mr12679667ots.287.1630161634668; 
 Sat, 28 Aug 2021 07:40:34 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id k1sm1942767otr.43.2021.08.28.07.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 07:40:34 -0700 (PDT)
Date: Sat, 28 Aug 2021 09:40:31 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Message-ID: <YSpK3wTUdqlUyJxb@yoga>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
Subject: Re: [Freedreno] [RFC] drm/msm/dp: Allow attaching a drm_panel
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 27 Aug 15:52 CDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +static int dp_parser_find_panel(struct dp_parser *parser)
> > +{
> > +       struct device_node *np = parser->pdev->dev.of_node;
> > +       int rc;
> > +
> > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> 
> Why port 2? Shouldn't this just be port 1 always? The yaml says that
> port 1 is "Output endpoint of the controller". We should just use port
> 1 here, right?
> 

I thought port 1 was the link to the Type-C controller, didn't give it a
second thought and took the next available.

But per the binding it makes sense that the panel is the "Output
endpoint of the controller" and I guess one will have either a Type-C
controller or a panel - even after the DP rework?

Regards,
Bjorn
