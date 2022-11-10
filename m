Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A36E624703
	for <lists+freedreno@lfdr.de>; Thu, 10 Nov 2022 17:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A644310E002;
	Thu, 10 Nov 2022 16:31:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6D3910E002
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 16:31:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC0CB1FB
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 08:31:14 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6685D3F703
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 08:31:08 -0800 (PST)
Date: Thu, 10 Nov 2022 16:30:45 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Message-ID: <Y20nNWA1U+vJBl9y@e110455-lin.cambridge.arm.com>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-5-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110094445.2930509-5-cuigaosheng1@huawei.com>
Subject: Re: [Freedreno] [PATCH 4/5] drm/komeda: Fix IS_ERR() vs NULL check
 in komeda_component_get_avail_scaler()
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
Cc: emma@anholt.net, quic_akhilpo@quicinc.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, mihail.atanassov@arm.com, sam@ravnborg.org,
 airlied@gmail.com, james.qian.wang@arm.com, olvaffe@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 sean@poorly.run, vladimir.lypak@gmail.com, dianders@chromium.org,
 robdclark@gmail.com, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 05:44:44PM +0800, Gaosheng Cui wrote:
> The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the fix!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> index 3276a3e82c62..e9c92439398d 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> @@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
>  	u32 avail_scalers;
>  
>  	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
> -	if (!pipe_st)
> +	if (IS_ERR(pipe_st))
>  		return NULL;
>  
>  	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
