Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BB638CA19
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 17:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618C26E3BB;
	Fri, 21 May 2021 15:29:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFC26E82B
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 15:29:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so7624268wmf.5
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lQZa3nF5KuYnerm4GLvju2DxCctG/p2J7D9NyuUkBqM=;
 b=dt1qnNiTnNH8FRdvLy1J/0tKQBFSQ3uYooI2fCgW3aJZqXUdbGz1sD0/Ycw3WiWQ7D
 tIEdeIg6H8Q51Kpxw4zMfOsDDeoyVeFkIowCThTaqaDhz38YNpr0BbtntTJ3M3izxMTh
 SxtALgBMTKAKnU/tJRQ/8ktg6DuDTMVBrPq9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lQZa3nF5KuYnerm4GLvju2DxCctG/p2J7D9NyuUkBqM=;
 b=ryuSnrYGlHJ8rj7Y24SoNzIYO96npCPKlVXskmDRn4VaNJQuesUFoBhsdVfqaj+itG
 l6H3u5StlosEdNrZyD4El3DXEr3Fi4mSX7g5YVBMK8yRWHpREog55pmdKggGCLk9aY3V
 Oi6dczFpU3JS9s3f90APRznun/w0ExIbUQ+jOS7b/pYM6RarC8M0Kx/LCfG0qd4xM4Fq
 IHDb5K8sqjtRNo9+XcTpwhPIUmCYnPu9kEQd/ZZbUaMA63KbTCvk0nDiqewTK0W1aMRz
 TE7G0IZTYOxz0bQBMHbqBmtMaWse9qshkQDBe6oMTPyU/3d6ZAgZ5yJsaTgjC+9M/nJH
 2SAw==
X-Gm-Message-State: AOAM533ENq/ZeC7wPs83fto1ZrKWCtTdB9+DGPMYOgMBoZivLqMoo43i
 g5h8GnHx1SFzRh5B+Ia8JhPLwA==
X-Google-Smtp-Source: ABdhPJyXe0znQ5LDPzXI9ISS+1RysJAiGcv2EjlURPsfwLAa62NVbU2C5NMOIKrc6RPMqRg406Z4sg==
X-Received: by 2002:a7b:cd16:: with SMTP id f22mr9489300wmj.8.1621610966950;
 Fri, 21 May 2021 08:29:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x4sm12492047wmj.17.2021.05.21.08.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:29:26 -0700 (PDT)
Date: Fri, 21 May 2021 17:29:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <YKfR1BGWa/CVYg9w@phenom.ffwll.local>
Mail-Followup-To: Vinod Koul <vkoul@kernel.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521124946.3617862-2-vkoul@kernel.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Subject: Re: [Freedreno] [RFC PATCH 01/13] drm/dsc: Add dsc pps header init
 function
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 06:19:30PM +0530, Vinod Koul wrote:
> We required a helper to create and set the dsc_dce_header, so add the
> dsc_dce_header and API drm_dsc_dsi_pps_header_init
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/drm_dsc.c | 11 +++++++++++
>  include/drm/drm_dsc.h     | 16 ++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
> index ff602f7ec65b..0c1b745090e2 100644
> --- a/drivers/gpu/drm/drm_dsc.c
> +++ b/drivers/gpu/drm/drm_dsc.c
> @@ -49,6 +49,17 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header)
>  }
>  EXPORT_SYMBOL(drm_dsc_dp_pps_header_init);
>  
> +void drm_dsc_dsi_pps_header_init(struct dsc_dce_header *dsc_header)

Kerneldoc for anything exported to drivers please, also ideally for all
the structures.

Thanks, Daniel
> +{
> +	memset(dsc_header, 0, sizeof(*dsc_header));
> +
> +	dsc_header->bp0 = 0x0A;
> +	dsc_header->bp1 = 1;
> +	dsc_header->bp4 = 10;
> +	dsc_header->bp6 = 128;
> +}
> +EXPORT_SYMBOL(drm_dsc_dsi_pps_header_init);
> +
>  /**
>   * drm_dsc_dp_rc_buffer_size - get rc buffer size in bytes
>   * @rc_buffer_block_size: block size code, according to DPCD offset 62h
> diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
> index bbe120f461e5..5a3bbeb3e12f 100644
> --- a/include/drm/drm_dsc.h
> +++ b/include/drm/drm_dsc.h
> @@ -602,8 +602,24 @@ struct drm_dsc_pps_infoframe {
>  	struct drm_dsc_picture_parameter_set pps_payload;
>  } __packed;
>  
> +struct dsc_dce_header {
> +	u8 bp0;
> +	u8 bp1;
> +	u8 bp2;
> +	u8 bp3;
> +	u8 bp4;
> +	u8 bp5;
> +	u8 bp6;
> +} __packed;
> +
> +struct drm_dsi_dsc_infoframe {
> +	struct dsc_dce_header dsc_header;
> +	struct drm_dsc_picture_parameter_set pps_payload;
> +} __packed;
> +
>  void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
> +void drm_dsc_dsi_pps_header_init(struct dsc_dce_header *dsc_header);
>  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>  				const struct drm_dsc_config *dsc_cfg);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
> -- 
> 2.26.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
