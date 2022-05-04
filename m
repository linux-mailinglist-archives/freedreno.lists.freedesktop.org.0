Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6EA51A4AD
	for <lists+freedreno@lfdr.de>; Wed,  4 May 2022 17:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727F10F987;
	Wed,  4 May 2022 15:56:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D54810FB78
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 15:56:14 +0000 (UTC)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6ECAE3F75C;
 Wed,  4 May 2022 17:56:11 +0200 (CEST)
Message-ID: <5fac5a90-b646-2ac5-d992-d701c23dbf1f@somainline.org>
Date: Wed, 4 May 2022 17:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220503204340.935532-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220503204340.935532-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: fix address for second DSI PHY
 on SDM660
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 03/05/2022 22:43, Dmitry Baryshkov wrote:
> Correct a typo in the address of the second DSI PHY in the SDM660 device
> config.
>
> Fixes: 694dd304cc29 ("drm/msm/dsi: Add phy configuration for SDM630/636/660")
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Gah I'm blind, I think I even had a fixup for this locally at one point :P

In any case,

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 75557ac99adf..8199c53567f4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1062,7 +1062,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>   	},
>   	.min_pll_rate = VCO_MIN_RATE,
>   	.max_pll_rate = VCO_MAX_RATE,
> -	.io_start = { 0xc994400, 0xc996000 },
> +	.io_start = { 0xc994400, 0xc996400 },
>   	.num_dsi_phy = 2,
>   };
>   
>
