Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46D701FD3
	for <lists+freedreno@lfdr.de>; Sun, 14 May 2023 23:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2C910E0DD;
	Sun, 14 May 2023 21:28:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007C710E0DC
 for <freedreno@lists.freedesktop.org>; Sun, 14 May 2023 21:27:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4290F3EBDB;
 Sun, 14 May 2023 23:27:55 +0200 (CEST)
Date: Sun, 14 May 2023 23:27:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <urzam676xk72tqxrgdadlg5hq6vbdjjqe4zizr3h2gunof4pwk@zidoswakq4ul>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-7-4cb21168c227@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v10-7-4cb21168c227@quicinc.com>
Subject: Re: [Freedreno] [PATCH v10 7/8] drm/msm/dsi: Use MSM and DRM DSC
 helper methods
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-12 14:32:17, Jessica Zhang wrote:
> 
> Use MSM and DRM DSC helper methods to configure DSC for DSI.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 74d38f90398a..9eeda018774e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -28,6 +28,7 @@
>  #include "dsi.xml.h"
>  #include "sfpb.xml.h"
>  #include "dsi_cfg.h"
> +#include "msm_dsc_helper.h"
>  #include "msm_kms.h"
>  #include "msm_gem.h"
>  #include "phy/dsi_phy.h"
> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	/* first calculate dsc parameters and then program
>  	 * compress mode registers
>  	 */
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> +	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>  
>  	/*
>  	 * If slice_count is greater than slice_per_intf
> @@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	if (dsc->slice_count > slice_per_intf)
>  		dsc->slice_count = 1;
>  
> -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	total_bytes_per_intf = msm_dsc_get_bytes_per_intf(dsc, hdisplay);

As said in the helper patch review, it seems more useful to just remove
this helper and kepe the original calculation, so that the reader is
aware that slice_per_intf is involved here (which is called within that
helper, but its value is already available).

- Marijn

>  
>  	eol_byte_num = total_bytes_per_intf % 3;
>  	pkt_per_line = slice_per_intf / dsc->slice_count;
> @@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  		return ret;
>  	}
>  
> -	dsc->initial_scale_value = 32;
> +	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
>  	dsc->line_buf_depth = dsc->bits_per_component + 1;
>  
>  	return drm_dsc_compute_rc_parameters(dsc);
> 
> -- 
> 2.40.1
> 
