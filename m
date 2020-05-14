Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446071D41BB
	for <lists+freedreno@lfdr.de>; Fri, 15 May 2020 01:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CCC6E0C4;
	Thu, 14 May 2020 23:38:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7E06E0C4
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 23:38:01 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w65so72186pfc.12
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 16:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QK2T0t/Jj0JFQe8jONLMLZrHIHWtDY8wi6hh+6HVsZc=;
 b=mYnOUX8GzYHSabSOa5Twez7NHxPD2GmAYqgM4bH8a0VNgWLtlOkVTW5tuAvMEvimR7
 Etu0z5LT+oPBLhSpHfTCojRjVsrV0q4wrwVu37uzHLuWl78dm4a7u8QwE6iJ/SwN/uBR
 hs/g4khJraR7/bYg5/+yRId7SUocqo1MZCIUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QK2T0t/Jj0JFQe8jONLMLZrHIHWtDY8wi6hh+6HVsZc=;
 b=OTIWvmiEwi/9UzSt4eKhAUHudnKN0wiHBocA8734fsKK6IJWvcJlOeTbMojBEwd2ex
 QE2Ce9amwICvWLUYuJ4WAq6s1vOp7n6UBeGqPiUXi+usxqie0JTF3KkmIC3r67zX4OrA
 6hqKxOl5YXfFja/3GFvb6LyVrl0Zc4djhOtml8oWA6JM3C7qT1X0eZRRon+eMjn+M+OQ
 Ht6IgaCbh0TiNYR+lZ4KpRszYleg/JW4aVkHQMKDDmPuPlK2tkMNWfVEuKKd/QDM5bGc
 noZM1828EdWfhvtS/sW7cHccT+izeP1XFNxgzuFAWXbMneFtCfIbRfa0ws2feDh0mhHi
 HE7w==
X-Gm-Message-State: AOAM531cC+sSz/Dw8yim+otUmFxZ/7id88ueYlGgc1UGsm54klyZNKMN
 UGi7TxSleVreWpZOZz1AXHtDLeLLZFE=
X-Google-Smtp-Source: ABdhPJzr+P5MYAMvALz8QCCQYXEbupCUs1nuQKmzDf3JHLzo0/rZUuIfcPI9IrPK0NfSNUeQxUHy5g==
X-Received: by 2002:a63:4c5b:: with SMTP id m27mr502104pgl.198.1589499481632; 
 Thu, 14 May 2020 16:38:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 14sm276163pfy.38.2020.05.14.16.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 16:38:00 -0700 (PDT)
Date: Thu, 14 May 2020 16:37:59 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200514233759.GR4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-2-git-send-email-smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 1/6] arm64: dts: qcom: sc7180: Add
 interconnect bindings for GPU
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Sharat,

On Thu, May 14, 2020 at 04:24:14PM +0530, Sharat Masetty wrote:

> Subject: arm64: dts: qcom: sc7180: Add interconnect bindings for GPU
>
> This patch adds the interconnect bindings to the GPU node. This enables
> the GPU->DDR path bandwidth voting.

This patch doesn't add any bindings, it adds the interconnects/interconnect
configuration for the GPU

The order of the patches in this series is a bit odd. Typically you would
start with the binding changes ("dt-bindings: drm/msm/gpu: Document gpu
opp table" in this case), then the code needed to support these changes,
and finally the DT bits for the specific devices/platforms making use
of the new 'feature'.

It doesn't really matter once the series has landed since the end result
is exactly the same, however it's the logical order in which most
reviewers read your patches, and typically also the order in which the
patches land (especially when multiple trees are involved).
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
