Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D573B5B9D
	for <lists+freedreno@lfdr.de>; Mon, 28 Jun 2021 11:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FC56E40C;
	Mon, 28 Jun 2021 09:49:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Mon, 28 Jun 2021 09:49:36 UTC
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884D96E40B
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jun 2021 09:49:36 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 26EF63E883;
 Mon, 28 Jun 2021 11:42:20 +0200 (CEST)
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, jonathan@marek.ca,
 dmitry.baryshkov@linaro.org, lee.jones@linaro.org, kalyan_t@codeaurora.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210628085033.9905-1-robert.foss@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <2bfd62c3-b0fb-7c86-0e79-a2d87b7daa77@somainline.org>
Date: Mon, 28 Jun 2021 11:42:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210628085033.9905-1-robert.foss@linaro.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v1] drm/msm/dpu: Fix sm8250_mdp register
 length
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Il 28/06/21 10:50, Robert Foss ha scritto:
> The downstream dts lists this value as 0x494, and not
> 0x45c.
> 
> Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 189f3533525c..5d30c7f33930 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -244,7 +244,7 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>   static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45C,
> +	.base = 0x0, .len = 0x494,
>   	.features = 0,
>   	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> 


OK on Xperia 5 II (SM8250)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
