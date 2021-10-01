Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD5241F698
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 23:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1FB6F40D;
	Fri,  1 Oct 2021 21:00:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106AB6F406
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 21:00:39 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so13064921otv.4
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NC9cmhLrHdckMuK/r28TvZNjmeIVCX8ECTisIPvM3VE=;
 b=XimCMpcHPEIPcAavsLIBQ7e4UqLEpKZsP5a1nMGqsGf5ozPAwSgkjCn3bwUoBZRJKG
 38ks49GU17lkYI2bUN0zLpXw9zF9ykNXYAGdQOR6LoXpO9e6e7Qk22Vt0qU7gX8ejinL
 9vTstYflDVB0JcqkSbf+/tuaA1by6r7A2zhQkDqQdZyrw0wphZmwvBATHJcr7X6uHDtO
 4e+5tVG7WGVxi3W7EEG8Sv/2kLYkWsUa3qMSPzEieSJ56Ux7OgiTsVd40kvXZvD1GFwA
 yRKjcpF1mNHBtiF7/rZkhigpYnHR6SvtN76kF3sXuZKVzyg8PBs9ClyTcUmqq/SWXvAt
 K4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NC9cmhLrHdckMuK/r28TvZNjmeIVCX8ECTisIPvM3VE=;
 b=pWjY14upJgae0wLP6ldFZL3DQGOX6uBJG1Ekafz6udhVctgDOchsAvGFN1S1+I/Zds
 ovYXIMCyqK3JrJ8MApH5BLbX7Qec16ibtez3ygEEx5fs1fRmdvdWHJaXkzK+G4Ft/PUN
 dhngfCJ9nsXAGZd9ziFV5w2XlyOnFn8Y/c2RjaSBC5FcedRwWOKhwmXXSOQdgb0IhssJ
 J/XrG3p2onJ13v76zzH7Fl649ZtfY1v7ed2xp43f816h2oBWUVR25wfTcwdgMBh4HKLU
 Dj3GypcL/toab/uIFLeTDz/9tkk+becFXGxZAnqloX4ttZHkT5mBGJToYu63zjzebvss
 u6tg==
X-Gm-Message-State: AOAM530Rp4qqwZtJCA12orz0uPQVgMH8ocIYnOrcjo20lR4H6jo4fB6q
 JVt7CFk3NHf00ppmuPNlKuwCDg==
X-Google-Smtp-Source: ABdhPJwoHN/UBWInkMgxVgelTcg9Ak/uofV+tp/je2/pG4B/t/W7LZ0cC6Rvth9aFQh6/JZINgrG/Q==
X-Received: by 2002:a9d:6396:: with SMTP id w22mr18800otk.26.1633122038272;
 Fri, 01 Oct 2021 14:00:38 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id j24sm539724otq.72.2021.10.01.14.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 14:00:37 -0700 (PDT)
Date: Fri, 1 Oct 2021 14:02:25 -0700
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
Message-ID: <YVd3YdfgFVc0Br5T@ripper>
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

On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:

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

Finally got back to this, changed it to 1 and figured out why I left it
at 2.

drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
reference to the USB-C controller, scan through the registered panels
and conclude that the of_node of the USB-C controller isn't a registered
panel and return -EPROBE_DEFER.

So I picked 2, because I'm not able to figure out a way to distinguish
between a not yet probed panel and the USB-C controller...

Any suggestions?

Regards,
Bjorn
