Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96ED38CF57
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 22:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277DE6F90B;
	Fri, 21 May 2021 20:47:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CFD6F90C
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 20:47:47 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so4862023ool.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=FZv+TdRvjRXdoAiuFDzSVh1xS2bkm0D0W6/+ClB4tlw=;
 b=aUJsB2gG5m+r2/oE3sh1SIEYobu4HVFKIAd1xUIwJkNi26hhPLJPwwj2Qq3wjSIAsA
 xTX8TEoaYN2XL7kLIyx9CYj9LltNGXBW8HbzgD42bLQzWGPBwvTq0xaahoQsoy1F6UAE
 oTbSMRLTR/hToYwszdZInC1oO6KLxOf8ojy+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=FZv+TdRvjRXdoAiuFDzSVh1xS2bkm0D0W6/+ClB4tlw=;
 b=YNnfbJ1Z0ufKufmOZdMV6tUhFPZL9GonE6CW2LrJqtpLz6cKDyBb4wC1ZI3RAx9NXT
 aDmkZv/H4OhEMps68YiMsFOkVSSkXOZEQdbbWZQ0DF1VPv7hsQqiZ9B6gSdOL23IWj0o
 qburxucYJb08lPXDVV4AwaIJqbg2zLNBTU3Lgz8SE7A4ZhjGCKDEGr8eT294M8k8Ffkj
 M9sdkZ/l2v4grlMDsdFhOkWODBSx7gN3oeAMF2MQdVG1kUHMDyeZeN5/t5hxbbjSHDKu
 dxETA+nCaHYkNSubvZt6SlmZrUWTeRlSi7HoSmkkW1xfQCQSuLxi1W1u12zPIZRAR3a8
 IaLg==
X-Gm-Message-State: AOAM530imixrGCqjecdSRB79gwuc1o96qtGTEE2eTZImxaMbRz/6Y3Sl
 VnWseIblZUXuZtSQv8ozU2WPA+QRV/Sa1b7T9y8piw==
X-Google-Smtp-Source: ABdhPJyUmsRhbIFY6CiBuzJMtveYnQvcH/rQqHjH9C2afTGvPXZxmvEgG0Aqoi3ktvGUfo062P/DR8+bldZq9BSb9n0=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr9705115ooh.80.1621630066738; 
 Fri, 21 May 2021 13:47:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:47:46 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 13:47:46 -0700
Message-ID: <CAE-0n52w3YW=-KOas6T9Fn31wOMafoCima9Od3wZ=D24+=n-8g@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v17 3/4] dt-bindings: msm: dsi: add yaml
 schemas for DSI PHY bindings
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
Cc: robh@kernel.org, vinod.koul@linaro.org, dianders@chromium.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, khsieh@codeaurora.org,
 robdclark@gmail.com, robh+dt@kernel.org, tanmay@codeaurora.org,
 kalyan_t@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-05-21 03:27:23)
> Add YAML schema for the device tree bindings for DSI PHY.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
>
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
>
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
>
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
>
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
>
> Changes in v6:
>    - Add proper compatible string in example
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
