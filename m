Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0672262B8
	for <lists+freedreno@lfdr.de>; Mon, 20 Jul 2020 17:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B2789C98;
	Mon, 20 Jul 2020 15:03:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ACD89C98
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jul 2020 15:03:30 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id e64so17901012iof.12
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jul 2020 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pcfxvqUoA5Q84iZVIjEC8f/UAFuiPguvgTdlO6gr+z8=;
 b=LhPnnGZz+comE1cgyo/Ade5S1kE4zEhoPaaFmdVrbq0kxfF79/KbgosYjWd3jhGj6z
 PZ864OAiQJyZ8WPWu6phfbFiY0PR+batdntkmBkfGuUeF74RfofIncSfeHpmTOePF1pk
 Ui72NQbpRw423r3rcUPqaiB/ILqEoJezxU+i2HJrkDVxCMHcaCT2tK0OwO7SS2KWX0dI
 0NaiTW6dGdv3Ns2/bPxEVvBTpatUK2feYLsXNNkX3CxHcyhzEaXKMpxvhWxbF2avLfGW
 rKAvuWuQy6krRYFHtP+y+ytu/TgFRuu8J0nceHE6k6yko8K9n5dtO1b6ghj3Q0EYWq68
 rR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pcfxvqUoA5Q84iZVIjEC8f/UAFuiPguvgTdlO6gr+z8=;
 b=mzH8qRBwI8NdeRnstCFK8do+2ozhC4/nSBN4YjdRfW83dZ6U2SIqfY77kOgyhTMITZ
 UjR96In3xi7xTCohcWw2vn7jPHxHP5LfUvjB9tpL9f6+j+LoS3oIAiYLpQScAb3wqf4S
 9MLIZrzgaEKpRuVg8TsZ0wcN+PomaOrCGBFe750w480MmHLeaFwj/a83D6PDTgosaw2q
 +KrdTVUIppNOzha/hZ6/X4dSwFuOZtz81WAoDPt6YQ4iNYGyZxsUA9/1aMecRpE+tQjB
 yCbjEzYcFdvBWcERFgV0ckkmiAHTE8q5jkPFjE9QCD5Ivakf/TWWatK15fPS/lGyuZnv
 93/w==
X-Gm-Message-State: AOAM533u6TEpW88jOajUYuIg0kf+iVv19gX0vnM4PWCTbzl9B/yLY2uM
 D5IdC6iV4JgsoNeczlWqeo45QD+aRBIqJ1cvmZs=
X-Google-Smtp-Source: ABdhPJzIbmtiIdLPMhyi/GvPa8hA5p1L8XEl7Yhw3/V97KBA7XMRywAMZ5AtZBSscwPbiDM0aPGhETkFHsZErsQ6ju8=
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr23344299ioj.148.1595257409980; 
 Mon, 20 Jul 2020 08:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
In-Reply-To: <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Jul 2020 08:03:32 -0700
Message-ID: <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
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
 dri-devel@freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 15-07-20, 08:36, Rob Clark wrote:
> > I can take the first two into msm-next, the 3rd will need to wait
> > until dev_pm_opp_set_bw() lands
>
> You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> it anymore.
>

I can't really base on something newer than drm-next

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
