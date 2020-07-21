Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4F22821B
	for <lists+freedreno@lfdr.de>; Tue, 21 Jul 2020 16:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1F76E503;
	Tue, 21 Jul 2020 14:27:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D26E503
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jul 2020 14:27:55 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id n22so18910051ejy.3
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jul 2020 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FoM2lLvk+HU1JsguyDzCkDhJcQpe74th81bnFKHZ61k=;
 b=Tb36TVsvZyPVCNfk8o0RlrlP+mnR/eMaGMgp6Ca1CqlBYlXZG8opeFsuRSmWNEGnGT
 3a0tm2PbY756z7t31/5nk17pGk2BzWpoQBFQIyUej3lj4szEfe+nJh91oxub3Fy77Ztt
 tf4BTSjY2cEUt7m4bl9/ZYp4SZnw4Fi3KOq/M6F92/ntlTkSAaLFhE1WGSUUQImHNrKr
 tcRL5XsJwxlx/iEv9vt86Kc3XkyDdsQYaX8qd020OiJ4QhECITtA7w3G5t4t+V4XhVDz
 ZBaw6bBvig4y+KfHz01SUMWZbGu+5lTOxxFaAfSXLQu4XEfbEWDywzSrEfb7texqDZ4G
 aW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FoM2lLvk+HU1JsguyDzCkDhJcQpe74th81bnFKHZ61k=;
 b=PTGzeSOghb+5gunDocY+wSRfqHHW6Pei85h9Vkz4PwXVBqqx63q+Hj31Qd7qgcr/YS
 Y2e0Qe3YWDzcBGzV3X8domNZ5OaWPZX1KwxRpaR+j5sUb+3/ZBSOsQQJM7h+P6x4zqlI
 A/I4Kv1vhWOdcWcpcCzEHInp58gAoH0v15gMneRDBGJ+vWWbcp07pzWanT88WtkSh2Uf
 L4XxLj0Z3aMDFdJeKmXOr1sLUkothOY1cawlYiCXOsmLo6pcEEILfoVef7ALYLdVhvfV
 VWT4Vehr3H9Z4kBzxgBxXAnVdBd/KjykiLsAmlmzy+MDmXSHbYnLNckNKF7n9VDUxHDk
 B4XA==
X-Gm-Message-State: AOAM533yY4aMd/EHH0HdYiaK/kFYqBVZK4oS4874IdELOAn+6++FY6o5
 HbfCwA//bVVxnwLGcAntuzwW9bE8oY8eciBuOdw=
X-Google-Smtp-Source: ABdhPJzSo6Fh1hKllPx1Sf8jn5wjHy9PnUTmzYxaeqSTRJRgYWldpUIItzBxdpOIlcnV/OUxWXwrM0RFinDCHwJeuFY=
X-Received: by 2002:a17:906:ca4c:: with SMTP id
 jx12mr24039568ejb.231.1595341674113; 
 Tue, 21 Jul 2020 07:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
In-Reply-To: <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Jul 2020 07:28:30 -0700
Message-ID: <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
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
 dri-devel@freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 8:24 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-07-20, 08:03, Rob Clark wrote:
> > On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 15-07-20, 08:36, Rob Clark wrote:
> > > > I can take the first two into msm-next, the 3rd will need to wait
> > > > until dev_pm_opp_set_bw() lands
> > >
> > > You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> > > it anymore.
>
> This was 5.8-rc1 + 2 patches for OPP. That's all.
>
> > >
> >
> > I can't really base on something newer than drm-next
>
> But you need the OPP dependency, isn't it ?

With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
tree and merge it via msm-next -> drm-next -> linus

Otherwise I can send a second later pull req that adds the final patch
after has rebased to 5.9-rc1 (by which point the opp next tree will
have presumably been merged

BR,
-R

>
> --
> viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
