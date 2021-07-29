Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0BD3DAA6B
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 19:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22116EE1E;
	Thu, 29 Jul 2021 17:39:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C81C6E1B5
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 17:39:34 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id y18so9466024oiv.3
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fg6r52inow2eredqNuunrN7gPgWwoSNQkX9Rb9jl48w=;
 b=W0ikMwg+8KsECvQ2qw9xlVmGUUVSsYwLa9jasRSdD+NCNBIZwzY1r5dkfyTmQLWSoJ
 g/yrb0s7IUD8/WVqQTaSf+UpC5c1SsZzIVJTEM3UAJkev5aZmmyfnjhMT9W72MfP+gvm
 9/JPIICpRZsQqNNaMkMitnTTQRvC4fRM+/SI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fg6r52inow2eredqNuunrN7gPgWwoSNQkX9Rb9jl48w=;
 b=gvniGD/q55IHq0N1wqbuuGKcWCRVy4Ob2s3bTEoehZLmGRDVOohe1C/EhyvC1mgNos
 5e6dHymzTogwOfM20uo3YD73i0Wu05Y4mFExW9nrDNPpvY8sS0PSvA0q4nvz7vxoWtVp
 nQlxUpW8V6J/FfS+4h6NztyfZzgVUXRuwgL7eFoccfYX56nao7vs4hVyzMRpatgLvG+k
 VvDWwJWk9iuqTBoS9boPXkK6Ug+tcXHnFiOFLb2oC7e76WrqQtJQWge3xybgHFwhv4OB
 y54jdnwbdr7N4vP3+xwD6oYNZE9T2XVvo1pcRZxQz3+KDsKFDF7WvGWMkWyrhff4Re+y
 2sFA==
X-Gm-Message-State: AOAM531pBE6a2eTO93jxgzEsNy1FNjDrTyA/rxxWdCkV8bl66SLS2HgX
 WaSrkpd9GXSWmGC7g3TUzKTLdp19Qd0kaSeQfA14LQ==
X-Google-Smtp-Source: ABdhPJx96s/1lMlV94WjqJ7laUXC8JpsMbaub1L0ZBuEamot2D9hwru5WMKYSTLrcgsmmPz4jXxWGmzs2Pt/Y2uhplQ=
X-Received: by 2002:a05:6808:619:: with SMTP id
 y25mr2332599oih.166.1627580373628; 
 Thu, 29 Jul 2021 10:39:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:39:33 -0500
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv9G99YqEixdUZCLxEgXX1+EqcjgQP-v5CCuj64sv_bTA@mail.gmail.com>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
 <CAF6AEGv9G99YqEixdUZCLxEgXX1+EqcjgQP-v5CCuj64sv_bTA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:39:33 -0500
Message-ID: <CAE-0n5218NnzabN=PqpRTgPSza8GjCyY4=DmdR=LTbeFtvciuA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add gpu
 support
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
Cc: OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>,
 freedreno <freedreno@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-07-29 10:35:32)
> On Thu, Jul 29, 2021 at 10:19 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> >
> > Why is 450000000 after 550000000? Is it on purpose? If not intended
> > please sort by frequency.
>
> We've used descending order, at least for gpu opp table, on other
> gens, fwiw.. not sure if that just means we were doing it wrong
> previously
>

Ah I missed that. I don't think one way or the other is mandated, but
we're already sorting other OPP tables in the qcom dtsi files in
ascending so this is the only one that is different.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
