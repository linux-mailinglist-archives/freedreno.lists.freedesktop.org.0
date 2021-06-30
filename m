Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372A3B8808
	for <lists+freedreno@lfdr.de>; Wed, 30 Jun 2021 19:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334A06EA63;
	Wed, 30 Jun 2021 17:51:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9A06EA63
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jun 2021 17:51:44 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id 22so3971942oix.10
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jun 2021 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/TpbbonyK5cx17STCT313YsMTZEN2Fa3252nyd5WAKY=;
 b=jZqjlYVOYTUdCBUwZYbUuN6kEGJHaE+01/l3M/0kh7APq5t1yDwuo+++hYoCABGFz0
 x9g5o3Rjpx8HY7ff7/QyNQLNZHhXOBBrSX0v+/uXUmUrzI4JO046LWlbpgwdq8pEOMqJ
 tHznXazHFvqaC2AaPQr5lZ+yZNbFgB+d5+Gus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/TpbbonyK5cx17STCT313YsMTZEN2Fa3252nyd5WAKY=;
 b=F0C2AwNuj+sLYGYAjYX1GtP95YqF79Rz9dE+dCu+elErlNsPUXWe8UTPdKpGgPRou2
 jnvkn8/Hrifijvs/fTm1Zclq1FTEkpBQETmexsycDPUAtff2J3yZPEXqufmEkk/xq0Oe
 /fdMSsYX8QTpHqhcqx8iLsVzgnHPxF+vgb/sFlyN8zOBmZ1RHJFNfunz72Nm1MoEoJCJ
 y8nuV5GDKM8NJ5zECYVv5vNpXlVxElK41LYjHFx+3FNmyUh6alFwKQsZLW+PIkfkR6bu
 Bm5wQVgA+cdZI/eOiUXtL3l2VPsIrmZmZ7FSht3PSUiDxg+hPgqe3qQdu9jLcOMwMDcR
 WWkg==
X-Gm-Message-State: AOAM530yI+wiYhGv+jvBIzteaOKX0AMk2xnaIObz3rDkvljvXWXNuNTD
 aPjLCmFv0BrJhH91w5zbarvue86JUAAP/SqkuMaRng==
X-Google-Smtp-Source: ABdhPJyt1BT0yyy26ZENhSRgNlnZIfJxRS8zE0C7/7zupBgcDtyelBnghwpsMShvQXBW5bgL8j5LBbgVPi78511rLKY=
X-Received: by 2002:aca:5390:: with SMTP id h138mr3968714oib.125.1625075503995; 
 Wed, 30 Jun 2021 10:51:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Jun 2021 10:51:43 -0700
MIME-Version: 1.0
In-Reply-To: <YNYAuaBrGgdtToph@builder.lan>
References: <1622758940-13485-1-git-send-email-khsieh@codeaurora.org>
 <YNYAuaBrGgdtToph@builder.lan>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 30 Jun 2021 10:51:43 -0700
Message-ID: <CAE-0n500g=KuOsRgHe2vpL2JOuq+LRFEWEdEovMg8BJF4cKD1A@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4] arm64: dts: qcom: sc7180: Add
 DisplayPort node
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, agross@kernel.org, abhinavk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-06-25 09:13:45)
> On Thu 03 Jun 17:22 CDT 2021, Kuogee Hsieh wrote:
> > +                                             dp_out: endpoint { };
> > +                                     };
> > +                             };
> > +
> > +                             dp_opp_table: dp-opp-table {
>
> I forgot that our discussion about the node name here was on the
> previous revision, _this_ is the patch I will drop the "dp-" from and
> apply.
>
> And as I've looked at this quite a bit now:
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>

With that node name fixed

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
