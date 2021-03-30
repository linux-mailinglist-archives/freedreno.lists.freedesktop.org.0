Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7634DD3C
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 02:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7376E5C5;
	Tue, 30 Mar 2021 00:50:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0D56E5C3;
 Tue, 30 Mar 2021 00:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79A1761987;
 Tue, 30 Mar 2021 00:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617065413;
 bh=WlcDHTsL/++ADm3igDYuxYt/sN+5arS6fz0ryE5i49Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=EZn6gqtezMJcHI7kKyh3BCXxdb0X5ZGJhHxOw4zoxZ7Chz/X7kd0XZtohJ1MSwuzc
 cE6REp1Z8me0BNIqjRxypgLfdHTx+rSeggC4RkkKDLaMn9OhOQe9OxGSlphO4NM/xs
 yDr0k6+PuLfY97sO6JLVRbs5OAx48Z/VFtXbn/ivfq4n+guSbZuC+CDHtFJ9FKLbkQ
 zV1JbvVPEC5+tl2MN8s1g8mZRj2l9USfYRstoF5BuzFbjUv2tG43ADo9MX2PcViHxL
 Tl6oTwm4mw9p9ZiLUNDNqdVISXzUPUzQtr7iQY1ZeKLREQMYCe6oYlvG0H8r1xnU03
 EgfwwtUm/DeGA==
MIME-Version: 1.0
In-Reply-To: <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 17:50:12 -0700
Message-ID: <161706541233.3012082.17908704840023674123@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v3 13/25] drm/msm/dsi: use
 devm_of_clk_add_hw_provider
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Would make it devm_of_clk_add_hw_provider() in the subject

Quoting Dmitry Baryshkov (2021-03-27 04:02:53)
> Use devm_of_clk_add_hw_provider() to register provided clocks. This
> allows dropping the remove function alltogether.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
