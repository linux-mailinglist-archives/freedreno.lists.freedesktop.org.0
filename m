Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4D01584A6
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2020 22:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67F6E23D;
	Mon, 10 Feb 2020 21:21:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2526F6E23D
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2020 21:21:44 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id w15so3112839uap.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2020 13:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fk9bdz/2mbXx6dTdvB7EEtvMRvBXPbEaBb56NU9MXvk=;
 b=oFCfjcLi6FTB8phhz5e5PNBQQK1bvPyU+YLtRi18QmAAzEqnY924oe7J71K/fOfGTo
 f3gOueqJgdm+vMwJlqJZAnePuZYODm8ZnNni3gHBsL0HBvBbjC8WPRyY4Q5Y++YUloN/
 CR4c3SmRF9iN7SCYbKhjCYcimn+OrtHdACBgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fk9bdz/2mbXx6dTdvB7EEtvMRvBXPbEaBb56NU9MXvk=;
 b=skV1rdyojqJ6mBYwx7oL1DOuuXqWN9/2ucVlEDzTvYgUTCXuHCjwTg3YVnskpocX8B
 r6vHRC1MrESi5BFAohcN2oY5jRVqe6SBN74yLK+OS3uLYH4xWZCkoVnLE28WxwuL8KP7
 wG2wkukg188k3E3tG/+Z1Z4PxY/aG1Mw47AUCIboEUJuYXB0/7/JizdPRQ4g9iTlSoi6
 3RyIWNgBZhy5sG/H2P/EaWPpU12EzrGckDmw1gPTX62nQQ+26HM+S6yra6QBY7LyExo+
 XzC378D7Zim8Cn6L5XE4lLXLAwnK0gbFCDgQE/CdyQVUgaO58y+HcA3nkqEOwh3KyWC/
 3duw==
X-Gm-Message-State: APjAAAXHJfba6rup3S53YxzHPyzrzZ4SsNyIUmkTsu57mzRlHHwS3KaN
 S8mX8aqdWg+8mmVMQFXIHiZ9SrYubp0=
X-Google-Smtp-Source: APXvYqyp9IqmnrmLcjwdF2iyafaGXA2RkNZRiPNafVswqbE2Qa5SH6f3EtTjFrnmhbmQP/KTjBC0uw==
X-Received: by 2002:ab0:74ce:: with SMTP id f14mr2049079uaq.118.1581369702639; 
 Mon, 10 Feb 2020 13:21:42 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id v68sm503431vkf.20.2020.02.10.13.21.41
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 13:21:41 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id m195so2272791vkh.10
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2020 13:21:41 -0800 (PST)
X-Received: by 2002:a1f:ee45:: with SMTP id m66mr2278489vkh.75.1581369701330; 
 Mon, 10 Feb 2020 13:21:41 -0800 (PST)
MIME-Version: 1.0
References: <1581320465-15854-1-git-send-email-smasetty@codeaurora.org>
 <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2020 13:21:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
Message-ID: <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v6] arm64: dts: qcom: sc7180: Add A618 gpu
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sun, Feb 9, 2020 at 11:41 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

In v4 I added my tags [1].  Please keep them for future patches unless
something major changes.  AKA:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>


> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)

Just to summarize where we are:

* As per my notes in v3 and v4 [1], this can't land until
"mem_iface_clk" is in the bindings.  Please post a patch for this and
reply with a link here so others can follow the disucssion.

* This also can't land until the gpucc bindings change from Taniya
recently [2] lands.

...so we're in limbo waiting for the bindings to be resolved, but
otherwise this patch looks good.


[1] https://lore.kernel.org/r/CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com
[2] https://lore.kernel.org/r/1581307266-26989-1-git-send-email-tdas@codeaurora.org


-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
