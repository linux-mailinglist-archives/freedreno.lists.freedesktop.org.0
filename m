Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BAF18C684
	for <lists+freedreno@lfdr.de>; Fri, 20 Mar 2020 05:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781876EA2F;
	Fri, 20 Mar 2020 04:33:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E8C6EA2F
 for <freedreno@lists.freedesktop.org>; Fri, 20 Mar 2020 04:33:06 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id o16so1825623ilm.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 21:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ro5OadTTl3oAqQ/6no0uJfVHWvcAkSf0Yfq3aWJWa6g=;
 b=fXOUpHvBPwDbnC68taQsc1k3pAGc2pwxjBqO/zc0oYzSgAmhaulpGsGTwsbBjWIFS/
 SOyDc1vQ9hmjGCa/uiMZubIdICOei4he1mcycDYXSsTNGnw9F/yc70+pF6njq0cF7MZW
 fMxe5L41GdcDzxqPoVJK4W9YOnfMUpN4XXA95sVo1KDYrHU5w5FeIGfbpUjhc5/f0HDl
 9f0GpD/+Scynia4pKTyOuqYi+hPQw4KG3XKl5aWKab6SzNzYEpa+rkVV42c1HrVgEQBJ
 H1eYxTubgoYzDmhbDyKVs2HOnUl9nyECytr1jkLscawh5SRjgvgvLNPfqI2G4ps3DhCo
 2njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ro5OadTTl3oAqQ/6no0uJfVHWvcAkSf0Yfq3aWJWa6g=;
 b=RAJ5KtDqZORSSGIcFk0PB23Fn58bnTMU9fGmn9RCHqE+RZSyCZSyKqgoPCE0PvHxYo
 IQyJtxpVkVm6bqKBHtQ5HcqjUgFfzxK2kimp9ZZNt8F+QHcZ8t03xOQfk/W9yThIP7m5
 s8/+ttxVvdMQIK3tSel+zz1OgQ5J8D9qu5lHmn67Rpqm3SU2INZiTlp4uSiLzLocqTTk
 AwxLYObGmZbp7sES0Df8+qfu5IDMeFGmhsQ9mVYLkGRJ+qM3MjNdegBcReflCebP7NLT
 1zJr9FKHoqj3Tmw8v7cjaRuibBnunlWvxEYk95aJo4UwStYeDzD8AxFWL3wlYKKDtfun
 XajQ==
X-Gm-Message-State: ANhLgQ2A6Jha5M854mHUr6Tq2sXogd97vnHH8N0cDrt7ruIBbH1fjkDu
 /CLpsaStPxUjHKMoLfVOR6k/OFSkNOoJ2VKI2FKJBQgK
X-Google-Smtp-Source: ADFU+vtbcC/xcbQhZMdEZ8Lc2LQUNOxiprDZuV7nqcfWnoZVxekI/Le/jXYa4uUo/aA2/Cnk3NEIJhDfMdgceFlmw+c=
X-Received: by 2002:a92:ba01:: with SMTP id o1mr6142269ili.217.1584678785668; 
 Thu, 19 Mar 2020 21:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAGWqDJ7AccvoxjKfQJ3GytJ-+u56Bk3rEn0sSYv-zCuBe1brAg@mail.gmail.com>
 <CAL_JsqLz-0myc-PSSaCQWDFXQx+=X9nBSXWsJaGCVqTFn0d5kw@mail.gmail.com>
 <CAGWqDJ4yA4ikz5MwQQwW8CAvE_dt16iuvN6cKRL2DdAuw8QWww@mail.gmail.com>
 <CAL_JsqLU4kEmRnXhQ5+gP-ZisS2Za+s6mNFg4RnMdpDtDRQB3g@mail.gmail.com>
 <CAGWqDJ5O2Lw-=5gHMja0SWVG1ttc_+7ieo-aEf7BRq+W8DGOnA@mail.gmail.com>
In-Reply-To: <CAGWqDJ5O2Lw-=5gHMja0SWVG1ttc_+7ieo-aEf7BRq+W8DGOnA@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Fri, 20 Mar 2020 10:02:54 +0530
Message-ID: <CAGWqDJ6MyLVVqfZvO4VY5NQ9ESz8vL1BE7j_pHrpe4X_LLwMJQ@mail.gmail.com>
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

rob,

issue got resolved. the problem was end node of the panel had the label.

- panel2: eppendorf {
+ lvds-out {

https://github.com/vinaysimhabn/kernel-msm/commit/a7bf9ccd0b61cb355fe7fa768e65b6f04cfa686f

thanks.

On Thu, Mar 19, 2020 at 10:46 PM Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> On Thu, Mar 19, 2020 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Mar 19, 2020 at 9:56 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
> > >
> > > On Thu, Mar 19, 2020 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Thu, Mar 19, 2020 at 1:31 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
> > > > >
> > > > > hi,
> > > > >
> > > > > I am getting the endpoint' is not bidirectional(d2l_in, dsi0_out)
> > > > > warning in compilation, built boot image works on qcom apq8016-ifc6309
> > > > > board with the dsi->bridge->lvds panel.
> > > > > Because of this warning i cannot create a .yaml documentation examples.
> > > > > Please suggest.
> > > > >
> > > > > tc_bridge: bridge@f {
> > > >
> > > >              ^^^^^^^^
> > > >
> > > > > arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:253.28-255.9: Warning
> > > > > (graph_endpoint): /soc/i2c@78b8000/bridge@39/ports/port@0/endpoint:
> > > >
> > > >                                      ^^^^^^^^^
> > > >
> > > > Looks like you have 2 different bridges.
> > > >
> > > i had two bridges, if we disable one bridge also we get the warning
> > >
> > > arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:333.53-335.35: Warning
> > > (graph_endpoint): /soc/auo,b101xtn01/port/endpoint: graph connection
> > > to node '/soc/i2c@78b8000/bridge@f/ports/port@1/endpoint' is not
> > > bidirectional
> >
> > You can't just disable nodes. To switch which bridge is enabled, you
> > already have to modify remote-endpoint at the other end. So the
> > requirement is you have to modify both 'remote-endpoint' properties
> > (or really all 3).
> >
> > The other options is if you want both connections described, then you
> > need 2 'endpoint' nodes to connect both bridges.
> even after removing one bridge(dsi2hdmi) in the device tree, currently
> using only one bridge(dsi2lvds), i do still get the compilation warning.
>
>  graph connection
>  to node '/soc/i2c@78b8000/bridge@f/ports/port@1/endpoint' is not
> bidirectional
>
> This compilation warning does not cause any problem with the boot image created
> dsi -> dsi2lvds bridge-> lvds panel . Able to get the display properly.
>
> https://github.com/vinaysimhabn/kernel-msm/blob/08e4821646b5c128559c506a5777d8782f1ff79e/Documentation/devicetree/bindings/display/bridge/toshiba%2Ctc358775.yaml
>
> But while creating documentation yaml, it is not allowing to add this examples.
> --
> regards,
> vinaysimha



-- 
regards,
vinaysimha
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
