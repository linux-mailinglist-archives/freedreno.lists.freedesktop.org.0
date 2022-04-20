Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3E750810C
	for <lists+freedreno@lfdr.de>; Wed, 20 Apr 2022 08:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37710F086;
	Wed, 20 Apr 2022 06:23:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3110F086;
 Wed, 20 Apr 2022 06:23:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F413BB81D35;
 Wed, 20 Apr 2022 06:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C7EC385A1;
 Wed, 20 Apr 2022 06:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650435826;
 bh=+OMMeE98fYLMWkYc9X5yU7S4E4XIWSYmxfbAd4UxU4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjRsB66A3W4Lr7hK3n+BS3RieKC0ou8JxJvv3bS1Qzmoa9kmdKda8xNVRncb4BE9T
 GGmIE5alkr+0L/ltDdh9N4CibVLYLgT7YYe9oxHSCARgsQ699fMq1h624mWpeNkTBA
 k8OOgNzNbCzHWffxGskqVQgKqWiRi9kNmk4AZNoxRsjwI+yrCeE4C6L2M1bJpwACw/
 KKX03A7CoRjz+Tx6KTBWu3lKZWL2+nEt+OyTk3YciIhUk6/nPVSlAnmCJjJlPdUMQz
 Ua1XkvlThFuQoa6tSgnUguhBzMmKAFaXJfyx9+HY1Qto13G9zGV6fxM764mHoiZH8C
 74dwiwPJpiq9w==
Date: Wed, 20 Apr 2022 11:53:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <Yl+m7vWtJIqHvCT0@matsya>
References: <20220419213706.1452361-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419213706.1452361-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: fixup DSC support for the
 cases when there is no pannel attached
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20-04-22, 00:37, Dmitry Baryshkov wrote:
> Unable to handle kernel paging request at virtual address fffffffffffffe2b

...

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Note: I'm going to squash this fix into the respective patch from the
> DSC series

Thanks this looks good to me:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
