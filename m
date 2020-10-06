Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F42852B5
	for <lists+freedreno@lfdr.de>; Tue,  6 Oct 2020 21:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18F26E053;
	Tue,  6 Oct 2020 19:56:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB8A6E061
 for <freedreno@lists.freedesktop.org>; Tue,  6 Oct 2020 19:56:08 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d6so9651494pfn.9
 for <freedreno@lists.freedesktop.org>; Tue, 06 Oct 2020 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=S8eSQwblG7magE2M9UvC+xcdzDuh3S8sxyEB62q5+1g=;
 b=le2hYmKsGwWNwVqNSwcjcTPzO5cuY3xEgiwXqiqs192Il24k51QSXPpXRaiTi9YzF7
 2rBNS7UVXRPw2mq8UkJlXkVOvAku8ULLpb07fQ1mR+Fwur0ESSIQ9O+PH5yKC5ribbg3
 v4wUZBgjAY/3AoLBWgI0Q8yNTwQiYsny962Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=S8eSQwblG7magE2M9UvC+xcdzDuh3S8sxyEB62q5+1g=;
 b=R1nbYryxTWb3zHf7KynLU+aUnL9YPI2S+fi3UdmA6IhayBWW+PDD+5qlHkTgGIervE
 z2HSU+UfkswiuVX5f6YmVa6zYUb83FxZia0VTQaySutRptxY1asbrQcgudU2C83kKHgS
 SKoAZdyi4NPdvBcii/XDFNurB8BGqZgzYaoV3PC/A9VoQxp7RivyTd3E/r+NHQ65rMFN
 BZAbs/hdxdciPx2G1qwF0sqlMhe1cYfLbZYvrLrZXGn9ogCXkjuEmhTF+oTXlWEtNsCN
 cnLFtfDvHNdfvNfJC4moDKL25cR/9G0eQEQ9vmE647q12DDzWOtizND3NjdoX8j1zo31
 MdtA==
X-Gm-Message-State: AOAM531gY5TyU3VeB9Ide1jwhRbYHfSZyROB+GjkiuF89cbGYRR98rbz
 vSO0FXK//cMO2SR5mryqT1wtYg==
X-Google-Smtp-Source: ABdhPJwLqp/q9FllU9TkkqAftGyryDVyYi90GLXXKp/ilS3muE/yICdKxs6V2hpbi0Ht/CoKeIQ94g==
X-Received: by 2002:a63:dc04:: with SMTP id s4mr3793212pgg.123.1602014167858; 
 Tue, 06 Oct 2020 12:56:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id j19sm4524361pfi.51.2020.10.06.12.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 12:56:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
References: <20201003222652.32671-1-khsieh@codeaurora.org>
 <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 06 Oct 2020 12:56:05 -0700
Message-ID: <160201416564.310579.6502664088674731743@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: add opp_table corner voting
 support base on dp_ink_clk rate
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
 abhinavk@codeaurora.org, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rajendra Nayak (2020-10-06 00:31:41)
> 
> On 10/4/2020 3:56 AM, Kuogee Hsieh wrote:
> > Set link rate by using OPP set rate api so that CX level will be set
> > accordingly based on the link rate.
> > 
> > Changes in v2:
> > -- remove dev from dp_ctrl_put() parameters
> > -- address review comments
> 
> This needs to go below '---' and should not be part of the
> change log.

In drm tree they put this above the triple dash.

> > diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> > index 76743d755833..7d0327bbc0d5 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_power.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> > @@ -102,6 +102,6 @@ void dp_power_client_deinit(struct dp_power *power);
> >    * methods to be called by the client to configure the power related
> >    * modueles.
> >    */
> > -struct dp_power *dp_power_get(struct dp_parser *parser);
> > +struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);
> >   
> >   #endif /* _DP_POWER_H_ */
> > 
> > base-commit: d1ea914925856d397b0b3241428f20b945e31434
> 
> ??
> 

This commit is in linux-next as d1ea91492585 ("drm/msm/dp: fix incorrect
function prototype of dp_debug_get()"). Seems fine.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
