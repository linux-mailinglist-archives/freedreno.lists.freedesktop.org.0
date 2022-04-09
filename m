Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280864FA989
	for <lists+freedreno@lfdr.de>; Sat,  9 Apr 2022 18:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F1810E1A7;
	Sat,  9 Apr 2022 16:35:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751B610E190;
 Sat,  9 Apr 2022 16:35:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E1BEACE09AC;
 Sat,  9 Apr 2022 16:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB270C385A4;
 Sat,  9 Apr 2022 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649522130;
 bh=UNmAi171eTNd0PPrvmtUJH8M0u3zpsWVYMVybZm/oiM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GeWfrBjtLgc0BHtuan+OrjSI9uh9efXebpb9lBCSkapoYb6b72TajpTN4ICirxZrO
 x3Z61CbxatI73IBSF1MXm+Y0zAYPeejrktuwbyviy2g2gfpvQLflJY0oOFzIn04jpF
 Gn8qyFhtzXxo43Ee5ZaX5PxtFSEFzk183B0ZDVyzKVJGBcv8EiVY/PIOkHYFdYDCkE
 itGDxpNWZdrNlbZtgqdtc0fAR/i8xU21epthi+DaUN6eDS3KVPqFuPebFvHR2nJ+Cy
 MFtRW3O0UVkEJeJBhrCF7VT5NGCwhVqoHkghYk+BcYGALz9aVsYTRWDMFxKxe6xOV9
 T//qKwCSVIeHg==
Message-ID: <6c246d08-136d-13df-7228-354b049a66ea@kernel.org>
Date: Sat, 9 Apr 2022 18:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220408210813.581391-1-bjorn.andersson@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220408210813.581391-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/2] dt-bindings: display: msm: Add
 optional resets
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/04/2022 23:08, Bjorn Andersson wrote:
> Add an optional reference to the MDSS_CORE reset, which when specified
> can be used by the implementation to reset the hardware blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Resending these two patches again as I put "v2" in the subject, even though I
> meant v3. Sorry about that.
> 

I reviewed v2, so one here as well:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
