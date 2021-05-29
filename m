Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EACE394D5D
	for <lists+freedreno@lfdr.de>; Sat, 29 May 2021 19:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E826E581;
	Sat, 29 May 2021 17:09:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424546E1F2
 for <freedreno@lists.freedesktop.org>; Sat, 29 May 2021 17:09:57 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so6665093oth.8
 for <freedreno@lists.freedesktop.org>; Sat, 29 May 2021 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7bkqiEyd8a086aPYUR6burYJWQhu6f4gu/LbVHZNwfc=;
 b=C9VvtCnGiiOfz68z7IKruRS5sWRRuWsoEtCw0Lj/ixm059lRUVLiuKzLsSXzkAAMRe
 uJ4eaXZ5ZqCIUZMubTp1qf/rZb5tpIkjxmsnS7tLfO59Fn8o/94r1fyb0WJtEqQsjCxT
 1x5mVlcx0c/wo4Er+O3GECknABerGiMOSPaC2Ss2cz6QWQsFW9ctGtN73p/7e7rW8CIM
 a6Wp7sbZvVM//6YYSZ2E27qGU/Sb6X4c6SdHLxk8OrzAmJ6/8C6PAaQv44KqEDwMuGCc
 7waL7JHrqvRhB4EoVETXwMB52MOROf/ivAGpO1LZwgGGbTVsgmIhKrjzYueuwgTAh/6G
 kCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7bkqiEyd8a086aPYUR6burYJWQhu6f4gu/LbVHZNwfc=;
 b=Rbyjb9xYu8uIiFEi4QfMe4l5iKiVcYIUZeUDJKfsQqSiQbNWF8GlQa1OyQcmlitBkY
 W5bnFW5lXAQvQ4DozQ2t/g68yscH8YHF6LyW5lFewmCAhUZSI/qkVKO3a1hIlPi4LgWk
 LCgr0gvnJXEwOLK2yYMHhAg1OeoxumbX8Fb0d8sfp7sARk3uHONlH14arDQfin2xlHOI
 cRu63sKhf9RYZgkm87EPNb+nJWPEXbIzzQHKZHZ05bUslBvY2bj8+AhYsFhVwKo9V3y5
 ekQQMre5iBv0xQ+rlEzl+i0R3ao8B+iNhNyEO8in5qUiCrJR1R6OzYeGP2442E0YWxyp
 r49g==
X-Gm-Message-State: AOAM533LhUV7EcEONaMAYMgd/HUIayQAhHgunQASK0z/5MurhZqKcJSy
 ESKX9eq3s1HZqd5pNs4N6SWUYA==
X-Google-Smtp-Source: ABdhPJyhejKZ8P84aJ+O1OEB2O4xbRPp6DSwQ4nUr0TDzKzViEyqc3s1wCsWqp4HT4SiJmSGzahxbQ==
X-Received: by 2002:a9d:6645:: with SMTP id q5mr11181131otm.80.1622308196402; 
 Sat, 29 May 2021 10:09:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d19sm1827454oop.26.2021.05.29.10.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 10:09:55 -0700 (PDT)
Date: Sat, 29 May 2021 12:09:53 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: abhinavk@codeaurora.org
Message-ID: <YLJ1Yfg8jlrxILTE@builder.lan>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-5-bjorn.andersson@linaro.org>
 <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 4/4] drm/msm/dp: Add support for SC8180x eDP
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sbillaka@codeaurora.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 28 May 18:40 CDT 2021, abhinavk@codeaurora.org wrote:

> On 2021-05-10 21:20, Bjorn Andersson wrote:
> > The eDP controller found in SC8180x is at large compatible with the
> > current implementation, but has its register blocks at slightly
> > different offsets.
> > 
> > Add the compatible and the new register layout.
> > 
> I am not able to completely recall the history of why in the DP bindings
> we added DP register base as a big hunk and let catalog handle the submodule
> offsets.
> 
> I guess earlier that made sense because DP sub-block offsets were fixed.
> But if we plan to re-use the DP driver for eDP as well like this series,
> then maybe it might be
> better if this comes from device tree like the earlier version was planning
> to
> 
> https://patchwork.kernel.org/project/dri-devel/patch/0101016ec6ddf446-e87ab1ce-5cbf-40a0-a0bb-cd0151cd577a-000000@us-west-2.amazonses.com/
> 
> 
> +- reg:                  Base address and length of DP hardware's memory
> mapped regions.
> +- cell-index:           Specifies the controller instance.
> +- reg-names:            A list of strings that name the list of regs.
> +			"dp_ahb" - DP controller memory region.
> +			"dp_aux" - DP AUX memory region.
> +			"dp_link" - DP link layer memory region.
> +			"dp_p0" - DP pixel clock domain memory region.
> +			"dp_phy" - DP PHY memory region.
> +			"dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
> +			"dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.
> 
> Now there is more reason to separate the sub-module offsets like
> ahb/aux/link/p0

I like it, will rewrite the patch accordingly.

Regards,
Bjorn

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
> >  drivers/gpu/drm/msm/dp/dp_parser.c  | 28 ++++++++++++++++++++--------
> >  2 files changed, 21 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > b/drivers/gpu/drm/msm/dp/dp_display.c
> > index d1319b58e901..0be03bdc882c 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -121,6 +121,7 @@ struct dp_display_private {
> > 
> >  static const struct of_device_id dp_dt_match[] = {
> >  	{.compatible = "qcom,sc7180-dp"},
> > +	{ .compatible = "qcom,sc8180x-edp" },
> >  	{}
> >  };
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> > b/drivers/gpu/drm/msm/dp/dp_parser.c
> > index 51ec85b4803b..47cf18bba4b2 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > @@ -251,6 +251,7 @@ static int dp_parser_clock(struct dp_parser *parser)
> >  static int dp_parser_parse(struct dp_parser *parser)
> >  {
> >  	struct dss_io_data *io = &parser->io.dp_controller;
> > +	struct device *dev = &parser->pdev->dev;
> >  	int rc = 0;
> > 
> >  	if (!parser) {
> > @@ -276,14 +277,25 @@ static int dp_parser_parse(struct dp_parser
> > *parser)
> >  	 */
> >  	parser->regulator_cfg = &sdm845_dp_reg_cfg;
> > 
> > -	io->ahb = io->base + 0x0;
> > -	io->ahb_len = 0x200;
> > -	io->aux = io->base + 0x200;
> > -	io->aux_len = 0x200;
> > -	io->link = io->base + 0x400;
> > -	io->link_len = 0x600;
> > -	io->p0 = io->base + 0x1000;
> > -	io->p0_len = 0x400;
> > +	if (of_device_is_compatible(dev->of_node, "qcom,sc8180x-edp")) {
> > +		io->ahb = io->base + 0x0;
> > +		io->ahb_len = 0x200;
> > +		io->aux = io->base + 0x200;
> > +		io->aux_len = 0x200;
> > +		io->link = io->base + 0x400;
> > +		io->link_len = 0x600;
> > +		io->p0 = io->base + 0xa00;
> > +		io->p0_len = 0x400;
> > +	} else {
> > +		io->ahb = io->base + 0x0;
> > +		io->ahb_len = 0x200;
> > +		io->aux = io->base + 0x200;
> > +		io->aux_len = 0x200;
> > +		io->link = io->base + 0x400;
> > +		io->link_len = 0x600;
> > +		io->p0 = io->base + 0x1000;
> > +		io->p0_len = 0x400;
> > +	}
> > 
> >  	return 0;
> >  }
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
