Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A0E233AB3
	for <lists+freedreno@lfdr.de>; Thu, 30 Jul 2020 23:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECAA6E96B;
	Thu, 30 Jul 2020 21:25:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F07B6E96A
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jul 2020 21:25:28 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id i26so17676145edv.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jul 2020 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wawmnCkVtSyffuOwOyR8jlmGJuUCenrTBxUUEtQt514=;
 b=EBuP8Sph1VcJ11/DEK8U8Vw5lkys5pkoPHdRkZ4qSn04EMNMYTDwn/188gwovds3b0
 OxdeWFiNycKygBIF6EbR439Ba0O/evJ4dO/OFAOCDCXGWdnWyuTEaEQ8pxWkgDQsDT49
 ixEd1m7vu0YdVDd23vJduP196itvUII6BXff9dn2zs9UWBlMCs1DExy4Lg6ONdto1EAN
 xJAHxGd85yfCUYW4BRAtUxIHQjFb/fYkR1sMz+pqTluqvHpLxXQjuP6uqQWzj/TQv2iK
 TWOlPm33HCVveFBueimXJMG8cza2wAsC2GHxv1npabeVJskgo2cNIa+B/RqtY2jKX2l+
 ZY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wawmnCkVtSyffuOwOyR8jlmGJuUCenrTBxUUEtQt514=;
 b=L0N/Qo04XC5DdqVCefs9LDccQIyFqw08PUOkehWIxMFURDSPrFrQoE+1BBk4rop5v8
 57IfFZ/xY5xi8+sBTLGcrMM+ewWyLuBp/+D6wV0kfXdbGx9JV6DJAx8XMEBs2ShPPHPp
 /9tnozIrSMrk2ld2lJWcmjTV9x2Ec9f+D5wqMIW2JW6PS+hVxlP6k5SCLJJdav/p+L8L
 jwv+lhybPK8PdTI37lSZhdW4vcmitWlrG+Z86a72ZNClE16KDxstLvo6Y5w/uf39bQyp
 929cKaq0Pb+Vgytwl/b+l5o5K2H3Ojr+bXTPZoG9bbOYD2mI47HAXp/SXn8JSTa1c2CW
 Ti5w==
X-Gm-Message-State: AOAM532zPvcsSpwqnwcT3wIH0lurMR2jAwR+iksfHul6IBDj7RHalxD/
 aZ/DGfRMUQW2KxvP0z9+gyhal0p0GYtMqgCVrS4=
X-Google-Smtp-Source: ABdhPJy1pelESLieAiXYCo+JBitUpkLV1nPOYhvQ2AwIzIy7aygRU3kvbY5RKU7cSN8I5DNmYQdtC1A9nfBZJYuxf0o=
X-Received: by 2002:a50:fd19:: with SMTP id i25mr976597eds.101.1596144326878; 
 Thu, 30 Jul 2020 14:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
 <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
 <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
 <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
In-Reply-To: <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 30 Jul 2020 14:26:08 -0700
Message-ID: <CAF6AEGv-e5KdbcDcst=y+h-uhDa4sKKEMoGuA88bvZ_1i46RLQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Dave Airlie <airlied@gmail.com>
Subject: Re: [Freedreno] [PATCH v5 0/6] Add support for GPU DDR BW scaling
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
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 8:37 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 30-07-20, 08:27, Rob Clark wrote:
> > Hmm, I've already sent my pull request to Dave, dropping the patch
> > would require force-push and sending a new PR.  Which I can do if Dave
> > prefers.  OTOH I guess it isn't the end of the world if the patch is
> > merged via two different trees.
>
> I don't think a patch can go via two trees, as that would have two sha
> keys for the same code.
>
> Though it is fine for a patch to go via two different trees if we make
> sure the same sha key is used for both.
>
> Will it be possible for you to provide a branch/tag of your branch
> that I can base stuff of ?
>

Ok, I sent a v2 pull req that dropped the OPP patch.  Both are tagged
so Dave can use either version, so I guess you two can coordinate this

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
