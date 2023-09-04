Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E9791AD1
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 17:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117D810E38E;
	Mon,  4 Sep 2023 15:45:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 15:45:02 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9B10E38B;
 Mon,  4 Sep 2023 15:45:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DC6A0CE0ED3;
 Mon,  4 Sep 2023 15:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C24C433C7;
 Mon,  4 Sep 2023 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693841985;
 bh=biK94lBbgt1pnt3KPbgjV2mjHY/WPTUANiaYAFj3hnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tk0DR0TJA8XaoYlsyz7s3yTLGRb8OPMGbQQ9R4Ab0qT1Mw1mF0bRVm/VULSyVHsnb
 +ipBAL0t2lfIzxyS6rZCHYVv5vyV1ShhPRqsaaz069pu/jqcxp1Ku6KjUeryHIYEdH
 hWH+KUp2xRkNf26zT/Ldkt0kkw0TgMYKeZ3q9OIe4GzQTEvr0A1XVWAnMC549adr9o
 C4VtbhrNg8doUP6AgEcmMh34fGSI/JjWQf2GEqaH0UygW0lt25QhyWrEbhMQw/znjA
 a8KDp6P6XqLiZcDqzC3Q6pSuLLi8bowdOSwE0pnKzGlAcjy7hrTG7FmHE5yMZiSgQf
 WaSBEqZnGYKuw==
Date: Mon, 4 Sep 2023 08:42:00 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <u5jciyc42wbclgcznuyxrub6lfhkqixpcsgx656afmqmx5m7er@xktdvhzwbuzu>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903214150.2877023-7-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [RFC PATCH v1 06/12] soc: qcom: pmic_glink_altmode:
 fix DRM connector type
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 12:41:44AM +0300, Dmitry Baryshkov wrote:
> During discussions regarding USB-C vs native DisplayPort it was pointed
> out that other implementations (i915, AMD) are using
> DRM_MODE_CONNECTOR_DisplayPort for both native and USB-C-wrapped DP
> output. Follow this example and make the pmic_glink_altmode driver also
> report DipslayPort connector rather than the USB one.

I started off with this, but on devices with both USB Type-C and
(native) DisplayPort, it seemed much more reasonable to make the
distinction; and thereby get the outputs named "USB-n".

Similarly, it looks quite reasonable that the output on my laptop are
eDP-1, USB-1 and USB-2.


But, if this is not the way its intended to be used, feel free to pick
this together with the other patches.

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
