Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775A718BD85
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 18:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6D389BA5;
	Thu, 19 Mar 2020 17:06:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09CD89C6C
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 17:06:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BD342072D
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584637588;
 bh=aP9ejx7SnCaC82qYc3Vt82pK0yL3U36c8HGf9fweu5k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=z/xzs4lVTga51D541daNwW1qQE5jy6EGgW6p30M0xTxCFo/HCMnI2Lr7vdYs60Dhr
 7Qvl9srL4M5MIQmzkuFeJdhOFGgGV7IWP28Uk3YDvLK7bIv08xRPcBc7TzZvy5VOgx
 YTpSUH6hr/+/N/o6s74gix+7U7bcGFyWAnUKJDs8=
Received: by mail-qt1-f181.google.com with SMTP id l13so2436242qtv.10
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 10:06:28 -0700 (PDT)
X-Gm-Message-State: ANhLgQ26s1GQrfDSzvrfTBA7uBiMVZ7wrmrcPhDZe8Zc13ZoDiZngP+2
 fxwzQIyqfhbgCuqFE1FJy5CWTjTlwq6D7TQA/A==
X-Google-Smtp-Source: ADFU+vt+yFqWedpHLHifVRY04DtI47w8tUOPVx49UqRoZIuaFPvx2qIUuM2+JMkhxWeFf5AgL90mTKdywpKvgvFxzBQ=
X-Received: by 2002:ac8:59:: with SMTP id i25mr4039750qtg.110.1584637586896;
 Thu, 19 Mar 2020 10:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGWqDJ7AccvoxjKfQJ3GytJ-+u56Bk3rEn0sSYv-zCuBe1brAg@mail.gmail.com>
 <CAL_JsqLz-0myc-PSSaCQWDFXQx+=X9nBSXWsJaGCVqTFn0d5kw@mail.gmail.com>
 <CAGWqDJ4yA4ikz5MwQQwW8CAvE_dt16iuvN6cKRL2DdAuw8QWww@mail.gmail.com>
In-Reply-To: <CAGWqDJ4yA4ikz5MwQQwW8CAvE_dt16iuvN6cKRL2DdAuw8QWww@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Mar 2020 11:06:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLU4kEmRnXhQ5+gP-ZisS2Za+s6mNFg4RnMdpDtDRQB3g@mail.gmail.com>
Message-ID: <CAL_JsqLU4kEmRnXhQ5+gP-ZisS2Za+s6mNFg4RnMdpDtDRQB3g@mail.gmail.com>
To: Vinay Simha B N <simhavcs@gmail.com>
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

On Thu, Mar 19, 2020 at 9:56 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> On Thu, Mar 19, 2020 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Mar 19, 2020 at 1:31 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
> > >
> > > hi,
> > >
> > > I am getting the endpoint' is not bidirectional(d2l_in, dsi0_out)
> > > warning in compilation, built boot image works on qcom apq8016-ifc6309
> > > board with the dsi->bridge->lvds panel.
> > > Because of this warning i cannot create a .yaml documentation examples.
> > > Please suggest.
> > >
> > > tc_bridge: bridge@f {
> >
> >              ^^^^^^^^
> >
> > > arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:253.28-255.9: Warning
> > > (graph_endpoint): /soc/i2c@78b8000/bridge@39/ports/port@0/endpoint:
> >
> >                                      ^^^^^^^^^
> >
> > Looks like you have 2 different bridges.
> >
> i had two bridges, if we disable one bridge also we get the warning
>
> arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:333.53-335.35: Warning
> (graph_endpoint): /soc/auo,b101xtn01/port/endpoint: graph connection
> to node '/soc/i2c@78b8000/bridge@f/ports/port@1/endpoint' is not
> bidirectional

You can't just disable nodes. To switch which bridge is enabled, you
already have to modify remote-endpoint at the other end. So the
requirement is you have to modify both 'remote-endpoint' properties
(or really all 3).

The other options is if you want both connections described, then you
need 2 'endpoint' nodes to connect both bridges.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
