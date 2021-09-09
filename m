Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43862405E88
	for <lists+freedreno@lfdr.de>; Thu,  9 Sep 2021 23:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03CB6E92C;
	Thu,  9 Sep 2021 21:03:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9368E6E92C
 for <freedreno@lists.freedesktop.org>; Thu,  9 Sep 2021 21:03:20 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so4278072otq.7
 for <freedreno@lists.freedesktop.org>; Thu, 09 Sep 2021 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Inuz8zjQpJ8vk0GRKUjv4itxCxxuAm5ggH2rL74CYCo=;
 b=d9PkoVnYvdQBvNX4WHkbuiSrkkvxhgvnV2vCdhmeeozkYSR6EGbZZ6ZUfJOxv/gfcS
 y34dbvibMZcLJIylua/yfIqUF6zWfkxgUayXj+mXiVUyjAu/D55CAsJv/J0DNU4bQpJ5
 tvOr8XKYcak6AFVcY31g0W5ngrW3+11dSwTkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Inuz8zjQpJ8vk0GRKUjv4itxCxxuAm5ggH2rL74CYCo=;
 b=EvV09IQgli1mQrf2b5Dv/gAKkyV4oW87pI5P+pLCe0Ao8QchwQ6D+RGRP4KxjeGDX4
 2eTVBEyoY7cq+RZtpN1vjXDXAa37iDPYJbcy86KQUGh1Tw1ziWHbW4CKpkqv+XJE1Lx7
 UL9Up2jOTcYZw7iB7U3ricLnRmqg89euzP7MErdM7CGE2UIQoMmc7eTRllhmL1JyQ53o
 vYsQK+lGBw7w1wRNM6ezLzVxg8FPhIb3AEjnibKpiF5v8JP9IVa4T9IDUuT/a2tIxxzW
 S61Ff3Xf6GGfM3Yj1kpkKgUyHNUnGd6ngLPuVSfFVDejvWA70TTWicMb9IsUpy3Xiki9
 91PQ==
X-Gm-Message-State: AOAM531ETNyL+GEMQn2dGwJQX4NQjSF4R4J7LY1teazROg7r/UtFwACn
 E7DkyCFJMfB6Mjl7o33kE0Jvz7MnCNGq3Kmif5PsIA==
X-Google-Smtp-Source: ABdhPJxzzYHJmjZxncLWDDGzJ6ALyyZzP3+wJ9In+ibvaJy4YpGmbTqacIrA8T+1HS5SfE/5dxVBYmb1wu2mA1UftOc=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr1700256ote.126.1631221399723; 
 Thu, 09 Sep 2021 14:03:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Sep 2021 17:03:19 -0400
MIME-Version: 1.0
In-Reply-To: <1631216998-10049-1-git-send-email-khsieh@codeaurora.org>
References: <1631216998-10049-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 9 Sep 2021 17:03:18 -0400
Message-ID: <CAE-0n505ihV0eYsk2oyeeL8=DSCW-Uq=hVt_8BhVxusRq7R9NA@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, mkrishn@codeaurora.org, 
 kalyan_t@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7280: fix display
 port phy reg property
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-09-09 12:49:58)
> Existing display port phy reg property is derived from usb phy which
> map display port phy pcs to wrong address which cause aux init
> with wrong address and prevent both dpcd read and write from working.
> Fix this problem by assigning correct pcs address to display port
> phy reg property.
>
> Changes in V2:
> -- rewording the commit text

This Changes part can be put under the triple dash. This isn't drm tree
material.

>
> Fixes: 9886e8fd8438 ("arm64: dts: qcom: sc7280: Add USB related nodes")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
