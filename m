Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDAE38CF46
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 22:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D556E878;
	Fri, 21 May 2021 20:46:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391E96F907
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 20:46:20 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id u11so20857616oiv.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AZ3l/zxIL/NOMMAmXJkqt/4UgOSejxRM3iDClSSiQdU=;
 b=Ff8mkYy1VgMh+ceMv4OclUbb7dT8Vk6402dzIimQOhbqu+8TA44MKkV8ZAsriosUqz
 p06OopYcjGNJbv88PHqKd4WLTO0mgUVYJAdpRS6+rW9lVjMTLwwIRwq0f26LahOd3P/E
 oCTM1QXiK5KN5pZ2uMeUqH2/EttXU4R+sdix0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AZ3l/zxIL/NOMMAmXJkqt/4UgOSejxRM3iDClSSiQdU=;
 b=a9Y0DaK49iT1dJUhBuW/bPGwe+C9P0DpA9heBXUGZxlzpYzQN3hY4URR2Be9ZwaVqv
 TlXaTYx8NZ6eWmfs3h04qaOPR9kn4Mf/Qijt396BwXKpJkeud/JT2YdWLp57CPIIu7wf
 Q8dkquwEofDQyD6Kks0GUkB9s8WSCOyRpGScv9OZuCk6pJs7vejKCLjrsX1FsCixEvC8
 A8ycfgCTfMYbYfl/sOyYzHw1le+xFGAt3LmclROcmmRbyPzCF/4cy+zN+GTLOZTmFi/2
 i1i9Lq0qY0/+YqVIIrZ/AszoUvq750EFU2mL57jaG1YMOCAy24HqiD5C/2+cbj7kC3vM
 2mnw==
X-Gm-Message-State: AOAM530cMm6iyvmlucjDnimEdZOgGKMD9S/XXI5JZ3Do4Zwz3OAMkJ95
 lyN/LVNYF+nm9HDjF/RqUsv4ytyt5tLBkBC5FeT5eQ==
X-Google-Smtp-Source: ABdhPJxf3iGsyJturbsxX9/7bpQ75ZAt2AXo0hzzCETHpkivWeeFM+PMM5T2PS9XqN2XpKKvia6FASJVYpmoO21Gesg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3612205oiw.125.1621629979564; 
 Fri, 21 May 2021 13:46:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:46:19 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 13:46:19 -0700
Message-ID: <CAE-0n50-VuzX5X1DqFJJ8ZjAjJNsnRA9S-dA+wGxox+nbZetXQ@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v17 4/4] dt-bindings: msm/dp: Add bindings
 of MSM DisplayPort controller
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
 kalyan_t@codeaurora.org, Vara Reddy <varar@codeaurora.org>, sean@poorly.run,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-05-21 03:27:24)
> Add bindings for Snapdragon DisplayPort controller driver.
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in V2:
> -Provide details about sel-gpio
>
> Changes in V4:
> -Provide details about max dp lanes
> -Change the commit text
>
> Changes in V5:
> -moved dp.txt to yaml file
>
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
>
> Chages in v7:
> - Add dp-controller.yaml file common between multiple SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
> - change compatible string and add SOC name to it.
> - Remove Root clock generator for pixel clock
> - Add assigned-clocks and assigned-clock-parents bindings
> - Remove redundant properties, descriptions and blank lines
> - Add DP port in DPU bindings
> - Update depends-on tag in commit message and rebase change accordingly
>
> Changes in v8:
> - Add MDSS AHB clock in bindings
>
> Changes in v9:
> - Remove redundant reg-name property
> - Change assigned-clocks and assigned-clocks-parents counts to 2
> - Use IRQ flags in example dts
>
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
>
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list
>
> Changes in v12:
> - remove soc node from examples (Stephen Boyd)
> - split dpu-sc7180.yaml changes to separate patch (Stephen Boyd)
>
> Changes in v13:
> - add assigned-clocks
> - add assigned-clock-parents
>
> Changes in v14:
> - add reference for ports (Rob Herring)
>
> Changes in v15:
> - drop common properties from ports (Rob Herring)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
