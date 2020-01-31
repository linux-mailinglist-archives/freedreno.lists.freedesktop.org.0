Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECAC14F067
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2020 17:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A546FB96;
	Fri, 31 Jan 2020 16:08:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE6E6FB96
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 16:08:27 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id c129so2209637vkh.7
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
 b=cCCXrbR60CBlDAGSpmvFYrjjyE1DVVDlZhNhjXqkIlKpR2BcoPRCHGrUSSTCDfRqDk
 72D2LUsRS4KoF3mrsLr5JyigXGZ9EsF0j5WPA+OZLvWstHHFS/ADUWF2H+JRsfTpY1YT
 ZYDGjjQ7IrKGRYG64lWiFl0zCmZnBnqC4m0/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
 b=GNHXg7hioQ3ZxafH0G0MhkolaMlhdavwRldkO6Rmh13f9UpjaweCIHZSyoPCDITf0Y
 Q39/JG62giO1rytLt/aogon3JwffzLYXcPCKDQPUR519PZkAm5ONiY3vYBdJuiwL7Zif
 QoaJFoUwMeAypAFvDmoPh/7pKvu4Aqjl2Moa5QJemQeaVwWCOn2xDlj78HGudW02boqv
 GEOxQpbzPm9AXb3SlAluwh8AaHzsTQZrJ54NwYFqPSLXXocV5HLtx7Y3xWokLSBotKU0
 8gUGIKYZGs0gcb/0IZFF70DxelzMxu0QaZIV/8wjpCWIQtvmZwDERGKorEQlCe86VwJk
 kJiw==
X-Gm-Message-State: APjAAAXl4Wtdmcbfwg3UOd9PgPZffwR4RTBogBeQYEGjsoWnv1+0cXpv
 Xcm5rpvb0kHnPJ21fESvEb2KwFjPIdQ=
X-Google-Smtp-Source: APXvYqyYeXpXGJabcZB+KWkx/wQ7NOds8SQd2jtbonwXTdSJZwRNQQyR6NuW4eaG9MUZluCGStV6Mg==
X-Received: by 2002:a05:6122:48c:: with SMTP id
 o12mr6792118vkn.35.1580486905677; 
 Fri, 31 Jan 2020 08:08:25 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id w187sm2723625vkb.8.2020.01.31.08.08.24
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 08:08:24 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id o187so2215602vka.2
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 08:08:24 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr6709266vke.40.1580486903706; 
 Fri, 31 Jan 2020 08:08:23 -0800 (PST)
MIME-Version: 1.0
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
 <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
In-Reply-To: <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jan 2020 08:08:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu
 dt blob
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 31, 2020 at 4:16 AM <smasetty@codeaurora.org> wrote:
>
> >> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000
> >> 0 0x10000>,
> >> +                               <0 0x0b490000 0 0x10000>;
> >> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> >> +                       interrupts = <GIC_SPI 304
> >> IRQ_TYPE_LEVEL_HIGH>,
> >> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       interrupt-names = "hfi", "gmu";
> >> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> >> +                              <&gpucc GPU_CC_CXO_CLK>,
> >> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> >> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> >> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> >> +                       power-domains = <&gpucc CX_GDSC>;
> >
> > Bindings claim that you need both CX and GC.  Is sc7180 somehow
> > different?  Bindings also claim that you should be providing
> > power-domain-names.
> No this is still needed, We need the GX power domain for GPU recovery
> use cases where the shutdown was not successful.

This almost sounds as if the bindings should mark the GX power domain
as optional?  The driver can function without it but doesn't get all
the features?  As the binding is written right now I think it is
"invalid" to not specify a a GX power domain and once the yaml
conversion is done then it will even be flagged as an error.  That's
going to make it harder to land the your patch...

> I am working the Taniya
> to get the dependencies sorted out to bring this change in. This should
> be
> okay for the time being.

What breaks today if you add in the GX power domain here?

Oh, I see.  It's not even provided by the 'gpucc-sc7180.c' file.  What
happens if you do this for now:

  power-domains = <&gpucc CX_GDSC>, <0>;
  power-domain-names = "cx", "gx";

That seems to be the trendy thing to do if a phandle to something is
"required" but the code isn't ready for it.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
