Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D37CB309
	for <lists+freedreno@lfdr.de>; Mon, 16 Oct 2023 20:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B72810E030;
	Mon, 16 Oct 2023 18:55:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3711A10E030
 for <freedreno@lists.freedesktop.org>; Mon, 16 Oct 2023 18:55:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 59319B816AC;
 Mon, 16 Oct 2023 18:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3429FC433C8;
 Mon, 16 Oct 2023 18:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697482520;
 bh=ybBFFxckp/7Pt2ygo1vu/EHKckpT5bl4YF7dxTBhogI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mmfkBY9fQwl657JEe/ndzsyRouP0LKBOlPQxhEyYX4Ux6NilSDHOtzYJQUbsCtLYq
 t2CBmattSGS84PRxWaz5k8gmWyQAwVOGRngk28A26yeQ8U07EYdTUZuFxHjrUE5efO
 Auz5KNnc44qJQcvaIGwsNddQpxSa8zaoOWtGopUoasBKjZ+Le/VzHarMmvppI2ZPL+
 eWwnn1mSKF7mXFtXEG5G3/C7h6uy0JZHbsZ5BYtQQW44SVexFoRnhW6SawTAFjSTa9
 FNo3PWhHKhAYXhCYqJd0FffqGAsGbxIHWJHoxqdT3B8c8BRGJabqfKdNa+93nZl976
 0NvPpHxtVG+1g==
Date: Mon, 16 Oct 2023 11:59:08 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <svwawy3lzocyaq6zg2tvnocukjacv237ff3el627s4ecreezl6@yu2y7oexqpnv>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type
 to be DisplayPort
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 01:52:29AM +0300, Dmitry Baryshkov wrote:
> As it was pointed out by Simon Ser, the DRM_MODE_CONNECTOR_USB connector
> is reserved for the GUD devices. Other drivers (i915, amdgpu) use
> DRM_MODE_CONNECTOR_DisplayPort even if the DP stream is handled by the
> USB-C altmode. While we are still working on implementing the proper way
> to let userspace know that the DP is wrapped into USB-C, change
> connector type to be DRM_MODE_CONNECTOR_DisplayPort.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied, thanks.

> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 9569d999391d..6f8b2f7ae3cc 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -467,7 +467,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>  		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
>  		alt_port->bridge.of_node = to_of_node(fwnode);
>  		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
> -		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
> +		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  
>  		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
>  		if (ret) {
> -- 
> 2.39.2
> 
