Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71794B98C5
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 07:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9C510E70E;
	Thu, 17 Feb 2022 06:08:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E910E6FF;
 Thu, 17 Feb 2022 06:08:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F7C961257;
 Thu, 17 Feb 2022 06:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B79C340EB;
 Thu, 17 Feb 2022 06:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645078123;
 bh=ztO5z3iN5cSQeK67iLz7hEoXVaNMQ6S4MlmQnptMOE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qc/7GbYzvU09UZz+yxyXWiOptXJNDq7P54syRgq4lWSiMsPTpBknuklYTbnVbhq6U
 ERaMrs4RGGjz5FXF7IG8YTLCFVwYeqHeqOkjpFjXxx3FTBczkFg60a4PgbFdsajBUh
 ZNFcOOi0mGH0u+siIItZcnv/LUJ/rsb4JsA89DQ5HnLjuUTNF07SVUlwwkQrYFF84x
 Z9gzEWGUi2EXE3aAG2YJMmez+3frj2dJElqFXGvOTbzX7PRZVVFZQKWTMJLfoCb6ix
 iu3KN5iay3/C6VQ9Dx1VYsTyWGNgRL16/SHJr7VLvK/1b8zV4BS1WYMk8TYAxMeGV0
 w5npvCwMkd21A==
Date: Thu, 17 Feb 2022 11:38:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <Yg3mZumErAgUzkhy@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-8-vkoul@kernel.org>
 <fd837ed4-1ff5-a87e-26ef-a84d899606ac@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd837ed4-1ff5-a87e-26ef-a84d899606ac@quicinc.com>
Subject: Re: [Freedreno] [REPOST PATCH v4 07/13] drm/msm/disp/dpu1: Add
 support for DSC in encoder
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16-02-22, 11:54, Abhinav Kumar wrote:

> > +/**
> > + * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
> > + *   This helper function is used by physical encoder to get DSC blocks mask
> > + *   used for this encoder.
> 
> This looks slightly misaligned to me or not sure if its my mail client.
> Please check it once.

This looks fine in code as well as in mutt for me.. Maybe client issue

-- 
~Vinod
