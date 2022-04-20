Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5860509071
	for <lists+freedreno@lfdr.de>; Wed, 20 Apr 2022 21:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAC210F1B2;
	Wed, 20 Apr 2022 19:27:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB4310F1B2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Apr 2022 19:27:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p10so4728330lfa.12
 for <freedreno@lists.freedesktop.org>; Wed, 20 Apr 2022 12:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RIUBFkbZrZkxS27rBDUvLlFldg+VYqMH2xYhKesN9xk=;
 b=hmiGe+xLzHjl+QbCVNJdlb49oLldlGxCylsU7/0wC/HDBfUQxRIYwiUQgTLZOLkbul
 duKTlQlnsjOIh6Buy8N8MucThrjEVKiR+rnTj8UDuNtTLblkVYvIg0MlAjEHvqyyvNnI
 nEx7jRZkpwC6otS1ibfSxxtbzvwjDKMcOJdql+acP2y48ljsi6RKrfFMdlk9aZxBS0PT
 HWXP7nusUyrkY6OjaYhzkDoA1HmXMwcg8o63vkK8ezIOe4MTPM5S4IOBi1s8uKyDYfHx
 MLQmFnJ50Fz3oRWpQhIWXel7JT3TIRUPFKv3ElPmtkE1y4KVXzWiAy0yRkF/gMM9uXYv
 /tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RIUBFkbZrZkxS27rBDUvLlFldg+VYqMH2xYhKesN9xk=;
 b=yfx1MviHWqNJsGjkZwsJ8QThsrnyj45ifbPR6KPAQUDDOLQi/muM75lhhSMR7oeESE
 je+R4UqFQNccU2AnLc39n+aLm5ouq9MrKHTL0sZU7xu/9jMAGr6UE6sog4V2L+lpLcIu
 29m0mc9EodBkFDQf1Kw8bOUWQdBwgtFgnLTTnqH7yMxBNGLrP8THA57su8otsFuk/X+T
 g3p1PRoF2RTeCC/ql6RwOGAKYexnOo+dG5kJ7CI7X+Z1qbayDhWtpj1tm9Suz8V5b/s0
 PfYeo1m0UZix+lrjViMJY/LsGf3exYO26kMekDUHgtpMVGf0VfgieSglxFfBZnCiBN1G
 JEuQ==
X-Gm-Message-State: AOAM531q9yScAFqNp2HJA3ROx0vu/t24u0YbddukXFA4HyCDqG455FTq
 yEQlM5wbGVuBnl/WenDzfSLq0Q==
X-Google-Smtp-Source: ABdhPJyvXV91q3XBpUnZ9wA9wvVxSI+iJ2lUYdCBzfe+nEQXaXT70tM92BJkt/jm46kudeZwjInQ4A==
X-Received: by 2002:a05:6512:110a:b0:471:9b68:34e3 with SMTP id
 l10-20020a056512110a00b004719b6834e3mr9962184lfg.150.1650482820601; 
 Wed, 20 Apr 2022 12:27:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a056512131700b004486c863c8esm1923628lfu.257.2022.04.20.12.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:27:00 -0700 (PDT)
Message-ID: <7591cb3a-3887-2b47-e48c-4f370b33c310@linaro.org>
Date: Wed, 20 Apr 2022 22:26:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-15-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-15-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 14/17] drm/msm/dpu: add the writeback
 connector layer
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/04/2022 04:46, Abhinav Kumar wrote:
> Introduce the dpu_writeback module which serves as the
> interface between dpu operations and the drm_writeback.
> 
> This module manages the connector related operations for
> dpu writeback.
> 
> changes in v2:
> 	- start using drm_writeback_connector_init_with_encoder()
> 	- drop unnecessary arguments from dpu_writeback_init()
> 	- rebase on msm-next tip and remove usage of priv->connectors
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/Makefile                  |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 68 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 25 ++++++++++
>   3 files changed, 94 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0387f22..66395ee 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -80,6 +80,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_plane.o \
>   	disp/dpu1/dpu_rm.o \
>   	disp/dpu1/dpu_vbif.o \
> +	disp/dpu1/dpu_writeback.o
>   
>   msm-$(CONFIG_DRM_MSM_MDSS) += \
>   	msm_mdss.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> new file mode 100644
> index 0000000..526d884
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "dpu_writeback.h"
> +
> +static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> +			dev->mode_config.max_height);
> +}
> +
> +static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
> +		struct drm_writeback_job *job)
> +{
> +	if (!job->fb)
> +		return 0;
> +
> +	dpu_encoder_prepare_wb_job(connector->encoder, job);
> +
> +	return 0;
> +}
> +
> +static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
> +		struct drm_writeback_job *job)
> +{
> +	if (!job->fb)
> +		return;
> +
> +	dpu_encoder_cleanup_wb_job(connector->encoder, job);
> +}
> +
> +static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
> +	.get_modes = dpu_wb_conn_get_modes,
> +	.prepare_writeback_job = dpu_wb_conn_prepare_job,
> +	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
> +};
> +
> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> +		const u32 *format_list, u32 num_formats)
> +{
> +	struct dpu_wb_connector *dpu_wb_conn;
> +	int rc = 0;
> +
> +	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
> +
> +	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> +
> +	/* DPU initializes the encoder and sets it up completely for writeback
> +	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> +	 * to initialize the writeback connector
> +	 */
> +	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> +			&dpu_wb_conn_funcs, format_list, num_formats);
> +
> +	return rc;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> new file mode 100644
> index 0000000..05aff05
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DPU_WRITEBACK_H
> +#define _DPU_WRITEBACK_H
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_writeback.h>
> +
> +#include "msm_drv.h"
> +#include "dpu_kms.h"
> +#include "dpu_encoder_phys.h"
> +
> +struct dpu_wb_connector {
> +	struct drm_writeback_connector base;
> +};
> +
> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> +		const u32 *format_list, u32 num_formats);
> +
> +#endif /*_DPU_WRITEBACK_H */


-- 
With best wishes
Dmitry
