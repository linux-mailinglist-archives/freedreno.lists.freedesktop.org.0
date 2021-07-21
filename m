Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECC3D19D1
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 00:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EB66EB3A;
	Wed, 21 Jul 2021 22:40:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AC96EB47
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 22:40:12 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 s2-20020a0568301e02b02904ce2c1a843eso3529928otr.13
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Q4wvBXyV2lJ1aTRox0e1+Ok+AEaw/CVcGBs0YMHYsP0=;
 b=XqZH1FzW4TAdt+62lo9scgkSGaBidkfe9huO0q1U3Ro1mui8RWXUgDF4qzAHCY6Ru+
 iZ8zSponbgyYt6LXGU0IodEXLM8IGxpYpjT2JbWrcYJxLuLC7ydskbWTAd4EndoQ0uzM
 zAZJ+shbHzcPMS1D4t5gFzBXtgmxI7uFF4NFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Q4wvBXyV2lJ1aTRox0e1+Ok+AEaw/CVcGBs0YMHYsP0=;
 b=JGVXXL9Bloa5wf0qdFi0lpKk8fyDl1oN1S+vJcaEywS2/ao2WBVdUkbfc9YyPo/WFu
 clH21lKNkXfHCrc7LfmOEY75i5UKO3PbknlD6PWmX0FwbWQ6Fy7wUbqD6WRU7HnoXYro
 rG1k9qiM5OAfmUHQQfQwzZRXi091YhX6GCi4cFJq4Ou6Z4Uulmg8ImU1J/ZDm0xXI/5K
 vmqK/qO2FIx0z6QMehWl0ZcsKb/LWfP7VTmCPqc6/JEkOEokgXTn790htlSIQcA104j1
 uMNaLHaBMs0pqm8009Hd/wlUDQ0VYmiPFvxNefvLbsaEbhqWxg5ySwLXF4Ao0g0FG4pF
 YJ+g==
X-Gm-Message-State: AOAM531TrFZi5dmTa8y5ghj1mDmEpq/jmNAneKnBnCM7fLNfpeJO8BbX
 pKmh1oCmoJb4HfBb27r9vvb0iwcCNu/CllGMhGHKxQ==
X-Google-Smtp-Source: ABdhPJwocIiRhFwFOnsM81FkofvQbBA36K0D5dCAYY3+kDkw8/j6vCVRW/AWV4EzATwWCQE40EPyTZCpO+0f5mG/y5g=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr27826933otf.25.1626907211418;
 Wed, 21 Jul 2021 15:40:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:40:11 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 21 Jul 2021 22:40:10 +0000
Message-ID: <CAE-0n50Km=XxJ93ZJkwcWWJdzvBba_We=bZYzkdYKoB-cwTYkg@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [v2 1/3] dt-bindings: msm/dsi: Add sc7280 7nm dsi
 phy
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
Cc: robh@kernel.org, jonathan@marek.ca, mkrishn@codeaurora.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 robh+dt@kernel.org, kalyan_t@codeaurora.org, dmitry.baryshkov@linaro.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rajeev Nandan (2021-06-22 05:42:26)
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
