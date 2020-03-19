Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6C18BDCE
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 18:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9A86EA3D;
	Thu, 19 Mar 2020 17:17:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E956EA3D
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 17:17:11 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id k29so3005696ilg.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2puVLEy6afSLzUcb87vcVA5fc3TX3nJUf9e0Okyxfw=;
 b=INK5FY4JU9WZQN7v0WeMyVSF0VrQk4T1gnKH7Z7eZE/CF5pIMmhnuF5ojjvw0l/4DI
 /sE+czy0eVQGHT4WtOqHFcQkqMevU0FM5PUQitLidNvtV6KAnM9NiWKLo010JYNQU5Qh
 epaszkvezxUIi/XfSxWz0hyv40PCy/UNB4hPTLNLFVSqSLU7K65FLrU68coL0Mno9Srn
 79hv5y77/B0YdwIuxFdTZk8/OwkjTI8EfFwPl4ErBh9rY9C34BuyXgq77K79d+Lszgtb
 LWg0NM/Q2iz0yTSCpn7zo8VNiAJ7HNPuz/CXSzK+9b70ExbetZWf+JWrzYfJKgYjFFmq
 Y5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2puVLEy6afSLzUcb87vcVA5fc3TX3nJUf9e0Okyxfw=;
 b=Bhx7tEc5qtXcfTYdHMRqiKDbpn5QYFYLF8gioKuhjoZ8YWdjiBW1iVZsnBGbF7za1U
 52mYfxBr7UCdq+aTK/WXRNiJGlxjK5bjSQdIYW96+tjCtWTPTDE1AG8BmPTzUXdS+X2l
 /r2og9n5KZx4lm6rfFdaJBhaIf/H3AkI0JfCnIAUVRM3Cfxi6zW9UlVQYX+/uAGgRVzD
 N3lhPXtMjqHbKhLU2w6jbQmxRO2Tnys7UKnMFO7y8mHoi8AMCARkdF/W+7eAt8JLeojr
 aUGxPRwPpKvkfo0wZTyhgJhx37DYZmXgI/P2qB7CTXxJMpsduiSKhb2cAS5wY0kdi9mN
 Tvsw==
X-Gm-Message-State: ANhLgQ3PfdWAxzJAyj5gL0AFYWVlXA7PS2FsxIEra9336D/lK9XcBHPx
 uE6R1m6yp7aAJXbqEuKIALrHwigVYJsOsc+SOak=
X-Google-Smtp-Source: ADFU+vsFrtCl3nw/cH8PE23Zz0zaNQwxsOKGrtz5qBN+qCE1goDUCx0XmoX0cDrtI52kS3KiPy/h3nANlAzO8mJsV0s=
X-Received: by 2002:a92:8f53:: with SMTP id j80mr4322003ild.171.1584638230705; 
 Thu, 19 Mar 2020 10:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGWqDJ7AccvoxjKfQJ3GytJ-+u56Bk3rEn0sSYv-zCuBe1brAg@mail.gmail.com>
 <CAL_JsqLz-0myc-PSSaCQWDFXQx+=X9nBSXWsJaGCVqTFn0d5kw@mail.gmail.com>
 <CAGWqDJ4yA4ikz5MwQQwW8CAvE_dt16iuvN6cKRL2DdAuw8QWww@mail.gmail.com>
 <CAL_JsqLU4kEmRnXhQ5+gP-ZisS2Za+s6mNFg4RnMdpDtDRQB3g@mail.gmail.com>
In-Reply-To: <CAL_JsqLU4kEmRnXhQ5+gP-ZisS2Za+s6mNFg4RnMdpDtDRQB3g@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Thu, 19 Mar 2020 22:46:59 +0530
Message-ID: <CAGWqDJ5O2Lw-=5gHMja0SWVG1ttc_+7ieo-aEf7BRq+W8DGOnA@mail.gmail.com>
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

On Thu, Mar 19, 2020 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Mar 19, 2020 at 9:56 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
> >
> > On Thu, Mar 19, 2020 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Mar 19, 2020 at 1:31 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
> > > >
> > > > hi,
> > > >
> > > > I am getting the endpoint' is not bidirectional(d2l_in, dsi0_out)
> > > > warning in compilation, built boot image works on qcom apq8016-ifc6309
> > > > board with the dsi->bridge->lvds panel.
> > > > Because of this warning i cannot create a .yaml documentation examples.
> > > > Please suggest.
> > > >
> > > > tc_bridge: bridge@f {
> > >
> > >              ^^^^^^^^
> > >
> > > > arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:253.28-255.9: Warning
> > > > (graph_endpoint): /soc/i2c@78b8000/bridge@39/ports/port@0/endpoint:
> > >
> > >                                      ^^^^^^^^^
> > >
> > > Looks like you have 2 different bridges.
> > >
> > i had two bridges, if we disable one bridge also we get the warning
> >
> > arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:333.53-335.35: Warning
> > (graph_endpoint): /soc/auo,b101xtn01/port/endpoint: graph connection
> > to node '/soc/i2c@78b8000/bridge@f/ports/port@1/endpoint' is not
> > bidirectional
>
> You can't just disable nodes. To switch which bridge is enabled, you
> already have to modify remote-endpoint at the other end. So the
> requirement is you have to modify both 'remote-endpoint' properties
> (or really all 3).
>
> The other options is if you want both connections described, then you
> need 2 'endpoint' nodes to connect both bridges.
even after removing one bridge(dsi2hdmi) in the device tree, currently
using only one bridge(dsi2lvds), i do still get the compilation warning.

 graph connection
 to node '/soc/i2c@78b8000/bridge@f/ports/port@1/endpoint' is not
bidirectional

This compilation warning does not cause any problem with the boot image created
dsi -> dsi2lvds bridge-> lvds panel . Able to get the display properly.

https://github.com/vinaysimhabn/kernel-msm/blob/08e4821646b5c128559c506a5777d8782f1ff79e/Documentation/devicetree/bindings/display/bridge/toshiba%2Ctc358775.yaml

But while creating documentation yaml, it is not allowing to add this examples.
-- 
regards,
vinaysimha
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
