Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0A18BBAC
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 16:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D74189206;
	Thu, 19 Mar 2020 15:56:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA68E891CE
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 15:56:20 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id e8so2646757ilc.13
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Oe3tZnlY6/KuRlOI7OFPdet6pAve6TTNZgtPCWHdkQ=;
 b=qmwUl2cCOkv8Juu5QIjVv+mfJSgEvatbmp8Z9/F5NCLbSaZoSbRjhZ+/3KDEVmcSc3
 1fLfa1kxoxDOsY6FhZeEwDyrrpuYi5H2I0yMB08ACYc5qQKSK6mEeynlT8zDozNtkWXZ
 /Ohg+iN4Pajuno5gGqDaNe3P044rFVttjoZ7HvNZqods2cB/8a+/GKequWusxdx2+SQZ
 v2E9+WuP/v6ss24iUOCPgtDUMW0UcaeBT7vdbcTWa08SHz9iq2XjhG9A8ERe3AwmgZmj
 xuLLpJkDpFERfSXJ5HZEStbiCyd8wYcY2Ja/IamBb4hINSLtQ7yRi8tTUkjGhA080fP4
 1WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Oe3tZnlY6/KuRlOI7OFPdet6pAve6TTNZgtPCWHdkQ=;
 b=RqLVEzun5y07vMDGtAchSUlq1fsSkvmzH2gP/hF1Nuf0DnH8IJhtElCZDoAILk0n56
 CgeLxq+8NDrT6DMQao+KGfMn/x/M6Nomq7n+qfbdp/VcV99DzKfG9VplDBHgJQObqC54
 WnI2T7/O+o1eiADoRLvykVRYxvNEHS/6nJWfXO+Luh3gMKkab+wiBNv8HNJKj8dFEirT
 AGZOXo2HThY372TAl5nGcXJtvHvHRg5vc/g8t9j+xVQWCGhjmn6tUT0cuO5hG3TZfwon
 n0rV/3gWA5lL9K/+SEF9vYaWsU8HY9iy/pCGwIEWcDVUk/PBtI3ie5C7LTUHm7t5whGj
 S3EQ==
X-Gm-Message-State: ANhLgQ0fRN8d/DNGWXDQjTHtbMS99jBYG2FRMyhomtMulxJegtVu9tHk
 f+orYOKPYDXWJWJHdOQmaFCwLHNHVKZBeyt7oDo=
X-Google-Smtp-Source: ADFU+vsUdxL8KHJ1QgHWxhfoqPUE1f1HWD1267J/n4NTG29cGwbVqnBce65P9Y2YzDoQ9uH613GVP5nXPCHWunkOm7g=
X-Received: by 2002:a92:d20a:: with SMTP id y10mr3907806ily.1.1584633380036;
 Thu, 19 Mar 2020 08:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAGWqDJ7AccvoxjKfQJ3GytJ-+u56Bk3rEn0sSYv-zCuBe1brAg@mail.gmail.com>
 <CAL_JsqLz-0myc-PSSaCQWDFXQx+=X9nBSXWsJaGCVqTFn0d5kw@mail.gmail.com>
In-Reply-To: <CAL_JsqLz-0myc-PSSaCQWDFXQx+=X9nBSXWsJaGCVqTFn0d5kw@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Thu, 19 Mar 2020 21:26:08 +0530
Message-ID: <CAGWqDJ4yA4ikz5MwQQwW8CAvE_dt16iuvN6cKRL2DdAuw8QWww@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [Freedreno] graph connection to node is not bidirectional
 kernel-5.6.0-rc6
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Mar 19, 2020 at 1:31 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
> >
> > hi,
> >
> > I am getting the endpoint' is not bidirectional(d2l_in, dsi0_out)
> > warning in compilation, built boot image works on qcom apq8016-ifc6309
> > board with the dsi->bridge->lvds panel.
> > Because of this warning i cannot create a .yaml documentation examples.
> > Please suggest.
> >
> > tc_bridge: bridge@f {
>
>              ^^^^^^^^
>
> > arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:253.28-255.9: Warning
> > (graph_endpoint): /soc/i2c@78b8000/bridge@39/ports/port@0/endpoint:
>
>                                      ^^^^^^^^^
>
> Looks like you have 2 different bridges.
>
i had two bridges, if we disable one bridge also we get the warning

arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:333.53-335.35: Warning
(graph_endpoint): /soc/auo,b101xtn01/port/endpoint: graph connection
to node '/soc/i2c@78b8000/bridge@f/ports/port@1/endpoint' is not
bidirectional

> Rob



-- 
regards,
vinaysimha
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
