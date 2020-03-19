Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D629F18BB76
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 16:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693DF6EA32;
	Thu, 19 Mar 2020 15:46:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389D26EA32
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 15:46:50 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2F192166E
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584632809;
 bh=YXtJWeRR6Vovu/W2MX39oIxMBSo5ZQ0F3zeEfbi6qaQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HEarTHnydTLvUXh7rMgmQSRm893OK/5bu3axioBkVGQ3M5vQ53iN6GRVsJrq/FmhA
 pZeIT4HEpRKPw2pdkBguEaDcSWoAl2Gq5MRNmUJLb382GPvqY9eLxFSaLtN92mv9H8
 WyNfgRKQuCKKgT80y5zGaKRmGJ5cqwmE/JqyIyak=
Received: by mail-yb1-f179.google.com with SMTP id x63so517936ybx.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 08:46:49 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2bN6a9DFxMi9T1BhVsRVzLfPx1MEfPYyb9odgOxED4iV1zhU62
 UEtO7EjJ3ixBAty3aWGrtu8jSGPcbn3FXPsUrA==
X-Google-Smtp-Source: ADFU+vtd+SPJ7TSQgni57vrZn7xEo4wgYma5Cj6dlM0fP50Nbgkx5pq2oThg9Le7uMFlq2bBxqeOEDl7QeYH0eoLYKk=
X-Received: by 2002:a25:f08:: with SMTP id 8mr5301607ybp.377.1584632808916;
 Thu, 19 Mar 2020 08:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAGWqDJ7AccvoxjKfQJ3GytJ-+u56Bk3rEn0sSYv-zCuBe1brAg@mail.gmail.com>
In-Reply-To: <CAGWqDJ7AccvoxjKfQJ3GytJ-+u56Bk3rEn0sSYv-zCuBe1brAg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Mar 2020 09:46:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLz-0myc-PSSaCQWDFXQx+=X9nBSXWsJaGCVqTFn0d5kw@mail.gmail.com>
Message-ID: <CAL_JsqLz-0myc-PSSaCQWDFXQx+=X9nBSXWsJaGCVqTFn0d5kw@mail.gmail.com>
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

On Thu, Mar 19, 2020 at 1:31 AM Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> hi,
>
> I am getting the endpoint' is not bidirectional(d2l_in, dsi0_out)
> warning in compilation, built boot image works on qcom apq8016-ifc6309
> board with the dsi->bridge->lvds panel.
> Because of this warning i cannot create a .yaml documentation examples.
> Please suggest.
>
> tc_bridge: bridge@f {

             ^^^^^^^^

> arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:253.28-255.9: Warning
> (graph_endpoint): /soc/i2c@78b8000/bridge@39/ports/port@0/endpoint:

                                     ^^^^^^^^^

Looks like you have 2 different bridges.

Rob
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
