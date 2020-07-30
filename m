Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB92335D8
	for <lists+freedreno@lfdr.de>; Thu, 30 Jul 2020 17:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082076E91A;
	Thu, 30 Jul 2020 15:45:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDB36E915
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jul 2020 15:45:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l23so6587180edv.11
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jul 2020 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1J01Oczhd220RAym1LfngVA7OUijoix/GTLOnOq0wQ=;
 b=mYI2K30rokgxWE0w7UBhOkOYryaDcfDKVw60BHk8x3vYQ//HRCVaVYL2FU1hFijMfT
 8rwLHSUgRg6/W4AvbrMRanJPGCBILdYCXc9SWKUFPRFJy2DEbfn3agkQJvTbPEzwd5hq
 Z7xb4bbxbDLahiPDYZ4URSuz3MQj++4zVmHqM/tXhleHuX4XwfDzWsqa7a3ASLmbqdNw
 PQtvqxQ6Qv1RyiW63qtuPBNmZF21uFplD/0Yigy4RjgHLEr3/XZIdkL6GA62Vw7iCzbH
 ocQCE4wQEl0soppOd8kGhR6nr5YcIrnu8VKQ6oc7usO2cTRWz0ICuZi+gHH8fMD59RgR
 HGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1J01Oczhd220RAym1LfngVA7OUijoix/GTLOnOq0wQ=;
 b=bPU8LQVJk2Z8/95uswufH4k0Z5SodPm5pMk4mjQl5LEFE0D976oS/fiOmSMDplJRvp
 dgW4V13OFx3Vwwycx+tCllmkGq7Kd6EDGsBMeqmeSIIC46Xk4A7sdR3Y1Mfdj2CgwJ7N
 d7Ot3yJnaj40gWgXHczbBaJXwh2o1Arag9d1VM35J8X4o94bq7qnIVD3Jkm/vh/STLuw
 U/M7v1p+BApaRKuHflNxAi4Jer7SA3sATF5/9xlRiC5eMwJMpW7JiMp3yHkAbbDv1pY6
 iK9h6Hac/x7NocZVE4zfb1ubMQibgx9IdZ42eubJARM1SkGApaPRZ6c2HOEsqZAlnfhu
 pPMw==
X-Gm-Message-State: AOAM530QsDBkHFPp+O0nR2Eyyc7pyLQ8UZrPpkORFCxxW/VGETrZEpXO
 IVs7itzo65QcE4hoYq71peBT+w3jF9puzkmJXrU=
X-Google-Smtp-Source: ABdhPJxJBzb6IrbCKjuOC0BujTWS0dRylwUyeXRe0DDUCUbkZVlP/EuIVuplkgjxRZfoLFnUlWJiDAFypFhpWjX6r1E=
X-Received: by 2002:a05:6402:1c10:: with SMTP id
 ck16mr3213692edb.151.1596123935735; 
 Thu, 30 Jul 2020 08:45:35 -0700 (PDT)
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
Date: Thu, 30 Jul 2020 08:46:16 -0700
Message-ID: <CAF6AEGs9=-0YBJpONaXf1wavU5ZpxhAQ19vfOn4JHby1zgPwpg@mail.gmail.com>
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

it looks weird in the history, but other than that I think it is
fine.. at least I see it happen somewhat regularly with fixes in drm

> Though it is fine for a patch to go via two different trees if we make
> sure the same sha key is used for both.
>
> Will it be possible for you to provide a branch/tag of your branch
> that I can base stuff of ?

You could use https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next/
(or the tag drm-msm-next-2020-07-29), which already has the OPP patch.
I've been trying to avoid force-pushing that because downstream trees
are already pulling from that.

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
