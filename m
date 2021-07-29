Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27E3DA9D5
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 19:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DF46EE13;
	Thu, 29 Jul 2021 17:17:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDFD6EE0E
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 17:17:00 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 n1-20020a4ac7010000b0290262f3c22a63so1746142ooq.9
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=a1Jpgqpv2djZJsAG0DhOFk0xd5WwpCit+wt+1ShQN3w=;
 b=IbUizu0+FfdESoAU8NUVe9wutrr/sa7srK/lGLGR6WuyGgwFNN9rj9qseZg3c5JZ2X
 Eufd/DoziaUsBlouBYPxXVAoGSs0/gO/pDUgoc/7GcJzr3yvkOoqAkkViqXG2Lcp/YRF
 6DjRLU9tPwM1ZchhAxMbQ1yVgg3bVbSifylTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=a1Jpgqpv2djZJsAG0DhOFk0xd5WwpCit+wt+1ShQN3w=;
 b=MsexUYKIJOPTkgnbufuyw1Z4/+3b++5v/tQLwO35f+I1xuLENSRxyvUNYWCRy/Rq01
 Gd6/HEji+KzgvyFhGW01w7d/5ybeHzyQhloP6K9qz/atS8IpwOUA67K4qKFSID+d4Q26
 nJbryACRIxThSc3bg1c2zrXoH2VXFnEAfQOkZSkGqswmfVbSQwFUihBX1/axnK6q1LHB
 UMqt+VMO8+vg47r9YtvyADPaBHGwcTxDMoZNnzqPkDqAkxM5SMWks90VM3kDvPjFuC+A
 otv9Ktb5Z8arT10aybSCPPn1WfUEl6Azlvko7+wvLH9Oeq61rFqaG3uGpaRTD9uSR5vc
 Nh5Q==
X-Gm-Message-State: AOAM533ThomNlq0vBrrFuaAZdKkJ/OcjvD2VCO/LBo1P9k3srV05Ed6I
 ZisHQMqT7KqeufsCi/z5JgBDikzc70OniupJd23A/w==
X-Google-Smtp-Source: ABdhPJxUpkwe41vVtmTrJYV492tkArFcWpTZmO6apTAf5RO4udVotcMW58RvB7J4AJBtKozsIxNZvmHe6s1rATG0IFE=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr3714787oom.92.1627579019804;
 Thu, 29 Jul 2021 10:16:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:16:59 -0500
MIME-Version: 1.0
In-Reply-To: <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
 <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:16:59 -0500
Message-ID: <CAE-0n50-1eN3wwDukJi0JoTxCKnYx8NT1Ap2r0WDftQ621iBqQ@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-28 00:17:45)
> On 7/27/2021 5:46 AM, Stephen Boyd wrote:
> > Quoting Akhil P Oommen (2021-07-24 10:29:00)
> >> Add the necessary dt nodes for gpu support in sc7280.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >> This patch has dependency on the GPUCC bindings patch here:
> >> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
> >
> > To avoid the dependency the plain numbers can be used.
>
> But, won't that reduce readability and make things prone to error?

The numbers are not supposed to change so maybe it reduces readability
but I don't see how it is prone to error.

> If
> the other patch doesn't get picked up soon, we should try this option.
> We like to get this patch merged in v5.15.

The clk binding is already picked up but Bjorn would need to merge it
into the qcom tree to use it. I don't know what the plan is there.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
