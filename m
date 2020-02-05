Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8D15390B
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2020 20:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D800E8994D;
	Wed,  5 Feb 2020 19:24:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92E3898C4
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2020 19:24:53 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id g23so2118778vsr.7
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
 b=IrCdKZxlk9MGjOVLL8nvg7LIAvfP0+eaAMZGI14LPfO2Xsvm/Oni8/zwNx3GyuHFVk
 xSLsRYvA/h9GJOGwHl3TB+be2gSu88KN9DX+j1QFvvlPQfCSgm7+m++IUH5+Awt0SV1x
 kg/476pbpukR7JOK7GsTJOiWYUwIcxVk69Ivs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
 b=kDf/4rb6Of+J4PVjZWa+IBZE5ZVRSJTSTVNkGi8Te7rW2fW4nrSMIeTU8IyYdD3fJu
 UauRA7kFSoK+MSsAyiQ9iSk3q9cM1bB6iymkyTAvGDLBhQh6HJMNjv17D6/Rqu6ac3Ze
 8KpiGLt1XvGqvX5p0Ev86XNgPhyVPGrFO+zDRTzO5GzmFfP9ZRHvitIlsnN28ihrNAcv
 Xw0LS/A/ueuEsWY6EjuvoKPtvYva7rDZ7fPOgLCEfgaIeSq2U9rSvzCYCFxmXgRiXA8O
 MkUMZjs0w2BuQ08NLTxx47FpO/38nFA2n0oUaNz+T3YUISYp53Yq24xRdAQDx2b16j8F
 Qr8Q==
X-Gm-Message-State: APjAAAXfqrWjIdkbQnHiAMdR0uzQvjOYCDBENspkTfISH4YbVwKo2WgB
 WcY10Bg4ORXMLJNWdq31vBrNkVyDAHc=
X-Google-Smtp-Source: APXvYqzRem7x1N9WB27qSO39zZRmcyUV+UaliwRjqLo4VQPUQBm9i9e4pwlBbe6v4/meH0C4QtNgJw==
X-Received: by 2002:a67:800f:: with SMTP id b15mr23018705vsd.123.1580930692773; 
 Wed, 05 Feb 2020 11:24:52 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175])
 by smtp.gmail.com with ESMTPSA id o16sm271423vsa.3.2020.02.05.11.24.52
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:24:52 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id y184so885322vkc.11
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:24:52 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr2748451vkf.34.1580930691696; 
 Wed, 05 Feb 2020 11:24:51 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 11:24:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add A618
 gpu dt blob
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

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> +                       power-domains = <&gpucc CX_GDSC>, <&gpucc GX_GDSC>;

I should note that this is going to be a PITA to land because the
patch adding "GX_GDSC" should technically land in the "clk" tree.
Without extra work that's going to mean waiting for a full Linux
release before Bjorn and Andy can land.  It might be worth sticking
the hardcoded "1" in for now instead of "GX_GDSC".  That's what we
often do in cases like this.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
