Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53A783423
	for <lists+freedreno@lfdr.de>; Mon, 21 Aug 2023 22:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3620210E2B3;
	Mon, 21 Aug 2023 20:58:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F9710E2B2;
 Mon, 21 Aug 2023 20:58:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FB1762DA2;
 Mon, 21 Aug 2023 20:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB17C433C7;
 Mon, 21 Aug 2023 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692651513;
 bh=E5e9oQ4r7IOuMNrE+VP4h3263NYNYefbxPjf4m73jXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zs9GOt5s+WO796XKC96PZ0b6uaUyn4EzPPwXV7rsT3tdjcyuZs5KTznPdBPkg2Gwt
 D6gQ0VWWVli+hjBfSSOOsuBa0BFu54Kf6XtqAST9k4qtU+WwizDzRg3WcN7QaWWlko
 +d7r2e5+wkqwiiMo52zzVTtog9Rs7pCzIl8QwxbauTjBWKfqTH3p1thAccsssaE+Fd
 zPTYhbPwYwr6w+qO7GUn41OVcpw5tjtCG8GxvKgjZOMQzejREz8JRGvNg9CXmCbU3a
 KDDMc2TNY44isDvaeEoXmCnkiv9BR5K56lgoeboVw7t/s1GEZbGZeLNIs8dcDGb8+w
 1B0/aIct7t8IQ==
Received: (nullmailer pid 2281356 invoked by uid 1000);
 Mon, 21 Aug 2023 20:58:31 -0000
Date: Mon, 21 Aug 2023 15:58:31 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <169265150949.2281277.7308307921965060658.robh@kernel.org>
References: <20230820080543.25204-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820080543.25204-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm/dp: restrict
 opp-table to objects
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 20 Aug 2023 10:05:43 +0200, Krzysztof Kozlowski wrote:
> Simple 'opp-table:true' accepts a boolean property as opp-table, so
> restrict it to object to properly enforce real OPP table nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied, thanks!

