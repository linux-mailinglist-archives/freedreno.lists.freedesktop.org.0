Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242F38C7AA
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 15:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F6B6F648;
	Fri, 21 May 2021 13:18:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D8D6F64C;
 Fri, 21 May 2021 13:18:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 230B5613EC;
 Fri, 21 May 2021 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621603138;
 bh=kML0VNwTPmuZzhjwUe6WlLUM6s2hR7O8GQYI8nIVEx4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bxlk4rI+nT2n2MilrkZEOxmGPpUtz5EM4hIvKviME1p5OqepyQ5kkp+CvAwVT5cAj
 Ku9puQxIF9brbZ5vJTXmOPmc3eAwU0Um6HuXrJQIMfWiSc0ENOiFOrE3eTi/hekg+7
 byFXoB0KFQyw6TBddhpvCkFbpkZKU5CDjw4wQqVDDNMZI0IgQa1p7I/zwm4I1+QOYm
 fq6i3qeZ4iMVGg+ZO1rpctE0+23FuTODinw/xTnV6LYtInrTs+HAGt5/zcrKdOQR/D
 CqrWl9I1AKZ8JmjwzmXemkdMkVGfzT6ZWZUK1eqlmPNS7llAIuoX3WxG3KGaEhANj6
 9UtXFKw7LR4Uw==
Received: by mail-ed1-f52.google.com with SMTP id g7so11127205edm.4;
 Fri, 21 May 2021 06:18:58 -0700 (PDT)
X-Gm-Message-State: AOAM531r7huZ2EhPPQ8jRV5eOSO86N/7pe5nkDqbMBSQpTuo0n6+9tGt
 Ok0t5jltZGu9Tmy5fSwhjNvzKk8AQ8YFF1HZ2g==
X-Google-Smtp-Source: ABdhPJwmzwbCzIeEFfbyH8umGA8C0KXX6vUz4OS2ROZ9YiW5j/tCvUb0NLoSYwTa9fxOPM6+xMux6sI6PbKiUDMEH5I=
X-Received: by 2002:a50:c446:: with SMTP id w6mr11114280edf.62.1621603136815; 
 Fri, 21 May 2021 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
In-Reply-To: <20210521124946.3617862-3-vkoul@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 21 May 2021 08:18:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
Message-ID: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [Freedreno] [RFC PATCH 02/13] dt-bindings: msm/dsi: Document
 Display Stream Compression (DSC) parameters
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 7:50 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> DSC enables streams to be compressed before we send to panel. This
> requires DSC enabled encoder and a panel to be present. So we add this
> information in board DTS and find if DSC can be enabled and the
> parameters required to configure DSC are added to binding document along
> with example
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

This is getting converted to schema. Hopefully, v17 will be it. Sigh.

Rob
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
