Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1272751C4C
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 10:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1C610E0B5;
	Thu, 13 Jul 2023 08:55:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8631310E0B5
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 08:55:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7FF71576
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 01:55:50 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 05D683F740
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 01:55:07 -0700 (PDT)
Date: Thu, 13 Jul 2023 09:54:50 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Message-ID: <ZK-72h3fVj6PlGB0@e110455-lin.cambridge.arm.com>
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-4-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230713020556.1956639-4-cuigaosheng1@huawei.com>
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/komeda: Fix IS_ERR() vs NULL
 check in komeda_component_get_avail_scaler()
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
Cc: neil.armstrong@linaro.org, quic_eberman@quicinc.com, sam@ravnborg.org,
 quic_gurus@quicinc.com, airlied@gmail.com, linux-arm-msm@vger.kernel.org,
 a39.skl@gmail.com, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, james.qian.wang@arm.com, daniel@ffwll.ch,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello,

On Thu, Jul 13, 2023 at 10:05:56AM +0800, Gaosheng Cui wrote:
> The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.

While reviewing the change I've realised that komeda_pipeline_get_state_and_set_crtc()
is also mishandling the return value from komeda_pipeline_get_state(). If IS_ERR(st) is
true it should use return ERR_CAST(st), following the same pattern as komeda_pipeline_get_state().

If you don't want to update this patch I can send a separate patch. Otherwise,
the change looks good to me.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


> 
> Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
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
