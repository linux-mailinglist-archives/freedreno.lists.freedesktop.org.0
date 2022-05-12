Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF5524202
	for <lists+freedreno@lfdr.de>; Thu, 12 May 2022 03:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88410E063;
	Thu, 12 May 2022 01:29:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690B410E063
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 01:29:08 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so4983555fac.4
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 18:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=nlBxn7EbHMfvqAK9TKNXoiDCi+sQenNLw/cNQhu/9WI=;
 b=FUFfr//9h2g+RgJBdz93Ja3DvE2LJXZMaa0DNrKz7YJxt1hlI1Cp7xQbEWj2eVGT05
 ZGGU/I/JB4uIxHdwRCSsTeesVOIXsUyqIrt/0B27NhyFr/3j47tc7XapVd4Mzysku7ut
 qcrlB6GeNNf7yUa0w/zN74VWgAXgNisPS7p/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=nlBxn7EbHMfvqAK9TKNXoiDCi+sQenNLw/cNQhu/9WI=;
 b=W+4c+c9JqwRbWX11VHJZyKImDNMGgR0Rs+kixhyPXiivLOfQV6l3VFpA0rCAP1nGAY
 06akfGTl9bP+32mX+uTcDqpXj3GAtZENaESTSwV/ziB3vEM3P1xyhGqJ6Vz0Y3QYwQeG
 39UipKpsIQq3g3EmE/JhykifuJFp4MOFMyJ9fu9TIPpLAsxkXEUTg4E4wenwQDrOCWsI
 2zI0sKji2G6TraLTJqTD+JiaeM71F6fL1k63JSy/42xEkXyhSs1tpEVlkWQNlpkUxe13
 j696J6/v8tWsxy5ZpMa/Zn+4dO64Yj3oLpTm+vGpzrCgi7+53VnA5daOWd1RISVWUfRx
 pV2Q==
X-Gm-Message-State: AOAM530zJuQzcLnNfDUNlMWneDleDfgUE0GuQOgM4sZOhpa5DR1WIn9i
 EH0ULF150HMiJBSAfZRIzS0gAoF0tEgwlG0QAx39FQ==
X-Google-Smtp-Source: ABdhPJw4OYNNFu6Zneq7n+svBtNk46Bb9D/X/paXlDhz48aT/quR7ndNb7X6ENvkZKqIC7RZf0qq4//EhBQYQwBeY9s=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr4225578oal.193.1652318947719; Wed, 11
 May 2022 18:29:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 18:29:07 -0700
MIME-Version: 1.0
In-Reply-To: <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
 <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 18:29:07 -0700
Message-ID: <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: don't free the IRQ if it was
 not requested
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
> >
> > Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
> > clearing hw interrupts if hw_intr is null during drm uninit")? I mean
> > that with this patch applied kms->irq_requested makes the check in
> > dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
>
> Yes.
>

I didn't see it deleted in the second patch so is a revert going to be
sent?
