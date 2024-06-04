Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0C8FC043
	for <lists+freedreno@lfdr.de>; Wed,  5 Jun 2024 01:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6409A10E25E;
	Tue,  4 Jun 2024 23:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UGJdqg1f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2CD10E188
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 23:58:50 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52b7e693b8aso321292e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 16:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717545528; x=1718150328; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rp9nxGMclyuCeHHBHlnWIxO2+4DK9PTywFrhJz5uXfc=;
 b=UGJdqg1fEmtkCMmn4gzvbcO6sKef103gZBFnavgvILW3fx4L1voaYUIHhPQvzXURI+
 Bq8sLxGtemJ+Nc/FsRSMU9o1G0YsrA48+0b/1GsoFNlVgvwcgcEDOw6z6n+1ccmptbEh
 RF2TP87mV4+nSXC0bngecp6kIGCM0BJhbqh9u1PfFC6KTHkWEIqS7fJXcSCVCRRAusTA
 SK/qlZoBUVGG0ipjTPoY7ncyMuEcXBfxmRmhN/SPeAWM6uZURUyFiTYt+GSWOpw5gPCY
 tySFaiTuHxbrb+2+J1vJ7NFm62k0pQaRNUOBaTvUNEeya0h69RAojFn+XU9FqUtd9hBu
 RCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717545528; x=1718150328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rp9nxGMclyuCeHHBHlnWIxO2+4DK9PTywFrhJz5uXfc=;
 b=sqztVzSh3eYpfPbG1ER2zj7xAx4ZivBrtsRrrIcijvcxWjwkS3Yt4ntwGrEaF8xet2
 +E9XdIceOCzNFUQnGWrMnmNOKBhguFnVjHAaoJyIdn3yKxWiO5ULcnCykwBrlOYnI+yb
 TYVal5+To1fgeSIBri7SoOV1by5Sg1FJ96f1j7UoEVT0QEnFp4vuhDOyhkjwrZDRZb8p
 2A2VetB5lp7by52O2yg+zq/WPEbN0Q9h4bfIbLDnYwboJ/Zxs58/cxMUnis0N6ToFrHg
 aPdYzn/fX5WJnJEaiFRWfukraN3h0wnQn3/18Pr6RVeg1asU/dsIktawZ6lCudMgpT2A
 6hhQ==
X-Gm-Message-State: AOJu0YwpEfbVIobw33wneNbpuB5GBk0aYT8gYaWuUE6ipWL7AnxfpSFQ
 teqz0sZZmLmZhZr9qclHFE8Nwi+fhMjSzr5Q3tdckGXJeCPSZP4SY9xmZ+U94vg=
X-Google-Smtp-Source: AGHT+IGE5EAJbwmPWB5kOhL+AkptvaK72rTbxNWsv9SyRDnHh+4+XE5+D1sVii4uysOWoD6ZlewHtg==
X-Received: by 2002:a05:6512:3d9e:b0:520:359d:2145 with SMTP id
 2adb3069b0e04-52bab1d6879mr307776e87.20.1717545528496; 
 Tue, 04 Jun 2024 16:58:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d89ee8sm1624847e87.268.2024.06.04.16.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 16:58:48 -0700 (PDT)
Date: Wed, 5 Jun 2024 02:58:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Connor Abbott <cwabbott0@gmail.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler
 warnings for gen7_* includes
Message-ID: <x42z2ykkpx7qkn2lr3y5sl3lm2m3fl2asy7qvswgemz5bpu62w@drh7b7wihrwg>
References: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jun 04, 2024 at 02:51:04PM -0700, Abhinav Kumar wrote:
> GCC diagnostic pragma method throws below warnings in some of the versions
> 
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown option after '#pragma GCC diagnostic' kind [-Wpragmas]
>  #pragma GCC diagnostic ignored "-Wunused-const-variable"
>          ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning: 'gen7_0_0_external_core_regs__always_unused' defined but not used [-Wunused-variable]
>  static const u32 *gen7_0_0_external_core_regs__always_unused[] = {
>                    ^

I don't see this symbol in upstream.

> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning: 'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
>  static const u32 *gen7_2_0_external_core_regs[] = {
>                    ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning: 'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
>  static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
>                                            ^
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning: 'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
>  static const u32 *gen7_9_0_external_core_regs[] = {
> 
> Remove GCC dependency by using __always_unused for the unused gen7_* includes.
> 
> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 0a7717a4fc2f..62ca0cf24005 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -8,19 +8,10 @@
>  #include "a6xx_gpu_state.h"
>  #include "a6xx_gmu.xml.h"
>  
> -/* Ignore diagnostics about register tables that we aren't using yet. We don't
> - * want to modify these headers too much from their original source.
> - */
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wunused-variable"
> -#pragma GCC diagnostic ignored "-Wunused-const-variable"
> -
>  #include "adreno_gen7_0_0_snapshot.h"
>  #include "adreno_gen7_2_0_snapshot.h"
>  #include "adreno_gen7_9_0_snapshot.h"
>  
> -#pragma GCC diagnostic pop
> -
>  struct a6xx_gpu_state_obj {
>  	const void *handle;
>  	u32 *data;
> @@ -1350,6 +1341,10 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
>  	int index = 0;
>  	const u32 *pre_crashdumper_regs;
>  	const struct gen7_reg_list *reglist;
> +	__always_unused const u32 **external_core_regs7_0_0 = gen7_0_0_external_core_regs;
> +	__always_unused const u32 **external_core_regs_7_2_0 = gen7_2_0_external_core_regs;
> +	__always_unused const u32 **external_core_regs_7_9_0 = gen7_9_0_external_core_regs;
> +	__always_unused struct gen7_sptp_cluster_registers *sptp_gen7 = gen7_9_0_sptp_clusters;

Wouldn't it be easier to add something like the following to the
a6xx_gpu_state.c before including the headers:

static const unsigned int *gen7_0_0_external_core_regs[] __attribute((__unused__));
static const unsigned int *gen7_2_0_external_core_regs[] __attribute((__unused__));
static const unsigned int *gen7_9_0_external_core_regs[] __attribute((__unused__));

>  
>  	if (adreno_is_a730(adreno_gpu)) {
>  		reglist = gen7_0_0_reg_list;
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
