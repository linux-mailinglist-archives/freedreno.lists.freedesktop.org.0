Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FE3577DE
	for <lists+freedreno@lfdr.de>; Thu,  8 Apr 2021 00:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F68A6E9A5;
	Wed,  7 Apr 2021 22:41:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5749F6E171;
 Wed,  7 Apr 2021 22:41:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C85161057;
 Wed,  7 Apr 2021 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617835311;
 bh=5lZb+aAr8K92mCDz3Mco+1StlTnl7CvhSeYNRB7lNMs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qZRjQYeFkeG8p1L76Bglc3C5myAukg63MKI16XUnquzVpmkj2V0RL5/B5quyl3HoK
 9Ov9m6Cr9csPp3gPPK5b4dOptydF0RdbRa3bKcOp2XuhptubeVB/8k+eYhobuh++z8
 pUxcN90CuvN7NYYLIvNBNcsNHD6LFjCXttZjHQHHrUpyX33ncY8YfAqIld2UXmnIaR
 bOJICEvUNvxZNNW2W9pvrbmYB1S4zUQ2T/Wrf6lO3OeL8QsOauR7mkkFtum6aBZacP
 QADhHnj8AAaTTNlrIhlM6FLXd8BJHqrHtOHJU6GgRJDFH6JbfcyEVwHR8kUr3d4llA
 q9yEuCx0P9C6g==
MIME-Version: 1.0
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 07 Apr 2021 15:41:49 -0700
Message-ID: <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] clk: fixed: fix double free in resource
 managed fixed-factor clock
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Daniel Palmer <daniel@0x0f.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
> 
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> getting it into 5.12, otherwise there will be a cross-dependency between
> msm-next and clk-next.

Think I can get this into the last fixes PR. One question though, I
think this follows the pattern that things like clk-divider.c use for
devm. Are those also broken?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
